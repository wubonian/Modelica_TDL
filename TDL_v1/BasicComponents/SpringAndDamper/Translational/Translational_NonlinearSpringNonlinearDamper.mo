within TDL_v1.BasicComponents.SpringAndDamper.Translational;
model Translational_NonlinearSpringNonlinearDamper
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearSpringAndNonlinearDamper;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  distance_rel = s_rel;
  speed_rel = v_rel;
  f = -react;
  annotation(Documentation(info = "<html>
<p>Nonlinear Spring and Nonlinear Damper</p>
</html>"));
end Translational_NonlinearSpringNonlinearDamper;
