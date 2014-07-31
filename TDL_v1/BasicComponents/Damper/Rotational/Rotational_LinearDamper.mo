within TDL_v1.BasicComponents.Damper.Rotational;
model Rotational_LinearDamper
  parameter Modelica.SIunits.RotationalDampingConstant d_spring;
  extends
    BasicComponents.Damper.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDamper;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  d = d_spring;
  speed_rel = w_rel;
  tau = -react_damper;
end Rotational_LinearDamper;
