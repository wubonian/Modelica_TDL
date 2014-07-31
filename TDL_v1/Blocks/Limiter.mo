within TDL_v1.Blocks;
block Limiter "Limit the range of a signal (optionally smooth curve)"
  extends Modelica.Blocks.Interfaces.SISO;

  parameter Real uMax=1 "Upper limits of input signals";
  parameter Real uMin= -uMax "Lower limits of input signals";
  parameter TDL_v1.Blocks.Types.LimiterInterpolation limitInterpolation=TDL_v1.Blocks.Types.LimiterInterpolation.DefaultLimits
    "Type of output signal interpolation around limits";
  parameter Real relTol(min=10*Modelica.Constants.eps, max=0.5) = 0.1
    "Relative tolerance for smoothing" annotation(Dialog(enable=limitInterpolation==PowerTrain.Utilities.Types.LimiterInterpolation.SmoothLimits));

  encapsulated function polySpecial "Evaluate special polynomial"
    extends Modelica.Icons.Function;
    import Modelica;

    input Real u1 "Abszissa of minimum";
    input Real y1 "Ordinate of minimum";
    input Real u2 "Abszissa of another point on the polynomial";
    input Real y2 "Ordinate of another point on the polynomial";
    input Real u "Actual abszissa value";
    output Real y "Actual ordinate value";
  algorithm
    y := smooth(1, if (u - u1)/(u2 - u1) < 0 then y1 else y1 + (y2 - y1)*((u - u1)/(u2 - u1))^2);
    annotation (Documentation(info="<html>
<p>
Evaluate second order polynomial with the following properties:
</p>
 
<ul>
<li> The polynomial passes the two points (u1,y1) and (u2,y2).</li>
<li> The minimum of the polynomial is at (u1,y1), i.e., du/dy = 0 at u1.</li>
</ul> 
</html>", revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"));
  end polySpecial;

protected
  parameter Real absTol = relTol*(uMax - uMin)/2;
equation
  assert(uMax >= uMin, "Limiter: Limits must be consistent. However, uMax (=" + String(uMax) +
                       ") < uMin (=" + String(uMin) + ")");
  if initial() then
     y = u;
  elseif limitInterpolation == TDL_v1.Blocks.Types.LimiterInterpolation.HardLimits
       then
     y = smooth(0, noEvent(if u > uMax then uMax else if u < uMin then uMin else u));
  elseif limitInterpolation == TDL_v1.Blocks.Types.LimiterInterpolation.DefaultLimits
       then
     y = smooth(0, if u > uMax then uMax else if u < uMin then uMin else u);
  else
    y = smooth(1, noEvent(if u > uMax - absTol then
      TDL_v1.Blocks.Limiter.polySpecial(
      uMax + absTol,
      uMax,
      uMax - absTol,
      uMax - absTol,
      u) else if u < uMin + absTol then TDL_v1.Blocks.Limiter.polySpecial(
      uMin - absTol,
      uMin,
      uMin + absTol,
      uMin + absTol,
      u) else u));
  end if;
  annotation (
    Documentation(info="<html>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
 
<p>
Optionally, the characteristic is changed so that the output has a
continuous first derivative by \"rounding\" the limitation ranges with
a second order polynomial. A typical characteristic (with a large rounding)
is shown in the next figure;
</p>
 
<p>
<img src=\"modelica://PowerTrain/Resources/Images/Utilities/LimiterPoly.png\">
</p>
 
 
<h3>Note</h3>
<p>Changes to Limiter from Modelica library: without limitsAtInit 
 and without assert at initial time and optionally smooth curve.</p>
</html>
", revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{0,-90},{0,68}}, color={192,192,192}),
        Polygon(
          points={{0,90},{-8,68},{8,68},{0,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{68,0}}, color={192,192,192}),
        Polygon(
          points={{90,0},{68,-8},{68,8},{90,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
        Text(
          extent={{-150,-140},{150,-100}},
          lineColor={0,0,0},
          textString="uMax=%uMax")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Line(points={{0,-60},{0,50}}, color={192,192,192}),
        Polygon(
          points={{0,60},{-5,50},{5,50},{0,60}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-60,0},{50,0}}, color={192,192,192}),
        Polygon(
          points={{60,0},{50,-5},{50,5},{60,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
        Text(
          extent={{-28,62},{-3,42}},
          lineColor={128,128,128},
          textString="y"),
        Text(
          extent={{26,40},{66,56}},
          lineColor={128,128,128},
          textString="uMax"),
        Text(
          extent={{-64,-58},{-24,-42}},
          lineColor={128,128,128},
          textString="uMin"),
        Text(
          extent={{42,-4},{67,-24}},
          lineColor={128,128,128},
          textString="u")}));
end Limiter;
