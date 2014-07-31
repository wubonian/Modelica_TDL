within TDL_v1.BasicComponents.Friction.Translational;
model Translational_DiscreteComplexFriction_1
  parameter Real parm_mue = 0.2;
  parameter Real parm_cgeo = 1;
  parameter Real parm_k = 1.2;
  parameter Real parm_k_prop = 0.05;
  parameter Real parm_k_Stribeck = 2;
  Modelica.SIunits.Acceleration a_rel;
  extends
    Internal_Layer_Middle.Internal_Layer_Low.Internal_DiscreteComplexFriction_1;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  Modelica.Blocks.Interfaces.RealInput f_input annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {0,100})));
equation
  mue = parm_mue;
  cgeo = parm_cgeo;
  k = parm_k;
  k_prop = parm_k_prop;
  k_Stribeck = parm_k_Stribeck;
  f_pressure = f_input;
  speed_rel = v_rel;
  a_rel = der(v_rel);
  acceleration_rel = a_rel;
  f = friction;
end Translational_DiscreteComplexFriction_1;
