within TDL_v1.BasicComponents.Damper.Rotational;
model Rotational_NonlinearDamper
  extends
    BasicComponents.Damper.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearDamper;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  speed_rel = w_rel;
  tau = -react_damper;
end Rotational_NonlinearDamper;
