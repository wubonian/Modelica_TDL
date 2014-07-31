within TDL_v1.BasicComponents.SpringAndDamper.Translational;
model Translational_LinearSpringNonlinearDamper
  import SI = Modelica.SIunits;
  parameter SI.TranslationalSpringConstant c_LN;
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearSpringAndNonlinearDamper;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  c = c_LN;
  distance_rel = s_rel;
  speed_rel = v_rel;
  f = -react;
  annotation(Documentation(info = "<html>
<p>Linear Spring and Nonlinear Damper</p>
</html>"));
end Translational_LinearSpringNonlinearDamper;
