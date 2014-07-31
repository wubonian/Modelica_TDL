within TDL_v1.MechanicalActuator.Sensor_Actuator;
model VelocitySensor_kmh
  extends Modelica.Icons.TranslationalSensor;
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Math.Gain gain(k=3.6)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Interfaces.RealOutput kmh
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(flange_a, speedSensor.flange) annotation (Line(
      points={{-100,0},{-40,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(speedSensor.v, gain.u) annotation (Line(
      points={{-19,0},{18,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, kmh) annotation (Line(
      points={{41,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end VelocitySensor_kmh;
