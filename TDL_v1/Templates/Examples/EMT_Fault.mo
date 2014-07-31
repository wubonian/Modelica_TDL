within TDL_v1.Templates.Examples;
model EMT_Fault

  replaceable TDL_v1.Templates.Transmission.Base transmission(usingMotor=true,
      usingFaultBus=true)
    annotation (Placement(transformation(extent={{-28,0},{-8,20}})));
  replaceable TDL_v1.Templates.Engine.Base engine(usingAccessories=false,
      usingFaultBus=true)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  replaceable TDL_v1.Templates.ElectricDrives.Base motor(usingFaultBus=true)
    annotation (Placement(transformation(extent={{-62,-40},{-42,-20}})));
  replaceable TDL_v1.Templates.EnergyStorage.Base battery(usingFaultBus=true)
    annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
  replaceable TDL_v1.Templates.Drivelines.TwoAxleBase driveline(usingFaultBus=
        true) annotation (Placement(transformation(extent={{12,0},{32,20}})));
  replaceable TDL_v1.Templates.Brakes.TwoAxleBase brakes(usingFaultBus=true)
    annotation (Placement(transformation(extent={{52,0},{72,20}})));
  replaceable TDL_v1.Templates.Chassis.TwoAxleBase chassis(usingFaultBus=true)
    annotation (Placement(transformation(extent={{92,0},{124,20}})));
  Bus.MessageBus.MessageControlBus messageBus annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,50})));
  replaceable Drivers.Base base
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  replaceable DriverEnvironment.DriverEnvironment driverEnvironment
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  replaceable Controllers.Base mCU annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={150,50})));
  replaceable FaultMonitor.Base faultTrigger annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={150,-70})));
  Bus.FaultBus.FaultBus faultBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,-70})));
equation
  connect(engine.transmissionFlange, transmission.engineFlange) annotation (
      Line(
      points={{-80,10},{-28,10}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(motor.shaft_b, transmission.motorFlange) annotation (Line(
      points={{-42,-30},{-36,-30},{-36,4},{-28,4}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(battery.pin_p, motor.pin_p) annotation (Line(
      points={{-100,-22},{-62,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(battery.pin_n, motor.pin_n) annotation (Line(
      points={{-100,-38},{-62,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(transmission.drivelineFlange, driveline.transmissionFlange)
    annotation (Line(
      points={{-8,10},{12,10}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driveline.wheelHub_2, brakes.wheelHub_2) annotation (Line(
      points={{16,20},{16,30},{56,30},{56,20}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
      points={{99,20},{100,20},{100,30},{16,30},{16,20}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driveline.wheelHub_1, brakes.wheelHub_1) annotation (Line(
      points={{16,0},{16,-8},{56,-8},{56,0}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
      points={{99,0},{100,0},{100,-8},{16,-8},{16,0}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driveline.wheelHub_4, brakes.wheelHub_4) annotation (Line(
      points={{28,20},{28,36},{68,36},{68,20}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
      points={{28,20},{28,36},{117,36},{117,20}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driveline.wheelHub_3, brakes.wheelHub_3) annotation (Line(
      points={{28,0},{28,-14},{68,-14},{68,0}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
      points={{28,0},{28,-14},{117,-14},{117,0}},
      color={135,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(messageBus, battery.messageBus) annotation (Line(
      points={{-140,50},{-118,50},{-118,-20}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(messageBus, engine.messageBus) annotation (Line(
      points={{-140,50},{-96,50},{-96,20}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(messageBus, motor.messageBus) annotation (Line(
      points={{-140,50},{-60,50},{-60,-20}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(messageBus, transmission.messageBus) annotation (Line(
      points={{-140,50},{-24,50},{-24,20}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(messageBus, driveline.messageBus) annotation (Line(
      points={{-140,50},{4,50},{4,17},{12,17}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(messageBus, brakes.messageBus) annotation (Line(
      points={{-140,50},{46,50},{46,16},{52,16}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(messageBus, chassis.messageBus) annotation (Line(
      points={{-140,50},{84,50},{84,18},{92,18}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(base.Environment_Interface, driverEnvironment.Environment_Interface)
    annotation (Line(
      points={{-40,90},{-10,90}},
      color={85,85,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driverEnvironment.messageBus, messageBus) annotation (Line(
      points={{10,90},{20,90},{20,50},{-140,50}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(mCU.messageBus, messageBus) annotation (Line(
      points={{140,50},{-140,50}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(engine.faultBus, faultTrigger.faultBus) annotation (Line(
      points={{-84,20},{-80,20},{-80,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(battery.faultBus, faultTrigger.faultBus) annotation (Line(
      points={{-102,-20},{-96,-20},{-96,-70},{140,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(motor.faultBus, faultTrigger.faultBus) annotation (Line(
      points={{-44,-20},{-38,-20},{-38,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(transmission.faultBus, faultTrigger.faultBus) annotation (Line(
      points={{-12,20},{-4,20},{-4,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(driveline.faultBus, faultTrigger.faultBus) annotation (Line(
      points={{32,17},{36,17},{36,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(brakes.faultBus, faultTrigger.faultBus) annotation (Line(
      points={{72,16},{76,16},{76,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(chassis.faultBus, faultTrigger.faultBus) annotation (Line(
      points={{124.05,18},{128,18},{128,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(faultBus, faultTrigger.faultBus) annotation (Line(
      points={{-140,-70},{140,-70}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{180,120}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-150,-100},{180,120}})));
end EMT_Fault;
