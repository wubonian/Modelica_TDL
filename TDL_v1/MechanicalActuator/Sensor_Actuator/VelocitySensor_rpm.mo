within TDL_v1.MechanicalActuator.Sensor_Actuator;
model VelocitySensor_rpm
  extends Modelica.Icons.RotationalSensor;
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,0})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput rpm annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,0})));
  Modelica.Blocks.Math.Gain gain(k=30/Modelica.Constants.pi) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,0})));
equation
  connect(speedSensor.flange, flange_a) annotation (Line(
      points={{-40,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gain.u, speedSensor.w) annotation (Line(
      points={{18,0},{-19,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, rpm) annotation (Line(
      points={{41,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end VelocitySensor_rpm;
