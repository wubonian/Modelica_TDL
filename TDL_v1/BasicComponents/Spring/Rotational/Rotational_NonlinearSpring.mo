within TDL_v1.BasicComponents.Spring.Rotational;
model Rotational_NonlinearSpring
  extends
    BasicComponents.Spring.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearSpring;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  distance_rel = phi_rel;
  tau = -react_spring;
end Rotational_NonlinearSpring;
