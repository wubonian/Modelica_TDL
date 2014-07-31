within TDL_v1.ElectricDrives2.Transformation;
model abc_to_alphabeta
    extends Modelica.Blocks.Interfaces.MIMO(final nin=3, final nout=2);

protected
  Real TransformMatrix[2,3] = 2/3*{{1,-1/2,-1/2},{0,sqrt(3)/2,-sqrt(3)/2}};

equation
  y = TransformMatrix*u;

  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{50,-2},{-2,-50}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{76,0},{-2,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(points={{-2,0},{-2,80},{-12,60},{8,60},{-2,80}}, color={0,0,
              255}),
        Line(
          points={{-2,0},{-50,72}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-48,-66},{-2,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(points={{-2,0},{78,0},{58,10},{58,-10},{78,0}}, color={0,0,
              255})}),                      Diagram(graphics),
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"));
end abc_to_alphabeta;
