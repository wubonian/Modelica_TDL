within TDL_v1.BasicComponents.Friction.Translational;
model Translational_ContinuousCoulombFriction
  parameter Real parm_mue = 0.2;
  parameter Real parm_cgeo = 1;
  // friction coefficient
  parameter Modelica.SIunits.Velocity parm_v_limit = 0.01;
  extends
    Internal_Layer_Middle.Internal_Layer_Low.Internal_ContinuousCoulombFriction;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  Modelica.Blocks.Interfaces.RealInput f_input annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {0,100})));
equation
  mue = parm_mue;
  cgeo = parm_cgeo;
  speed_limit = parm_v_limit;
  f_pressure = f_input;
  speed_rel = v_rel;
  f = friction;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end Translational_ContinuousCoulombFriction;
