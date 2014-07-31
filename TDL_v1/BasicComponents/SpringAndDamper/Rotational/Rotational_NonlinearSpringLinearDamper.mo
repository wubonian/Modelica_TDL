within TDL_v1.BasicComponents.SpringAndDamper.Rotational;
model Rotational_NonlinearSpringLinearDamper
  import SI = Modelica.SIunits;
  parameter SI.RotationalDampingConstant d_NL;
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearSpringAndLinearDamper;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  d = d_NL;
  distance_rel = phi_rel;
  speed_rel = w_rel;
  tau = -react;
  annotation(Documentation(info = "<html>
<p>Nonlinear Spring and Linear Damper</p>
</html>"));
end Rotational_NonlinearSpringLinearDamper;
