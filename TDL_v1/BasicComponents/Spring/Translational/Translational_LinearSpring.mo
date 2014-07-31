within TDL_v1.BasicComponents.Spring.Translational;
model Translational_LinearSpring
  parameter Modelica.SIunits.TranslationalSpringConstant c_spring;
  extends
    BasicComponents.Spring.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearSpring;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  c = c_spring;
  distance_rel = s_rel;
  f = -react_spring;
end Translational_LinearSpring;
