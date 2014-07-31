within TDL_v1.Wheel;
model PacejkaMagic "Tire model according to Pacejka's Magic Formula"
  import Modelica.Math.exp;
  extends BaseClasses.Wheel_SlipNonlin(
    v_roll_min=0.1);

  parameter Real b1(unit="1/kN")=0 "Longitudinal coefficient b1"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real b2=1.5 "Longitudinal coefficient b2"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real b3(unit="1/kN")=0 "Longitudinal coefficient b3"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real b4=0.21 "Longitudinal coefficient b4"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real b5(unit="1/kN")=0 "Longitudinal coefficient b5"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real b6(unit="1/(kN2)")=0 "Longitudinal coefficient b6"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real b7(unit="1/kN")=0 "Longitudinal coefficient b7"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real b8=0.2 "Longitudinal coefficient b8"
    annotation (Dialog(group="Magic formula coefficients"));
  parameter Real C=1.5 "Longitudinal shape factor (=b0)"
    annotation (Dialog(group="Magic formula coefficients"));
  Real D "Peak value of force against slip";
  Real B "Stiffness factor";
  Real E "Curvature factor";
  // constant Real e=2.71828182846;
protected
  Real Fz_relv=Fz/1000 "Relevant nominal load";
  Real absslip;

equation
  carrierFlange.s = 0;

  D = (b1*Fz_relv + b2)*Fz_relv;
  B = (b3*Fz_relv^2 + b4*Fz_relv)/(C*D*exp(b5*Fz_relv));
  E = b6*Fz_relv^2 + b7*Fz_relv + b8;
  absslip = abs(slip)*100;
  fDrive = D*sin(C*atan(B*((1 - E)*absslip + (E/B)*atan(B*absslip))))*1000*sign(slip);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics),
                       Documentation(info="<html>
<p>
A semi-empirical tire model to calculate steady-state longitudinal force - the so-called
Magic Formula according to H.&nbsp;B.&nbsp;Pacejka, see <a href=\"#ref_pacejka\">References</a>.
<!--In particular, the elderly version is used here - the so-called Pacejka '94. -->
It uses following formula to get longitudinal tire force:
</p>
<pre>
   fDrive = D*sin{C*atan[B*((1 - E)*absslip + (E/B)*atan(B*absslip))]} * 1000*sign(slip);
</pre>
<p>where</p>
<pre>
   shape factor      C = b0,
   stiffness factor  B = (b3*Fz^2 + b4*Fz)/(C*D*e^(b5*Fz)),
   peak value        D = (b1*Fz + b2)*Fz,
   curvature factor  E = b6*Fz^2 + b7*Fz + b8,
   absslip = abs(slip)*100.
</pre>
<p>
See also <a href=\"Modelica://PowerTrain.Chassis.Wheels.BaseClasses.Wheel_Slip\">documentation</a> of the tire slip basis model.
</p>


<a name=\"sec_References\">
<h4>References</h4>
<dl>
<dt><a name=\"ref_pacejka\">Pacejka H. B. (2002):
   <dd><b>Tyre and vehicle dynamics</b>. Butterworth Heinemann.
</dl>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Text(
          extent={{-100,-80},{100,-40}},
          lineColor={135,135,135},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="Pacejka"),
        Line(points={{-80,-86},{80,-86}}, color={0,0,0}),
        Line(points={{-60,-86},{-50,-100}}, color={0,0,0}),
        Line(points={{-40,-86},{-30,-100}}, color={0,0,0}),
        Line(points={{-20,-86},{-10,-100}}, color={0,0,0}),
        Line(points={{0,-86},{10,-100}}, color={0,0,0}),
        Line(points={{-80,-86},{-70,-100}}, color={0,0,0}),
        Line(points={{60,-86},{70,-100}}, color={0,0,0}),
        Line(points={{40,-86},{50,-100}}, color={0,0,0}),
        Line(points={{20,-86},{30,-100}}, color={0,0,0}),
        Polygon(
          points={{40,100},{40,86},{70,80},{80,0},{100,0},{100,100},{40,
              100}},
          lineColor={0,127,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}));
end PacejkaMagic;
