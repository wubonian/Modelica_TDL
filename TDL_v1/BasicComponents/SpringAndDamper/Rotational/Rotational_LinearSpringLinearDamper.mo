within TDL_v1.BasicComponents.SpringAndDamper.Rotational;
model Rotational_LinearSpringLinearDamper
  import SI = Modelica.SIunits;
  parameter SI.RotationalSpringConstant c_LL;
  parameter SI.RotationalDampingConstant d_LL;
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearSpringAndLinearDamper;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  c = c_LL;
  d = d_LL;
  distance_rel = phi_rel;
  speed_rel = w_rel;
  tau = -react;
  annotation(Documentation(info = "<html>
<pre><font style=\"color: #006400; \">Linear Spring Linear Damper</font></pre>
</html>"));
end Rotational_LinearSpringLinearDamper;
