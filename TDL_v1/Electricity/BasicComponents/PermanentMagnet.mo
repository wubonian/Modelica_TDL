within TDL_v1.Electricity.BasicComponents;
model PermanentMagnet
  extends
    Modelica.Electrical.Machines.Losses.InductionMachines.PermanentMagnetLosses;
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r
    annotation (Placement(transformation(extent={{-100,90},{-80,110}})));
  Modelica.Blocks.Interfaces.RealInput Ie
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
equation
  spacePhasor_r.i_={-Ie,0};
annotation(Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
            100,100}}), graphics={
        Ellipse(
          extent={{-60,60},{60,20}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-60,-20},{60,-60}},
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,40},{60,0}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-90,100},{-70,106},{-70,94},{-90,100}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,0},{60,-40}},
          lineColor={0,255,0},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-60,-40},{-60,0}}, color={0,255,0}),
        Line(points={{60,-40},{60,0}}, color={0,255,0}),
        Line(points={{0,100},{-70,100}}, color={0,0,255}),
        Line(points={{0,100},{0,60}}, color={255,0,0})}), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PermanentMagnet;
