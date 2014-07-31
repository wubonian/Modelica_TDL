within TDL_v1.BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_PartialDiscreteFriction
  "Base model of Coulomb friction elements"
  //extends Translational.Interfaces.PartialRigid;
  parameter Real speed_small = 0.001
    "Relative velocity near to zero (see model info text)";
  // Equations to define the following variables have to be defined in subclasses
  Real speed_rel "Relative velocity between frictional surfaces";
  Real acceleration_rel "Relative acceleration between frictional surfaces";
  //SI.Force f "Friction force (positive, if directed in opposite direction of v_rel)";
  Real friction0 "Friction force for v=0 and forward sliding";
  Real friction0_max "Maximum friction force for v=0 and locked";
  output Boolean free "true, if frictional element is not active";
  // Equations to define the following variables are given in this class
  Real sa(unit = "1")
    "Path parameter of friction characteristic f = f(a_relfric)";
  output Boolean startForward(start = false, fixed = true)
    "true, if v_rel=0 and start of forward sliding";
  output Boolean startBackward(start = false, fixed = true)
    "true, if v_rel=0 and start of backward sliding";
  output Boolean locked(start = false) "true, if v_rel=0 and not sliding";
  constant Integer Unknown = 3 "Value of mode is not known";
  constant Integer Free = 2 "Element is not active";
  constant Integer Forward = 1 "v_rel > 0 (forward sliding)";
  constant Integer Stuck = 0
    "v_rel = 0 (forward sliding, locked or backward sliding)";
  constant Integer Backward = -1 "v_rel < 0 (backward sliding)";
  output Integer mode(final min = Backward, final max = Unknown, start = Unknown, fixed = true);
protected
  constant Real unitAcceleration = 1 annotation(HideResult = true);
  constant Real unitFriction = 1 annotation(HideResult = true);
equation
  /* Friction characteristic
   (locked is introduced to help the Modelica translator determining
   the different structural configurations,
   if for each configuration special code shall be generated)
*/
  startForward = pre(mode) == Stuck and (sa > friction0_max / unitFriction or pre(startForward) and sa > friction0 / unitFriction) or pre(mode) == Backward and speed_rel > speed_small or initial() and speed_rel > 0;
  startBackward = pre(mode) == Stuck and (sa < (-friction0_max / unitFriction) or pre(startBackward) and sa < (-friction0 / unitFriction)) or pre(mode) == Forward and speed_rel < (-speed_small) or initial() and speed_rel < 0;
  locked = not free and not (pre(mode) == Forward or startForward or pre(mode) == Backward or startBackward);
  acceleration_rel / unitAcceleration = if locked then 0 else if free then sa else if startForward then sa - friction0_max / unitFriction else if startBackward then sa + friction0_max / unitFriction else if pre(mode) == Forward then sa - friction0_max / unitFriction else sa + friction0_max / unitFriction;
  /* Friction torque has to be defined in a subclass. Example for a clutch:
   f = if locked then sa else
       if free then   0 else
       cgeo*fn*(if startForward then          Math.tempInterpol1( v_relfric, mue_pos, 2) else
                if startBackward then        -Math.tempInterpol1(-v_relfric, mue_pos, 2) else
                if pre(mode) == Forward then  Math.tempInterpol1( v_relfric, mue_pos, 2) else
                                             -Math.tempInterpol1(-v_relfric, mue_pos, 2));
*/
  // finite state machine to determine configuration
  mode = if free then Free else if (pre(mode) == Forward or pre(mode) == Free or startForward) and speed_rel > 0 then Forward else if (pre(mode) == Backward or pre(mode) == Free or startBackward) and speed_rel < 0 then Backward else Stuck;
end Internal_PartialDiscreteFriction;
