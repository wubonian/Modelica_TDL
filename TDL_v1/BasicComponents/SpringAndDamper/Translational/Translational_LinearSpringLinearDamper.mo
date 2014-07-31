within TDL_v1.BasicComponents.SpringAndDamper.Translational;
model Translational_LinearSpringLinearDamper
  import SI = Modelica.SIunits;
  parameter SI.TranslationalSpringConstant c_LL;
  parameter SI.TranslationalDampingConstant d_LL;
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearSpringAndLinearDamper;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  c = c_LL;
  d = d_LL;
  distance_rel = s_rel;
  speed_rel = v_rel;
  f = -react;
  annotation(Documentation(info = "<html>
<pre><font style=\"color: #006400; \">Linear Spring Linear Damper</font></pre>
</html>"));
end Translational_LinearSpringLinearDamper;
