within TDL_v1.Example.Component_Test;
model test_CoSimulation_EMT2

  TDL_v1.MechanicalActuator.Example.EMT_Actuator2 eMT_Actuator
    annotation (Placement(transformation(extent={{-24,-14},{24,20}})));
  TDL_v1.Transmission.Example.EMT2 eMT
    annotation (Placement(transformation(extent={{-22,-72},{22,-46}})));
  TDL_v1.CoSimulation.Interface_dll interface_dll(
    dll_name_ex="select_actuator_control_win32.dll",
    init_name_ex="select_actuator_control_initialize",
    step_name_ex="select_actuator_control_step",
    ter_name_ex="select_actuator_control_terminate",
    in_name_ex="select_actuator_control_U",
    out_name_ex="select_actuator_control_Y",
    samplePeriod=0.005,
    in_num_ex=2,
    out_num_ex=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,50})));
  TDL_v1.CoSimulation.Interface_dll interface_dll1(
    samplePeriod=0.005,
    in_num_ex=2,
    out_num_ex=2,
    dll_name_ex="power_actuator_control_win32.dll",
    init_name_ex="power_actuator_control_initialize",
    step_name_ex="power_actuator_control_step",
    ter_name_ex="power_actuator_control_terminate",
    in_name_ex="power_actuator_control_U",
    out_name_ex="power_actuator_control_Y") annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,50})));
  TDL_v1.CoSimulation.Interface_dll interface_dll2(
    in_num_ex=2,
    samplePeriod=0.005,
    dll_name_ex="clutch_actuator_win32.dll",
    init_name_ex="clutch_actuator_initialize",
    step_name_ex="clutch_actuator_step",
    ter_name_ex="clutch_actuator_terminate",
    in_name_ex="clutch_actuator_U",
    out_name_ex="clutch_actuator_Y",
    out_num_ex=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-40,50})));
  TDL_v1.Vehicle.Vehicle_Simple vehicle_Simple(
    s_area=2.225,
    Cd=0.31,
    parm_mue=0.0005,
    parm_v_limit=0.3)
    annotation (Placement(transformation(extent={{40,-100},{60,-80}})));
  TDL_v1.Wheel.Ideal_Wheel ideal_Wheel(radius=0.3)
    annotation (Placement(transformation(extent={{-38,-100},{-18,-80}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.01)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=0.01)
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1
    annotation (Placement(transformation(extent={{100,-60},{80,-40}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 5,0; 5.5,50; 12,50; 12.5,
        0; 17.5,0; 18,50; 25,50])
    annotation (Placement(transformation(extent={{-140,-60},{-120,-40}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{140,-60},{120,-40}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,1; 2.5,1; 2.505,2; 12.5,
        2; 12.505,1; 15,1; 15.005,2; 25,2])
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Sources.TimeTable timeTable2(table=[0,2; 1,2; 1.005,1; 13.5,1;
        13.505,3; 25,3])
    annotation (Placement(transformation(extent={{-30,80},{-10,100}})));
  Modelica.Blocks.Sources.TimeTable timeTable3(table=[0,2; 0,2])
    annotation (Placement(transformation(extent={{12,80},{32,100}})));
equation
  connect(eMT_Actuator.flange_clutch, eMT.flange_clutch) annotation (Line(
      points={{-15.2,-13.6114},{-16,-13.6114},{-16,-46.4}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(eMT_Actuator.flange_syn_1_2, eMT.flange_syn_1_2) annotation (Line(
      points={{-6.2,-13.6114},{-6,-13.6114},{-6,-46.4},{-7,-46.4}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(eMT_Actuator.flange_syn_3_4, eMT.flange_syn_3_4) annotation (Line(
      points={{1.8,-13.6114},{1.8,-44.8057},{1,-44.8057},{1,-46.4}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(eMT_Actuator.flange_syn_si_5, eMT.flange_syn_si_5) annotation (Line(
      points={{10,-13.6114},{10,-46.4},{9,-46.4}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(eMT_Actuator.flange_syn_so, eMT.flange_syn_so) annotation (Line(
      points={{18,-13.6114},{18,-46.4},{17,-46.4}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ideal_Wheel.flangeR, eMT.flange_wheel) annotation (Line(
      points={{-38,-90},{-52,-90},{-52,-70},{-22,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Wheel.flangeT, vehicle_Simple.flange_a) annotation (Line(
      points={{-18,-90},{40,-90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, eMT.flange_engine) annotation (Line(
      points={{-40,-50},{-30,-50},{-30,-58},{-22,-58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(eMT.flange_motor, inertia1.flange_a) annotation (Line(
      points={{21.8,-48.4},{31.9,-48.4},{31.9,-50},{40,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.flange, inertia.flange_a) annotation (Line(
      points={{-80,-50},{-60,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque1.flange, inertia1.flange_b) annotation (Line(
      points={{80,-50},{60,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const.y, torque1.tau) annotation (Line(
      points={{119,-50},{102,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeTable.y, torque.tau) annotation (Line(
      points={{-119,-50},{-102,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeTable1.y, interface_dll2.u[1]) annotation (Line(
      points={{-59,90},{-40.5,90},{-40.5,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeTable2.y, interface_dll.u[1]) annotation (Line(
      points={{-9,90},{0.5,90},{0.5,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeTable3.y, interface_dll1.u[1]) annotation (Line(
      points={{33,90},{40.5,90},{40.5,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eMT_Actuator.Value_Motor_1, interface_dll.u[2]) annotation (Line(
      points={{5,20},{6,20},{6,32},{20,32},{20,68},{-0.5,68},{-0.5,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eMT_Actuator.Value_Clutch, interface_dll2.u[2]) annotation (Line(
      points={{-11,20},{-12,20},{-12,74},{-39.5,74},{-39.5,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eMT_Actuator.Value_Motor_2, interface_dll1.u[2]) annotation (Line(
      points={{21,20},{20,20},{20,68},{39.5,68},{39.5,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(interface_dll2.y[1], eMT_Actuator.PWM_Clutch) annotation (Line(
      points={{-40.75,40},{-40.75,30},{-19,30},{-19,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(interface_dll.y[1], eMT_Actuator.PWM_Motor_1) annotation (Line(
      points={{0.5,40},{0.5,32},{-3,32},{-3,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(interface_dll1.y[1], eMT_Actuator.PWM_Motor_2) annotation (Line(
      points={{40.5,40},{40.5,32},{13,32},{13,20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,
            100}}),     graphics),
    Icon(coordinateSystem(extent={{-140,-100},{140,100}})));
end test_CoSimulation_EMT2;
