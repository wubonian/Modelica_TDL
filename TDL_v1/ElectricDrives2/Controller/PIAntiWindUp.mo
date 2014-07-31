within TDL_v1.ElectricDrives2.Controller;
model PIAntiWindUp
  "Proportional-integral controller with anti windup by means of variable limiter"
  import SI = Modelica.SIunits;
  extends Modelica.Blocks.Interfaces.SISO;

  parameter Real kp "Proportional part of the PI controller";
  parameter SI.Time Ti "Integral part of the PI controller";

  Modelica.Blocks.Continuous.Integrator integrator(k=1/Ti)
    annotation (Placement(transformation(extent={{-30,-16},{-10,4}})));
  Modelica.Blocks.Math.Gain gain(k=kp)
    annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,-40})));
  Modelica.Blocks.Math.Add add(k2=+1)
    annotation (Placement(transformation(extent={{-60,-16},{-40,4}})));
  Modelica.Blocks.Interfaces.RealInput limitUpper annotation (Placement(
        transformation(
        extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput limitLower annotation (Placement(
        transformation(
        extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Math.Gain magicGain(k=0.5)
    annotation (Placement(transformation(extent={{-10,-50},{-30,-30}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
equation
  connect(variableLimiter.limit1,limitUpper)  annotation (Line(
      points={{58,8},{50,8},{50,60},{-120,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(variableLimiter.limit2,limitLower)  annotation (Line(
      points={{58,-8},{50,-8},{50,-60},{-120,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator.y, add1.u2) annotation (Line(
      points={{-9,-6},{8,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, variableLimiter.u) annotation (Line(
      points={{31,0},{58,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, gain.y) annotation (Line(
      points={{8,6},{0,6},{0,20},{-70,20},{-70,0},{-79.4,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, add.u1) annotation (Line(
      points={{-79.4,0},{-62,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(magicGain.y, add.u2) annotation (Line(
      points={{-31,-40},{-70,-40},{-70,-12},{-62,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.u1, variableLimiter.y) annotation (Line(
      points={{38,-40},{90,-40},{90,0},{81,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.u2, add1.y) annotation (Line(
      points={{30,-32},{30,-20},{40,-20},{40,0},{31,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y,magicGain. u) annotation (Line(
      points={{21,-40},{-8,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, integrator.u) annotation (Line(
      points={{-39,-6},{-32,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(variableLimiter.y, y) annotation (Line(
      points={{81,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u, gain.u) annotation (Line(
      points={{-120,0},{-93.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}),
                      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Line(points={{-80,-80},{-80,-20},{60,80}}, color={0,0,127}),
        Text(
          extent={{4,36},{64,-26}},
          lineColor={192,192,192},
          textString="PI"),
        Text(
          extent={{-100,-100},{100,-130}},
          lineColor={0,0,0},
          textString="T=%Ti"),
        Text(
          extent={{-74,-30},{96,-60}},
          lineColor={192,192,192},
          textString="AntiWindup")}),
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>", info="<html>
<p>This block is a PI controller block together with an anti windup circuit preventing the regulator from oscillating because of the limiter. The <b>upper and lower limit</b> can be configured <b>by two real inputs</b>. Gain and time constant of the PI controller can be set by using the parameters kp and Ti, respectively.</p>
</html>"));
end PIAntiWindUp;
