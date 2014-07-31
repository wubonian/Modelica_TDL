within TDL_v1.Blocks.Types;
type LimiterInterpolation = enumeration(
    HardLimits "Hard limits (limits are always exactly fullfilled)",
    DefaultLimits
      "Default limits (limits are not fulfilled during event detection)",
    SmoothLimits "Smooth limits (limits are smoothed with a polynomial)")
  "Enumeration defining the type of interpolation for a limiter" annotation (
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"), Icon(graphics={Ellipse(
        extent={{-100,100},{100,-100}},
        lineColor={255,0,128},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Text(
        extent={{-94,94},{94,-94}},
        lineColor={255,0,128},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        textString="e")}));
