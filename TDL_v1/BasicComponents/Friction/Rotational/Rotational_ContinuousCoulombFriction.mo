within TDL_v1.BasicComponents.Friction.Rotational;
model Rotational_ContinuousCoulombFriction
  extends Modelica.Mechanics.Rotational.Icons.Clutch;
  parameter Real parm_mue = 0.2;
  parameter Real parm_cgeo = 1;
  parameter Modelica.SIunits.AngularVelocity parm_w_limit = 0.01;
  // friction coefficient
  extends
    Internal_Layer_Middle.Internal_Layer_Low.Internal_ContinuousCoulombFriction;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
  Modelica.Blocks.Interfaces.RealInput f_input annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {0,100})));
equation
  mue=parm_mue;
  cgeo=parm_cgeo;
  speed_limit = parm_w_limit;
  f_pressure = f_input;
  speed_rel = w_rel;
  tau = friction;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end Rotational_ContinuousCoulombFriction;
