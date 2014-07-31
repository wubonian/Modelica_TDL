within TDL_v1.BasicComponents.SpringAndDamper.Rotational;
model Rotational_NonlinearSpringNonlinearDamper
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearSpringAndNonlinearDamper;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  distance_rel = phi_rel;
  speed_rel = w_rel;
  tau = -react;
  annotation(Documentation(info = "<html>
<p>Nonlinear Spring and Nonlinear Damper</p>
</html>"));
end Rotational_NonlinearSpringNonlinearDamper;
