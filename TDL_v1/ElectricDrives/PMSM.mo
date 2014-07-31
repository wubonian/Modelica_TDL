within TDL_v1.ElectricDrives;
model PMSM
  import PMSMsystem;
  import TDL_Version2 = TDL_v1;

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
  TDL_Version2.ElectricDrives.PMSMsystem.system.PMSM_withoutPWM pMSM_withoutPWM
    annotation (Placement(transformation(extent={{-10,-14},{44,14}})));
  TDL_Version2.ElectricDrives.PMSMsystem.system.PMSMControl pMSMControl
    annotation (Placement(transformation(extent={{-80,46},{-16,80}})));
  TDL_Version2.Electricity.Machines.SynchronousInductionMachines.PMSM pMSM
    annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(
      terminalConnection="Y")
    annotation (Placement(transformation(extent={{60,-18},{80,2}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{110,-10},{130,10}})));
protected
  Modelica.Mechanics.Rotational.Interfaces.Flange_a inner_flange
   annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(pMSM_withoutPWM.pin_n, pin_n) annotation (Line(
      points={{-9.6,-10},{-80.8,-10},{-80.8,-90},{-116,-90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pMSMControl.Torque_require, Torque_Require) annotation (Line(
      points={{-80,74},{-100,74},{-100,90},{-120,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.Trq_or_Spd, Torque_Or_Speed) annotation (Line(
      points={{-80,67},{-100,67},{-100,60},{-120,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.targetSpd, Speed_Require) annotation (Line(
      points={{-80,60},{-98,60},{-98,30},{-120,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.F_or_R, Direction) annotation (Line(
      points={{-80,53},{-94,53},{-94,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.spd, speedSensor.w) annotation (Line(
      points={{-72.6,46},{-72.6,-90},{39,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(angleSensor.phi, pMSMControl.theta_m) annotation (Line(
      points={{39,-70},{-63.4,-70},{-63.4,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.ia, pMSM_withoutPWM.i_a) annotation (Line(
      points={{-40,46},{-40,-36},{-2,-36},{-2,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM.i_b, pMSMControl.ib) annotation (Line(
      points={{6,-14},{6,-42},{-31,-42},{-31,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.ic, pMSM_withoutPWM.i_c) annotation (Line(
      points={{-22,46},{-22,-46},{14,-46},{14,-14.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM.ua, pMSMControl.ua) annotation (Line(
      points={{6,15},{6,74},{-15,74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.ub, pMSM_withoutPWM.ub) annotation (Line(
      points={{-15,70},{22,70},{22,15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.uc, pMSM_withoutPWM.uc) annotation (Line(
      points={{-15,66},{36,66},{36,15.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM.pin_p, pin_p) annotation (Line(
      points={{-9.6,10},{-84,10},{-84,-30},{-116,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(terminalBox.plug_sn, pMSM.plug_sn) annotation (Line(
      points={{64,-18},{64,-30.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(terminalBox.plug_sp, pMSM.plug_sp) annotation (Line(
      points={{76,-18},{76,-30.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(terminalBox.plugSupply, pMSM_withoutPWM.positivePlug) annotation (
      Line(
      points={{70,-16},{70,0},{44.2,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pMSM.flange, inner_flange) annotation (Line(
      points={{79.6,-40},{100,-40},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pMSM.flange, angleSensor.flange) annotation (Line(
      points={{79.6,-40},{100,-40},{100,-70},{60,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pMSM.flange, speedSensor.flange) annotation (Line(
      points={{79.6,-40},{100,-40},{100,-90},{60,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inner_flange, flange_a) annotation (Line(
      points={{100,0},{120,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}}),      graphics), Icon(coordinateSystem(extent=
           {{-120,-100},{120,100}})));
end PMSM;
