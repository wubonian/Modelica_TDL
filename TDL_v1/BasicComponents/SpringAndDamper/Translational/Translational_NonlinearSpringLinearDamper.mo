within TDL_v1.BasicComponents.SpringAndDamper.Translational;
model Translational_NonlinearSpringLinearDamper
  import SI = Modelica.SIunits;
  parameter SI.TranslationalDampingConstant d_NL;
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearSpringAndLinearDamper;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
equation
  d = d_NL;
  distance_rel = s_rel;
  speed_rel = v_rel;
  f = -react;
  annotation(Documentation(info = "<html>
<p>Nonlinear Spring and Linear Damper</p>
</html>"));
end Translational_NonlinearSpringLinearDamper;
