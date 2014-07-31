within TDL_v1.Example.EMT.Vehicle_Components;
model Transmission
  import TDL_Version2 = TDL_v1;
  extends TDL_Version2.Templates.Transmission.Base(
   final usingMultiBodyEngine=false, final usingMultiBodyDriveline=false, final includeManualShiftConnector=false,
   final includeClutchPedal=false, final usingMultiBodyMotor=false, final usingMount=false,
    final usingClutchPedal=false, final usingManualShiftConnector=false);
  Controllers.PCU pCU
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  TDL_Version2.MechanicalActuator.Example.EMT_Actuator3 EMT_Act
    annotation (Placement(transformation(extent={{-20,0},{28,36}})));
  TDL_Version2.Transmission.Example.EMT3 EMT_Transmission
    annotation (Placement(transformation(extent={{-20,-60},{30,-20}})));
equation
  connect(pCU.messageBus, messageBus) annotation (Line(
      points={{0,60},{0,56},{-60,56},{-60,100}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(EMT_Act.flange_syn_so, EMT_Transmission.flange_syn_so) annotation (Line(
      points={{22,0.411429},{24.3182,0.411429},{24.3182,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(EMT_Act.flange_syn_si_5, EMT_Transmission.flange_syn_si_5) annotation (
      Line(
      points={{14,0.411429},{15.2273,0.411429},{15.2273,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(EMT_Act.flange_syn_3_4, EMT_Transmission.flange_syn_3_4) annotation (
      Line(
      points={{5.8,0.411429},{5.8,-9.79429},{6.13636,-9.79429},{6.13636,
          -20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(EMT_Act.flange_syn_1_2, EMT_Transmission.flange_syn_1_2) annotation (
      Line(
      points={{-2.2,0.411429},{-2.2,-9.79429},{-2.95455,-9.79429},{
          -2.95455,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(EMT_Act.flange_clutch, EMT_Transmission.flange_clutch) annotation (Line(
      points={{-11.2,0.411429},{-11.2,0.411429},{-11.2,-20.6154},{
          -13.1818,-20.6154}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(EMT_Transmission.flange_engine, engineFlange.flange) annotation (Line(
      points={{-20,-38.4615},{-60,-38.4615},{-60,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(EMT_Transmission.flange_wheel, drivelineFlange.flange) annotation (Line(
      points={{-20,-56.9231},{-40,-56.9231},{-40,-72},{60,-72},{60,0},{
          100,0}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(EMT_Transmission.flange_motor, motorFlange.flange) annotation (Line(
      points={{29.7727,-23.6923},{40,-23.6923},{40,-80},{-60,-80},{-60,
          -60},{-100,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(EMT_Act.PWM_Clutch, pCU.Clutch_PWM) annotation (Line(
      points={{-15,36},{-15,54},{20,54},{20,64},{10,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.Motor1_PWM, EMT_Act.PWM_Motor_1) annotation (Line(
      points={{10,76},{28,76},{28,50},{1,50},{1,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.Motor2_PWM, EMT_Act.PWM_Motor_2) annotation (Line(
      points={{10,70},{24,70},{24,52},{17,52},{17,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(EMT_Act.Value_Clutch, pCU.clutch_psn) annotation (Line(
      points={{-7,36},{-7,44},{-20,44},{-20,76},{-10,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.motor1_psn, EMT_Act.Value_Motor_1) annotation (Line(
      points={{-10,70},{-18,70},{-18,46},{9,46},{9,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pCU.motor2_psn, EMT_Act.Value_Motor_2) annotation (Line(
      points={{-10,64},{-14,64},{-14,50},{25,50},{25,36}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Transmission;
