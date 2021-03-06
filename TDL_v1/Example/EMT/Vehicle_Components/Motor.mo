within TDL_v1.Example.EMT.Vehicle_Components;
model Motor
  extends TDL_v1.Templates.ElectricDrives.Base(
    final usingMultiBodySystem=false,
    usingFaultBus=false,
    final usingMount=false);

  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-110,70},{-90,90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{-110,-90},{-90,-70}})));
  ElectricDrives.PMSM pMSM
    annotation (Placement(transformation(extent={{-60,-30},{20,30}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor
    annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  MechanicalActuator.Sensor_Actuator.VelocitySensor_rpm
    velocitySensor_rpm annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,50})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={-70,44})));
equation
  connect(pMSM.pin_p, pin_p) annotation (Line(
      points={{-58.6667,-9},{-90,-9},{-90,80},{-100,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pMSM.pin_n, pin_n) annotation (Line(
      points={{-58.6667,-27},{-90,-27},{-90,-80},{-100,-80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pMSM.Torque_Or_Speed, messageBus.Motor_TrqOrN) annotation (Line(
      points={{-60,18},{-80,18},{-80,100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(pMSM.Speed_Require, messageBus.Nm_Req) annotation (Line(
      points={{-60,9},{-80,9},{-80,100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(pMSM.Direction, messageBus.dirction) annotation (Line(
      points={{-60,0},{-80,0},{-80,100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(torqueSensor.flange_a, pMSM.flange_a) annotation (Line(
      points={{60,0},{20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueSensor.flange_b, shaft_b.flange) annotation (Line(
      points={{80,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueSensor.tau, messageBus.TmAct) annotation (Line(
      points={{62,11},{62,100},{-80,100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(velocitySensor_rpm.flange_a, pMSM.flange_a) annotation (Line(
      points={{40,40},{40,0},{20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(velocitySensor_rpm.rpm, messageBus.NmAct) annotation (Line(
      points={{40,60},{40,100},{-80,100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(gain.y, pMSM.Torque_Require) annotation (Line(
      points={{-70,39.6},{-70,28},{-60,28},{-60,27}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, messageBus.TmReq) annotation (Line(
      points={{-70,48.8},{-70,60},{-80,60},{-80,100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Motor;
