within TDL_v1.BasicComponents.Friction.Translational;
model Translational_DiscreteComplexFriction_2
  parameter Real parm_cgeo = 1;
  // friction coefficient
  parameter Real parm_k = 1;
  Modelica.SIunits.Acceleration a_rel;
  extends
    Internal_Layer_Middle.Internal_Layer_Low.Internal_DiscreteComplexFriction_2;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  Modelica.Blocks.Interfaces.RealInput f_input annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {0,100})));
equation
  cgeo = parm_cgeo;
  k = parm_k;
  f_pressure = f_input;
  speed_rel = v_rel;
  a_rel = der(v_rel);
  acceleration_rel = a_rel;
  f = friction;
end Translational_DiscreteComplexFriction_2;
