within TDL_v1.ElectricDrives2;
block AbsoluteValue "Calculate absolute value of Re and Im"
  extends Modelica.Blocks.Interfaces.BlockIcon;
  Modelica.Blocks.Interfaces.RealInput u_re
    "Real part of rectangular representation"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput u_im
    "Imaginary part of rectangular representation"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y_abs "Length of polar representation"
    annotation (Placement(transformation(extent={{100,-10},{120,10}},
          rotation=0)));

equation
   y_abs = sqrt(u_re*u_re + u_im*u_im);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}),
                      graphics),
                       Icon(graphics={
                               Text(
          extent={{-90,-47},{-40,-72}},
          lineColor={128,128,128},
          textString="im"),    Text(
          extent={{-90,73},{-40,48}},
          lineColor={128,128,128},
          textString="re"),    Text(
          extent={{30,13},{90,-12}},
          lineColor={128,128,128},
          textString="abs")}),
    Documentation(info="<html>
<p>
The input values of this block are the rectangular components
<code>u_re</code> and <code>u_im</code> of a phasor in two dimensions.
This block calculates the length <code>y_abs</code> and
the angle <code>y_arg</code> of the polar representation of this phasor.
</p>

<pre>
  y_abs = abs(u_re + j*u_im) = sqrt( u_re<sup>2</sup> + u_im<sup>2</sup> )
  y_arg = arg(u_re + j*u_im) = atan2(u_im, u_re)
</pre>
</html>", revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"));
end AbsoluteValue;
