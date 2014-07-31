within TDL_v1.Wheel.ParametrizedModels;
model LinearSlip_195_65_R15_Set1
  "Parametrized: 195/65 R15 (Set 1 of linear slip tire model, r0=const.)"
  extends TDL_v1.Wheel.LinearSlip(
    final J=1,
    final tau=0.01,
    final stiffness=10000,
    final tableOnFile=false,
    final tableName="NoName",
    final fileName="NoName",
    final table=[0,0.3; 100,0.3],
    final wheelRadius(start=0.3));
  annotation (Documentation(info="<html>
Dummy parametrization of tire model.
See <a href=\"Modelica://PowerTrain.Chassis.Wheels.LinearSlip\">tire model</a>.
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
end LinearSlip_195_65_R15_Set1;
