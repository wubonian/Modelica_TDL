within TDL_v1.Example.EMT.Vehicle_Components;
model Transmission_Fault
  import TDL_Version2 = TDL_v1;
  extends TDL_Version2.Templates.Transmission.Base(usingFaultBus=true,
   final usingMultiBodyEngine=false, final usingMultiBodyDriveline=false, final includeManualShiftConnector=false,
   final includeClutchPedal=false, final usingMultiBodyMotor=false, final usingMount=false,
    final usingClutchPedal=false, final usingManualShiftConnector=false);
  Controllers.PCU pCU
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  TDL_Version2.Transmission.Example.EMT3_Fault eMT3_Fault
    annotation (Placement(transformation(extent={{-30,-60},{30,-20}})));
  TDL_Version2.MechanicalActuator.Example.EMT_Actuator_Fault eMT_Actuator_Fault
    annotation (Placement(transformation(extent={{-30,0},{30,40}})));
equation
  connect(pCU.messageBus, messageBus) annotation (Line(
      points={{0,60},{0,56},{-60,56},{-60,100}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(eMT_Actuator_Fault.flange_clutch, eMT3_Fault.flange_clutch)
    annotation (Line(
      points={{-19,0.457143},{-19,-9.77143},{-21.8182,-9.77143},{
          -21.8182,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(eMT_Actuator_Fault.flange_syn_1_2, eMT3_Fault.flange_syn_1_2)
    annotation (Line(
      points={{-7.75,0.457143},{-7.75,-8.77143},{-9.54545,-8.77143},{
          -9.54545,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(eMT_Actuator_Fault.flange_syn_3_4, eMT3_Fault.flange_syn_3_4)
    annotation (Line(
      points={{2.25,0.457143},{2.25,-9.77143},{1.36364,-9.77143},{
          1.36364,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(eMT_Actuator_Fault.flange_syn_si_5, eMT3_Fault.flange_syn_si_5)
    annotation (Line(
      points={{12.5,0.457143},{12.5,-8.77143},{12.2727,-8.77143},{
          12.2727,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(eMT_Actuator_Fault.flange_syn_so, eMT3_Fault.flange_syn_so)
    annotation (Line(
      points={{22.5,0.457143},{22.5,-9.77143},{23.1818,-9.77143},{
          23.1818,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(eMT3_Fault.flange_motor, motorFlange.flange) annotation (Line(
      points={{29.7273,-23.6923},{40,-23.6923},{40,-80},{-80,-80},{-80,
          -60},{-100,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(eMT3_Fault.flange_wheel, drivelineFlange.flange) annotation (Line(
      points={{-30,-56.9231},{-40,-56.9231},{-40,-72},{60,-72},{60,0},{
          100,0}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(eMT3_Fault.flange_engine, engineFlange.flange) annotation (Line(
      points={{-30,-38.4615},{-60,-38.4615},{-60,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(eMT_Actuator_Fault.faultBus, faultBus) annotation (Line(
      points={{-30.125,19.5429},{-40,19.5429},{-40,88},{60,88},{60,100}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(eMT3_Fault.faultBus, faultBus) annotation (Line(
      points={{-30,-29.2308},{-40,-29.2308},{-40,88},{60,88},{60,100}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(pCU.clutch_psn, eMT_Actuator_Fault.Value_Clutch) annotation (Line(
      points={{-10,76},{-13.75,76},{-13.75,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.motor1_psn, eMT_Actuator_Fault.Value_Motor_1) annotation (Line(
      points={{-10,70},{-16,70},{-16,44},{6.25,44},{6.25,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.motor2_psn, eMT_Actuator_Fault.Value_Motor_2) annotation (Line(
      points={{-10,64},{-18,64},{-18,46},{26.25,46},{26.25,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.Motor1_PWM, eMT_Actuator_Fault.PWM_Motor_1) annotation (Line(
      points={{10,76},{14,76},{14,48},{-3.75,48},{-3.75,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.Motor2_PWM, eMT_Actuator_Fault.PWM_Motor_2) annotation (Line(
      points={{10,70},{16.25,70},{16.25,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.Clutch_PWM, eMT_Actuator_Fault.PWM_Clutch) annotation (Line(
      points={{10,64},{20,64},{20,50},{-23.75,50},{-23.75,40}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Transmission_Fault;
