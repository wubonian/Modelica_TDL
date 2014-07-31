within TDL_v1.Engine;
model Engine
  Modelica.Blocks.Interfaces.RealInput torque_req
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput speed_act_rpm annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,100})));
  Modelica.Blocks.Interfaces.RealOutput torque_act annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,100})));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction(tau_pos=[
        0,1])
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.03)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(a={0.1,1}) annotation(Placement(transformation(extent={{-10,-10},
            {10,10}},                                                                                                  rotation=0,    origin={-70,0})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation(Placement(transformation(extent={{32,8},{
            48,-8}})));
  MechanicalActuator.Sensor_Actuator.VelocitySensor_rpm velocitySensor_rpm
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,50})));
equation
  connect(bearingFriction.flange_b, flange_a) annotation (Line(
      points={{80,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transferFunction.u, torque_req) annotation (Line(
      points={{-82,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(torque.tau, transferFunction.y) annotation (Line(
      points={{-42,0},{-59,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inertia.flange_a, torque.flange) annotation (Line(
      points={{0,0},{-20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueSensor.flange_a, inertia.flange_b) annotation (Line(
      points={{32,0},{20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueSensor.flange_b, bearingFriction.flange_a) annotation (Line(
      points={{48,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueSensor.tau, torque_act) annotation (Line(
      points={{33.6,8.8},{40,8.8},{40,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(velocitySensor_rpm.flange_a, inertia.flange_a) annotation (Line(
      points={{-10,40},{-10,0},{0,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(velocitySensor_rpm.rpm, speed_act_rpm) annotation (Line(
      points={{-10,60},{-10,80},{-40,80},{-40,100}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics));
end Engine;
