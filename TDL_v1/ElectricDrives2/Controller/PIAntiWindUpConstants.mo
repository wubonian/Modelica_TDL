within TDL_v1.ElectricDrives2.Controller;
model PIAntiWindUpConstants
  "Proportional-integral controller with anti windup by means of limiter"
  extends Modelica.Blocks.Interfaces.SISO;
  import SI = Modelica.SIunits;
  parameter Real kp "Proportional part of the PI controller";
  parameter SI.Time Ti "Integral part of the PI controller";
  parameter Real lowerLimit "Lower limit of output";
  parameter Real upperLimit "Upper limit of output";

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
  Modelica.Blocks.Nonlinear.Limiter variableLimiter(uMax=upperLimit, uMin=lowerLimit)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Math.Gain magicGain(k=0.5)
    annotation (Placement(transformation(extent={{-10,-50},{-30,-30}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
equation
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
  connect(u, gain.u) annotation (Line(
      points={{-120,0},{-93.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(variableLimiter.y, y) annotation (Line(
      points={{81,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Line(points={{-80,-80},{-80,-20},{60,80}}, color={0,0,127}),
        Text(
          extent={{4,36},{64,-26}},
          lineColor={192,192,192},
          textString="PI"),
        Text(
          extent={{-150,-150},{150,-110}},
          lineColor={0,0,0},
          textString="T=%Ti"),
        Text(
          extent={{-74,-28},{96,-64}},
          lineColor={192,192,192},
          textString="AntiWindup")}),
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>", info="<html>
<p>This block is a PI controller block together with an anti windup circuit preventing the regulator from oscillating because of the limiter. The <b>upper and lower limit</b> can be configured <b>by two parameters</b> upperLimit and lowerLimit. Gain and time constant of the PI controller can be set by using the parameters kp and Ti.</p>
</html>"));
end PIAntiWindUpConstants;
