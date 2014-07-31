within TDL_v1.ElectricDrives2.Transformation;
model alphabeta_to_abc
    extends Modelica.Blocks.Interfaces.MIMO(final nin=2, final nout=3);

protected
  Real TransformMatrix[3,2] = {{1,0},{-1/2,sqrt(3)/2},{-1/2,-sqrt(3)/2}};

equation
  y = TransformMatrix*u;

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
        Rectangle(
          extent={{50,-2},{-2,-50}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,0},{-48,72}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-46,-66},{0,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{78,0},{0,0}},
          color={0,0,255},
          smooth=Smooth.None)}),            Diagram(graphics),
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"));
end alphabeta_to_abc;
