within TDL_v1.BasicComponents.Friction.Rotational;
model Rotational_ContinuousTransientFriction
  extends Modelica.Mechanics.Rotational.Icons.Clutch;
  parameter Real parm_keci0 = 100000.0;
  parameter Real parm_keci1 = 300;
  parameter Real parm_keci2 = 0.4;
  parameter Real parm_mue = 0.2;
  parameter Real parm_cgeo = 1;
  extends
    Internal_Layer_Middle.Internal_Layer_Low.Internal_ContinuousTransientFriction;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
  Modelica.Blocks.Interfaces.RealInput f_input annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {0,100})));
equation
  keci0 = parm_keci0;
  keci1 = parm_keci1;
  keci2 = parm_keci2;
  mue = parm_mue;
  cgeo = parm_cgeo;
  f_pressure = f_input;
  speed_rel = w_rel;
  tau = friction;
end Rotational_ContinuousTransientFriction;
