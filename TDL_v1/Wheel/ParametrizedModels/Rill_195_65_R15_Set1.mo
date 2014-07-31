within TDL_v1.Wheel.ParametrizedModels;
model Rill_195_65_R15_Set1
  "Parametrized Rill: 195/65 R15 (Set 1 of Rill tire model)"
  extends TDL_v1.Wheel.Rill(
    final J=1,
    final tableOnFile=false,
    final tableName="NoName",
    final fileName="NoName",
    final table=[0,0.3; 100,0.3],
    final tau=0.01,
    final k_mue=mue/mue_nom,
    final mue=1,
    final mue_nom=0.7,
    final wheelRadius(start=0.3),
    final data1(
      Fz_nom=3000,
      Fds=50000,
      s_max=0.15,
      F_max=3000,
      s_slide=0.4,
      F_slide=2800),
    final data2(
      Fz_nom=6000,
      Fds=75000,
      s_max=0.18,
      F_max=4500,
      s_slide=0.5,
      F_slide=4200));
  annotation (Documentation(info="<html>
Dummy parametrization of tire model.
See <a href=\"Modelica://PowerTrain.Chassis.Wheels.Rill\">tire model</a>.
</html>"),
       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Rectangle(
          extent={{-90,100},{90,60}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,100},{80,60}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="195/65 R15"),
        Line(points={{-60,-86},{-50,-100}}, color={0,0,0}),
        Line(points={{-40,-86},{-30,-100}}, color={0,0,0}),
        Line(points={{-20,-86},{-10,-100}}, color={0,0,0}),
        Line(points={{0,-86},{10,-100}}, color={0,0,0}),
        Line(points={{-80,-86},{-70,-100}}, color={0,0,0}),
        Line(points={{60,-86},{70,-100}}, color={0,0,0}),
        Line(points={{40,-86},{50,-100}}, color={0,0,0}),
        Line(points={{20,-86},{30,-100}}, color={0,0,0}),
        Line(points={{-80,-86},{80,-86}}, color={0,0,0})}));
end Rill_195_65_R15_Set1;
