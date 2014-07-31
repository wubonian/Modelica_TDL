within TDL_v1.Example.EMT.Controllers;
model PCU
  extends TDL_v1.Templates.Controllers.Base;

  CoSimulation.Interface_dll_2 TCU_Simulink(
    dll_name_ex="TCU_win32.dll",
    init_name_ex="TCU_initialize",
    step_name_ex="TCU_step",
    ter_name_ex="TCU_terminate",
    in_name_ex="TCU_U",
    out_name_ex="TCU_Y",
    in_num_ex=8,
    samplePeriod=0.005,
    out_num_ex=21)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput clutch_psn
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Blocks.Interfaces.RealInput motor1_psn annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput motor2_psn annotation (Placement(
        transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Blocks.Interfaces.RealOutput Motor1_PWM
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealOutput Motor2_PWM
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput Clutch_PWM
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
equation
  connect(TCU_Simulink.u[1], messageBus.HMI_Message) annotation (Line(
      points={{-20,-1.75},{-26,-1.75},{-26,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TCU_Simulink.u[2], messageBus.ABS_Message) annotation (Line(
      points={{-20,-1.25},{-34,-1.25},{-34,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TCU_Simulink.u[3], messageBus.EMS_Message) annotation (Line(
      points={{-20,-0.75},{-40,-0.75},{-40,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(clutch_psn, TCU_Simulink.u[6]) annotation (Line(
      points={{-100,60},{-60,60},{-60,0.75},{-20,0.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(motor1_psn, TCU_Simulink.u[7]) annotation (Line(
      points={{-100,0},{-60,0},{-60,1.25},{-20,1.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(motor2_psn, TCU_Simulink.u[8]) annotation (Line(
      points={{-100,-60},{-60,-60},{-60,1.75},{-20,1.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TCU_Simulink.y[3], messageBus.PCU_Message) annotation (Line(
      points={{20,-1.52381},{40,-1.52381},{40,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TCU_Simulink.y[4], messageBus.TmReq) annotation (Line(
      points={{20,-1.33333},{44,-1.33333},{44,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TCU_Simulink.y[5], messageBus.Motor_TrqOrN) annotation (Line(
      points={{20,-1.14286},{48,-1.14286},{48,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TCU_Simulink.y[6], messageBus.Nm_Req) annotation (Line(
      points={{20,-0.952381},{52,-0.952381},{52,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TCU_Simulink.y[7], messageBus.dirction) annotation (Line(
      points={{20,-0.761905},{56,-0.761905},{56,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(Motor1_PWM, TCU_Simulink.y[8]) annotation (Line(
      points={{100,60},{60,60},{60,-0.571429},{20,-0.571429}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Motor2_PWM, TCU_Simulink.y[9]) annotation (Line(
      points={{100,0},{60,0},{60,-0.380952},{20,-0.380952}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Clutch_PWM, TCU_Simulink.y[10]) annotation (Line(
      points={{100,-60},{60,-60},{60,-0.190476},{20,-0.190476}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TCU_Simulink.u[4], messageBus.TmAct) annotation (Line(
      points={{-20,-0.25},{-46,-0.25},{-46,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TCU_Simulink.u[5], messageBus.NmAct) annotation (Line(
      points={{-20,0.25},{-52,0.25},{-52,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end PCU;
