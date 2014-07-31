within TDL_v1.ElectricDrives;
model PMSM_Fault
  PMSMsystem.system.PMSMControl Controller
    annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
  PMSMsystem.system.PMSM_withoutPWM Invertor
    annotation (Placement(transformation(extent={{0,-40},{40,0}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(
      terminalConnection="Y")
    annotation (Placement(transformation(extent={{60,-28},{80,-8}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{110,-10},{130,10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent={{60,-80},{40,-60}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{60,-100},{40,-80}})));
  Modelica.Blocks.Interfaces.RealInput Torque_Require
    annotation (Placement(transformation(extent={{-130,80},{-110,100}})));
  Modelica.Blocks.Interfaces.RealInput Torque_Or_Speed
    annotation (Placement(transformation(extent={{-130,50},{-110,70}})));
  Modelica.Blocks.Interfaces.RealInput Speed_Require
    annotation (Placement(transformation(extent={{-130,20},{-110,40}})));
  Modelica.Blocks.Interfaces.RealInput Direction
    annotation (Placement(transformation(extent={{-130,-10},{-110,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-126,-40},{-106,-20}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{-126,-100},{-106,-80}})));
  Electricity.Machines.SynchronousInductionMachines.PMSM_Fault pMSM_Fault(
      useNormalModel=false)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  Bus.FaultBus.FaultBus faultBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={120,-40})));
equation
  connect(Controller.ua, Invertor.ua) annotation (Line(
      points={{-19.375,52.9412},{11.8519,52.9412},{11.8519,1.42857}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Controller.ub, Invertor.ub) annotation (Line(
      points={{-19.375,48.2353},{23.7037,48.2353},{23.7037,1.42857}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Controller.uc, Invertor.uc) annotation (Line(
      points={{-19.375,43.5294},{34.0741,43.5294},{34.0741,1.71429}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Invertor.i_a, Controller.ia) annotation (Line(
      points={{5.92593,-40},{5.92593,-44},{-35,-44},{-35,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Invertor.i_b, Controller.ib) annotation (Line(
      points={{11.8519,-40},{12,-40},{12,-48},{-29.375,-48},{-29.375,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Invertor.i_c, Controller.ic) annotation (Line(
      points={{17.7778,-40.5714},{17.7778,-52},{-23.75,-52},{-23.75,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(terminalBox.plugSupply, Invertor.positivePlug) annotation (Line(
      points={{70,-26},{70,-20},{40.1481,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(angleSensor.phi, Controller.theta_m) annotation (Line(
      points={{39,-70},{-49.625,-70},{-49.625,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speedSensor.w, Controller.spd) annotation (Line(
      points={{39,-90},{-55.375,-90},{-55.375,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Torque_Require, Controller.Torque_require) annotation (Line(
      points={{-120,90},{-100,90},{-100,52.9412},{-60,52.9412}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Torque_Or_Speed, Controller.Trq_or_Spd) annotation (Line(
      points={{-120,60},{-104,60},{-104,44.7059},{-60,44.7059}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Speed_Require, Controller.targetSpd) annotation (Line(
      points={{-120,30},{-100,30},{-100,36.4706},{-60,36.4706}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Direction, Controller.F_or_R) annotation (Line(
      points={{-120,0},{-94,0},{-94,28.2353},{-60,28.2353}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pin_p, Invertor.pin_p) annotation (Line(
      points={{-116,-30},{-100,-30},{-100,-5.71429},{0.296296,-5.71429}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pin_n, Invertor.pin_n) annotation (Line(
      points={{-116,-90},{-100,-90},{-100,-34.2857},{0.296296,-34.2857}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pMSM_Fault.plug_sn, terminalBox.plug_sn) annotation (Line(
      points={{64,-40.4},{64,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(terminalBox.plug_sp, pMSM_Fault.plug_sp) annotation (Line(
      points={{76,-28},{76,-40.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pMSM_Fault.flange, flange_a) annotation (Line(
      points={{79.6,-50},{100,-50},{100,0},{120,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pMSM_Fault.flange, angleSensor.flange) annotation (Line(
      points={{79.6,-50},{100,-50},{100,-70},{60,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pMSM_Fault.flange, speedSensor.flange) annotation (Line(
      points={{79.6,-50},{100,-50},{100,-90},{60,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pMSM_Fault.faultBus, faultBus) annotation (Line(
      points={{70,-40},{120,-40}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}}),      graphics), Icon(coordinateSystem(extent=
           {{-120,-100},{120,100}})));
end PMSM_Fault;
