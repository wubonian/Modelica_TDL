within TDL_v1.Example.EMT.Vehicle_Components;
model Brakes
  extends TDL_v1.Templates.Brakes.TwoAxleBase(final usingMultiBodyChassis=false,
      final usingBrakePedal=false);

  Controllers.ABS aBS annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,0})));
  Modelica.Mechanics.Rotational.Components.Brake frontRight_Brake
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,60})));
  Modelica.Mechanics.Rotational.Components.Brake rearRight_Brake
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,60})));
  Modelica.Mechanics.Rotational.Components.Brake frontLeft_Brake
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-50})));
  Modelica.Mechanics.Rotational.Components.Brake rearLeft_Brake
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-50})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{30,20},{10,40}})));
  Modelica.Blocks.Math.Gain rads2kmh(k=1.08)
    annotation (Placement(transformation(extent={{-10,20},{-30,40}})));
equation
  connect(aBS.messageBus, messageBus) annotation (Line(
      points={{-60,1.77636e-015},{-100,1.77636e-015},{-100,60}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(frontRight_Brake.flange_b, wheelHub_2.flange) annotation (
      Line(
      points={{-60,70},{-60,100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rearRight_Brake.flange_b, wheelHub_4.flange) annotation (Line(
      points={{60,70},{60,100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(frontLeft_Brake.flange_a, wheelHub_1.flange) annotation (Line(
      points={{-60,-60},{-60,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rearLeft_Brake.flange_a, wheelHub_3.flange) annotation (Line(
      points={{60,-60},{60,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(aBS.Brake_Pedal, frontLeft_Brake.f_normalized) annotation (
      Line(
      points={{-50,-10},{-50,-20},{-80,-20},{-80,-50},{-71,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aBS.Brake_Pedal, frontRight_Brake.f_normalized) annotation (
      Line(
      points={{-50,-10},{-50,-20},{-80,-20},{-80,60},{-71,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aBS.Brake_Pedal, rearLeft_Brake.f_normalized) annotation (
      Line(
      points={{-50,-10},{-50,-20},{40,-20},{40,-50},{49,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aBS.Brake_Pedal, rearRight_Brake.f_normalized) annotation (
      Line(
      points={{-50,-10},{-50,-20},{40,-20},{40,60},{49,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speedSensor.flange, rearRight_Brake.flange_a) annotation (
      Line(
      points={{30,30},{60,30},{60,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rads2kmh.u, speedSensor.w) annotation (Line(
      points={{-8,30},{9,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rads2kmh.y, aBS.Vehicle_Spd) annotation (Line(
      points={{-31,30},{-50,30},{-50,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Brakes;
