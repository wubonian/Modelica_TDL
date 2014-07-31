within TDL_v1.BasicComponents.Spring.Rotational;
model Rotational_LinearSpring
  parameter Modelica.SIunits.RotationalSpringConstant c_spring;
  extends
    BasicComponents.Spring.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearSpring;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  c = c_spring;
  distance_rel = phi_rel;
  tau = -react_spring;
end Rotational_LinearSpring;
