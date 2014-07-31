within TDL_v1.Example.EMT.Controllers;
model EMS
  extends TDL_v1.Templates.Controllers.Base;
  CoSimulation.Interface_dll_2 EMS_Simulink(
    dll_name_ex="EMS_Message_win32.dll",
    init_name_ex="EMS_Message_initialize",
    step_name_ex="EMS_Message_step",
    ter_name_ex="EMS_Message_terminate",
    in_name_ex="EMS_Message_U",
    out_name_ex="EMS_Message_Y",
    in_num_ex=4,
    out_num_ex=2,
    samplePeriod=0.005)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput Speed_Act
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Blocks.Interfaces.RealInput Torque_Act annotation (Placement(
        transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Blocks.Interfaces.RealOutput Torque_Req
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(Torque_Req, EMS_Simulink.y[1]) annotation (Line(
      points={{100,0},{60,0},{60,-1},{20,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(EMS_Simulink.u[1], messageBus.HMI_Message) annotation (Line(
      points={{-20,-1.5},{-40,-1.5},{-40,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(EMS_Simulink.u[2], messageBus.PCU_Message) annotation (Line(
      points={{-20,-0.5},{-50,-0.5},{-50,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(Speed_Act, EMS_Simulink.u[3]) annotation (Line(
      points={{-100,60},{-60,60},{-60,0.5},{-20,0.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Torque_Act, EMS_Simulink.u[4]) annotation (Line(
      points={{-100,-60},{-60,-60},{-60,1.5},{-20,1.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(EMS_Simulink.y[2], messageBus.EMS_Message) annotation (Line(
      points={{20,1},{40,1},{40,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end EMS;
