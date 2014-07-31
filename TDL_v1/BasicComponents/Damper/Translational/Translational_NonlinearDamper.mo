within TDL_v1.BasicComponents.Damper.Translational;
model Translational_NonlinearDamper
  extends
    BasicComponents.Damper.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearDamper;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  speed_rel = v_rel;
  f = -react_damper;
end Translational_NonlinearDamper;
