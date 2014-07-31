within TDL_v1.Wheel.ParametrizedModels;
model Pacejka_195_65_R15_Set2
  "Parametrized Magic: 195/65 R15 (Set 2 of Pacejka tire model)"
  extends TDL_v1.Wheel.PacejkaMagic(
    final J=1,
    final tau=0.01,
    final b1=0,
    final b2=1.5,
    final b3=0,
    final b4=0.21,
    final b5=0,
    final b6=0,
    final b7=0,
    final b8=0.2,
    final C=1.5,
    final tableOnFile=true,
    final fileName="RollingRadius.txt",
    final tableName="rollingRadius",
    final table=[0,1; 100,1],
    final wheelRadius(start=0.3));
  annotation (Documentation(info="<html>
Dummy parametrization of tire model.
See <a href=\"Modelica://PowerTrain.Chassis.Wheels.PacejkaMagic\">tire model</a>.
</html>"),
       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={Rectangle(
          extent={{-90,100},{90,60}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-80,100},{80,60}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="195/65 R15")}));
end Pacejka_195_65_R15_Set2;
