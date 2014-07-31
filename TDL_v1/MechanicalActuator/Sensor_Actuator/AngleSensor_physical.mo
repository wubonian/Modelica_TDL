within TDL_v1.MechanicalActuator.Sensor_Actuator;
model AngleSensor_physical
  extends Modelica.Icons.RotationalSensor;
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Sensor sensor(
    parm_u_bias=parm_u_bias,
    parm_y_bias=parm_y_bias,
    parm_resolution=parm_resolution)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  parameter Real parm_u_bias;
  parameter Real parm_y_bias;
  parameter Real parm_resolution;
  Modelica.Blocks.Interfaces.RealOutput physical
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation

  connect(flange_a, angleSensor.flange) annotation (Line(
      points={{-100,0},{-50,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sensor.u_input, angleSensor.phi) annotation (Line(
      points={{20,0},{-29,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(physical, sensor.y_output) annotation (Line(
      points={{100,0},{41,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}), graphics));
end AngleSensor_physical;
