within TDL_v1.BasicComponents.Damper.Translational;
model Translational_LinearDamper
  parameter Modelica.SIunits.TranslationalDampingConstant d_spring;
  extends
    BasicComponents.Damper.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDamper;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  d = d_spring;
  speed_rel = v_rel;
  f = -react_damper;
end Translational_LinearDamper;
