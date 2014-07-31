within TDL_v1.Example.EMT.Controllers;
model HMI
  extends TDL_v1.Templates.Controllers.Base;

  CoSimulation.Interface_dll_2 interface_dll_2_1(
    in_num_ex=8,
    out_num_ex=1,
    dll_name_ex="HMI_win32.dll",
    init_name_ex="HMI_initialize",
    step_name_ex="HMI_step",
    ter_name_ex="HMI_terminate",
    in_name_ex="HMI_U",
    out_name_ex="HMI_Y",
    samplePeriod=0.005) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,0})));
  Modelica.Blocks.Interfaces.RealInput Acc_Pedal annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,100})));
  Modelica.Blocks.Interfaces.RealInput B_HEVRequest annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,100})));
  Modelica.Blocks.Interfaces.RealInput B_ManualMode annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,100})));
  Modelica.Blocks.Interfaces.RealInput B_VCUReady annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={10,100})));
  Modelica.Blocks.Interfaces.RealInput BrakePedal annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,100})));
  Modelica.Blocks.Interfaces.RealInput Gear annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-30,100})));
  Modelica.Blocks.Interfaces.RealInput RND annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,100})));
  Modelica.Blocks.Interfaces.RealInput RegPedal annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,100})));
equation
  connect(Acc_Pedal, interface_dll_2_1.u[1]) annotation (Line(
      points={{70,100},{70,40},{-1.75,40},{-1.75,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B_HEVRequest, interface_dll_2_1.u[2]) annotation (Line(
      points={{50,100},{50,50},{-1.25,50},{-1.25,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B_ManualMode, interface_dll_2_1.u[3]) annotation (Line(
      points={{30,100},{30,60},{-0.75,60},{-0.75,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B_VCUReady, interface_dll_2_1.u[4]) annotation (Line(
      points={{10,100},{10,70},{-0.25,70},{-0.25,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(BrakePedal, interface_dll_2_1.u[5]) annotation (Line(
      points={{-10,100},{-10,70},{0.25,70},{0.25,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gear, interface_dll_2_1.u[6]) annotation (Line(
      points={{-30,100},{-30,60},{0.75,60},{0.75,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(RND, interface_dll_2_1.u[7]) annotation (Line(
      points={{-50,100},{-50,50},{1.25,50},{1.25,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(RegPedal, interface_dll_2_1.u[8]) annotation (Line(
      points={{-70,100},{-70,40},{1.75,40},{1.75,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(interface_dll_2_1.y[1], messageBus.HMI_Message) annotation (
      Line(
      points={{0,-20},{0,-20},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end HMI;
