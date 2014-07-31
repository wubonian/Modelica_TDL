within TDL_v1.BasicComponents.SpringAndDamper.Rotational;
model Rotational_LinearSpringNonlinearDamper
  import SI = Modelica.SIunits;
  parameter SI.RotationalSpringConstant c_LN;
  extends
    BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearSpringAndNonlinearDamper;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
equation
  c = c_LN;
  distance_rel = phi_rel;
  speed_rel = w_rel;
  tau = -react;
  annotation(Documentation(info = "<html>
<p>Linear Spring and Nonlinear Damper</p>
</html>"));
end Rotational_LinearSpringNonlinearDamper;
