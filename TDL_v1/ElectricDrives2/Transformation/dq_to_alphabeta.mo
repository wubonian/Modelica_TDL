within TDL_v1.ElectricDrives2.Transformation;
model dq_to_alphabeta
    extends Modelica.Blocks.Interfaces.MIMOs(final n=2);

protected
  Real RotationMatrix[2,2] = {{+cos(+angle),-sin(+angle)},{+sin(+angle),+cos(+angle)}};

public
  Modelica.Blocks.Interfaces.RealInput angle
    annotation (Placement(transformation(
        origin={0,-120},
        extent={{-20,-20},{20,20}},
        rotation=90)));

equation
  y = RotationMatrix*u;

  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{0,0},{0,80},{-10,60},{10,60},{0,80}}, color={0,0,
              255}),
        Line(points={{0,0},{80,0},{60,10},{60,-10},{80,0}}, color={0,0,
              255}),
        Ellipse(extent={{-50,50},{50,-50}}, lineColor={0,0,255}),
        Rectangle(
          extent={{-50,50},{-2,-50}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{50,-2},{-2,-50}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{50,0},{42,14},{54,16},{50,0}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-88,-72},{84,-92}},
          lineColor={0,0,0},
          textString="angle")}),            Diagram(graphics),
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"));
end dq_to_alphabeta;
