within TDL_v1.Example.Component_Test;
model test_CoSimulation_AMT2

  TDL_v1.Transmission.Clutch.Clutch clutch(diaphragm_spring(fileName_large_edge
        ="D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat",
        fileName_small_edge=
          "D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat"))
    annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.01)
    annotation (Placement(transformation(extent={{50,-118},{70,-98}})));
  TDL_v1.Transmission.Gear.Ideal_Gear ideal_Gear(i=2.9375) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={90,-130})));
  TDL_v1.Transmission.Gear.Ideal_Gear ideal_Gear1(i=1.95) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={150,-130})));
  TDL_v1.Transmission.Gear.Ideal_Gear ideal_Gear2(i=1.3214) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={190,-130})));
  TDL_v1.Transmission.Gear.Ideal_Gear ideal_Gear3(i=0.9697) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={250,-130})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=30)
    annotation (Placement(transformation(extent={{50,-178},{70,-158}})));
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
        origin={10,170})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin={90,60})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(transformation(extent={{20,80},
            {0,100}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent={{-30,40},
            {-10,60}})));
  Modelica.Blocks.Math.Gain gain(k = 12 / 16000) annotation(Placement(transformation(extent = {{10,-10},{-10,10}}, rotation = 90, origin={10,130})));
  TDL_v1.MechanicalActuator.Lever.Lever_Ideal lever_Ideal annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,-70})));
  TDL_v1.MechanicalActuator.WormAndGear.Physical_WormGear physical_WormGear(
    i=68,
    r_worm=0.010718,
    r_gear=0.061382,
    theta_pressure=10/180*3.14,
    c=10000000.0,
    d=1000.0,
    mue=0.12,
    v_limit=0.001)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  TDL_v1.Electricity.Machines.DCMachines.DCPM dCPM
    annotation (Placement(transformation(extent={{0,38},{20,62}})));
  TDL_v1.Electricity.Sensor_Actuator.Sensor sensor(
    parm_u_bias=0,
    parm_y_bias=3400,
    parm_resolution=1734.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,110})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J=0.001)
                                                            annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,10})));
  TDL_v1.MechanicalActuator.RackAndPinion.RackPinion_Ideal rackPinion_Ideal(ratio=
        78.3085) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,-30})));
  TDL_v1.Transmission.Gear.Ideal_Gear idealGear1(i=2.245) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={214,56})));
  TDL_v1.Transmission.Gear.Ideal_Gear idealGear2(i=2.5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={254,56})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(
                                                           J = 0.0001) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin={184,82})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia4(J = 0.0001) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin={254,96})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin={254,136})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent={{124,106},
            {144,126}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(Placement(transformation(extent={{184,144},
            {164,164}})));
  Modelica.Blocks.Math.Gain gain1(k = 12 / 16000) annotation(Placement(transformation(extent = {{10,-10},{-10,10}}, rotation = 90, origin={174,196})));
  TDL_v1.Electricity.Machines.DCMachines.DCPM dCPM1
    annotation (Placement(transformation(extent={{164,104},{184,128}})));
  TDL_v1.MechanicalActuator.WormAndGear.Physical_WormGear physical_WormGear1(
    i=67/3,
    r_worm=0.008707,
    r_gear=0.056,
    theta_pressure=0.19198621771938,
    c=1e7,
    d=1e3,
    mue=0.12,
    v_limit=1e-3)
    annotation (Placement(transformation(extent={{204,106},{224,126}})));
  TDL_v1.Transmission.Gear.Physical_Gear physical_Gear(i=0.5826) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={188,28})));
  TDL_v1.MechanicalActuator.ExternalForce.Rotational_ExternalForce rotational_ExternalForce(table=[0,
        0]) annotation (Placement(transformation(extent={{134,-34},{154,-14}})));
  TDL_v1.Electricity.Sensor_Actuator.Sensor sensor1(
    parm_u_bias=0,
    parm_y_bias=1138,
    parm_resolution=2182) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={254,176})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{104,-34},{124,-14}})));
  TDL_v1.CoSimulation.Interface_dll interface_dll(
    dll_name_ex="select_actuator_control_win32.dll",
    init_name_ex="select_actuator_control_initialize",
    step_name_ex="select_actuator_control_step",
    ter_name_ex="select_actuator_control_terminate",
    in_name_ex="select_actuator_control_U",
    out_name_ex="select_actuator_control_Y",
    samplePeriod=0.005,
    in_num_ex=2,
    out_num_ex=2)
    annotation (Placement(transformation(extent={{220,220},{200,240}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,1; 2.5,1; 2.505,2; 12.5,
        2; 12.505,1; 15,1; 15.005,2; 25,2])
    annotation (Placement(transformation(extent={{-40,180},{-20,200}})));
  Modelica.Blocks.Sources.TimeTable timeTable2(table=[0,2; 1,2; 1.005,1; 13.5,1;
        13.505,3; 25,3])
    annotation (Placement(transformation(extent={{300,220},{280,240}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia5(
                                                           J=0.01)
    annotation (Placement(transformation(extent={{-46,-118},{-26,-98}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-86,-118},{-66,-98}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 5,0; 5.5,50; 12,50; 12.5,
        0; 17.5,0; 18,50; 25,50])
    annotation (Placement(transformation(extent={{-126,-118},{-106,-98}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia6(J=0.0001,
      stateSelect=StateSelect.default) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={188,-2})));
  TDL_v1.MechanicalActuator.Cam.Ideal_Cam ideal_Cam(
    tableOnFile=true,
    tableName="select_12",
    fileName="D:/Library_Update/TDL_Workspace/Cam/cam.mat") annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={122,-86})));
  TDL_v1.Transmission.Synchronizer.Synchronizer synchronizer2_1
    annotation (Placement(transformation(extent={{110,-180},{130,-160}})));
  TDL_v1.Transmission.Synchronizer.Synchronizer synchronizer2_2
    annotation (Placement(transformation(extent={{208,-110},{228,-90}})));
  TDL_v1.MechanicalActuator.Cam.Ideal_Cam ideal_Cam1(
    tableOnFile=true,
    fileName="D:/Library_Update/TDL_Workspace/Cam/cam.mat",
    tableName="select_34") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={220,-60})));
equation
  connect(inertia.flange_b, ideal_Gear.flange_a) annotation (Line(
      points={{70,-108},{90,-108},{90,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Transmission_Flange, inertia.flange_a) annotation (Line(
      points={{30,-108},{50,-108}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Gear1.flange_a, inertia.flange_b) annotation (Line(
      points={{150,-120},{150,-108},{70,-108}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ground.p,signalVoltage.n) annotation(Line(points={{-20,60},{-20,90},{
          0,90}},                                                                        color = {0,0,255}, smooth = Smooth.None));
  connect(gain.y,signalVoltage.v) annotation(Line(points={{10,119},{10,97}},  color = {0,0,127}, smooth = Smooth.None));
  connect(dCPM.flange,physical_WormGear.flange_worm) annotation(Line(points={{19.6,50},
          {40,50}},                                                                                color = {0,0,0}, smooth = Smooth.None));
  connect(signalVoltage.p,dCPM.pin_ap) annotation(Line(points={{20,90},{30,90},
          {30,61.6},{16,61.6}},                                                                        color = {0,0,255}, smooth = Smooth.None));
  connect(dCPM.pin_an,signalVoltage.n) annotation(Line(points={{4,61.6},{2,61.6},
          {2,62},{-8,62},{-8,90},{0,90}},                                                                          color = {0,0,255}, smooth = Smooth.None));
  connect(sensor.u_input,angleSensor.phi) annotation(Line(points={{90,100},{90,
          71}},                                                                       color = {0,0,127}, smooth = Smooth.None));
  connect(sensor.y_output,interface_dll2.u[2]) annotation(Line(points={{90,121},
          {90,190},{10.5,190},{10.5,180}},                                                                        color = {0,0,127}, smooth = Smooth.None));
  connect(inertia2.flange_a,physical_WormGear. flange_gear) annotation (Line(
      points={{50,20},{50,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor.flange,physical_WormGear. flange_gear) annotation (Line(
      points={{90,50},{90,34},{50,34},{50,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(interface_dll2.y[1],gain. u) annotation (Line(
      points={{9.25,160},{9.25,152},{10,152},{10,142}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rackPinion_Ideal.flangeT,lever_Ideal. flange_a) annotation (Line(
      points={{50,-40},{50,-60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rackPinion_Ideal.flangeR,inertia2. flange_b) annotation (Line(
      points={{50,-20},{50,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(lever_Ideal.flange_b, clutch.Actuator_Flange) annotation (Line(
      points={{50,-80},{50,-92},{30,-92}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ground1.p,signalVoltage1.n) annotation(Line(points={{134,126},{134,
          154},{164,154}},                                                                 color = {0,0,255}, smooth = Smooth.None));
  connect(gain1.y,signalVoltage1.v) annotation(Line(points={{174,185},{174,161}},color = {0,0,127}, smooth = Smooth.None));
  connect(dCPM1.pin_ap,signalVoltage1. p) annotation (Line(
      points={{180,127.6},{192,127.6},{192,154},{184,154}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dCPM1.pin_an,signalVoltage1. n) annotation (Line(
      points={{168,127.6},{166,127.6},{166,128},{158,128},{158,154},{164,154}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(physical_WormGear1.flange_worm,dCPM1. flange) annotation (Line(
      points={{204,116},{183.6,116}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(physical_WormGear1.flange_gear, inertia3.flange_a) annotation (Line(
      points={{214,106},{214,100},{184,100},{184,92}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia4.flange_b,idealGear2. flange_b) annotation (Line(
      points={{254,86},{254,80},{282,80},{282,38},{254,38},{254,46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia3.flange_b, idealGear1.flange_a) annotation (Line(
      points={{184,72},{214,72},{214,66}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear1.flange_b,idealGear2. flange_a) annotation (Line(
      points={{214,46},{214,42},{238,42},{238,72},{254,72},{254,66}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(physical_Gear.flange_a,idealGear1. flange_b) annotation (Line(
      points={{188,38},{188,42},{214,42},{214,46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const.y,rotational_ExternalForce. u_input) annotation (Line(
      points={{125,-24},{134,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor1.y_output,interface_dll. u[2]) annotation (Line(
      points={{254,187},{254,230.5},{220,230.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(interface_dll.y[1],gain1. u) annotation (Line(
      points={{200,229.5},{174,229.5},{174,208}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(angleSensor1.flange,inertia4. flange_a) annotation (Line(
      points={{254,126},{254,106}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor1.phi,sensor1. u_input) annotation (Line(
      points={{254,147},{254,166}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeTable1.y, interface_dll2.u[1]) annotation (Line(
      points={{-19,190},{9.5,190},{9.5,180}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeTable2.y, interface_dll.u[1]) annotation (Line(
      points={{279,230},{250,230},{250,229.5},{220,229.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(torque.flange, inertia5.flange_a) annotation (Line(
      points={{-66,-108},{-46,-108}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(timeTable.y,torque. tau) annotation (Line(
      points={{-105,-108},{-88,-108}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inertia5.flange_b, clutch.Engine_Flange) annotation (Line(
      points={{-26,-108},{10,-108}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia6.flange_a, physical_Gear.flange_b) annotation (Line(
      points={{188,8},{188,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia6.flange_b, rotational_ExternalForce.flange_a) annotation (
      Line(
      points={{188,-12},{188,-24},{154,-24}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_1.Left_Gear, ideal_Gear.flange_b) annotation (Line(
      points={{110,-162},{90,-162},{90,-140}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_1.Left_Axis, inertia1.flange_b) annotation (Line(
      points={{110,-178},{90,-178},{90,-168},{70,-168}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_1.Right_Gear, ideal_Gear1.flange_b) annotation (Line(
      points={{130,-162},{150,-162},{150,-140}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_1.Right_Axis, ideal_Gear2.flange_b) annotation (Line(
      points={{130,-178},{190,-178},{190,-140}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_1.Right_Axis, ideal_Gear3.flange_b) annotation (Line(
      points={{130,-178},{250,-178},{250,-140}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_2.Left_Axis, inertia.flange_b) annotation (Line(
      points={{208,-108},{70,-108}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_2.Left_Gear, ideal_Gear2.flange_a) annotation (Line(
      points={{208,-92},{196,-92},{196,-94},{190,-94},{190,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_2.Right_Gear, ideal_Gear3.flange_a) annotation (Line(
      points={{228,-92},{240,-92},{240,-94},{250,-94},{250,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2_1.flange_a, ideal_Cam.flange_follower) annotation (Line(
      points={{120,-160},{120,-96},{122,-96}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ideal_Cam.flange_cam, inertia6.flange_b) annotation (Line(
      points={{122,-76},{122,-52},{188,-52},{188,-12}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Cam1.flange_follower, synchronizer2_2.flange_a)
    annotation (Line(
      points={{220,-70},{220,-90},{218,-90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ideal_Cam1.flange_cam, inertia6.flange_b) annotation (Line(
      points={{220,-50},{220,-40},{188,-40},{188,-12}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-220},{440,270}},
          preserveAspectRatio=false), graphics),
    Icon(coordinateSystem(extent={{-140,-220},{440,270}}, preserveAspectRatio=
            false)));
end test_CoSimulation_AMT2;
