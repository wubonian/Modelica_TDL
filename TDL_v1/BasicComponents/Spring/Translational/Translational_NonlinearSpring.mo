within TDL_v1.BasicComponents.Spring.Translational;
model Translational_NonlinearSpring
  extends
    BasicComponents.Spring.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearSpring;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  distance_rel = s_rel;
  f = -react_spring;
end Translational_NonlinearSpring;
