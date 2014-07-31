within TDL_v1.Transmission.Experiments;
model test_CoSimulation_synchronizer

  TDL_v1.Transmission.Gear.Ideal_Gear idealGear1(i=2.245) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-10})));
  TDL_v1.Transmission.Gear.Ideal_Gear idealGear2(i=2.5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,-10})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.0001) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin={10,16})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.0001) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin={80,30})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin={80,70})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent={{-50,40},
            {-30,60}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(Placement(transformation(extent={{10,78},
            {-10,98}})));
  Modelica.Blocks.Math.Gain gain1(k = 12 / 16000) annotation(Placement(transformation(extent = {{10,-10},{-10,10}}, rotation = 90, origin={0,130})));
  TDL_v1.Electricity.Machines.DCMachines.DCPM dCPM1
    annotation (Placement(transformation(extent={{-10,38},{10,62}})));
  TDL_v1.MechanicalActuator.WormAndGear.Physical_WormGear physical_WormGear1(
    i=67/3,
    r_worm=0.008707,
    r_gear=0.056,
    theta_pressure=0.19198621771938,
    c=1e7,
    d=1e3,
    mue=0.12,
    v_limit=1e-3)
    annotation (Placement(transformation(extent={{30,40},{50,60}})));
  TDL_v1.Transmission.Gear.Physical_Gear physical_Gear(i=0.5826) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,-50})));
  TDL_v1.MechanicalActuator.ExternalForce.Rotational_ExternalForce rotational_ExternalForce(table=[0,
        0])
    annotation (Placement(transformation(extent={{-30,-100},{-10,-80}})));
  TDL_v1.MechanicalActuator.Cam.Ideal_Cam ideal_Cam(
    tableOnFile=true,
    tableName="select_12",
    fileName="D:/Library_Update/TDL_Workspace/Cam/cam.mat") annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-130})));
  TDL_v1.MechanicalActuator.Cam.Ideal_Cam ideal_Cam1(
    tableOnFile=true,
    tableName="select_34",
    fileName="D:/Library_Update/TDL_Workspace/Cam/cam.mat") annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-130})));
  TDL_v1.Electricity.Sensor_Actuator.Sensor sensor1(
    parm_u_bias=0,
    parm_y_bias=1138,
    parm_resolution=2182) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,110})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-70,-100},{-50,-80}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque1(tau_constant = 0) annotation(Placement(transformation(extent={{60,-220},
            {40,-200}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent={{-100,
            -220},{-80,-200}})));
  Modelica.Blocks.Sources.Step step1(startTime = 0.5, height = -100, offset = 100) annotation(Placement(transformation(extent={{-140,
            -220},{-120,-200}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(tau_constant = 0) annotation(Placement(transformation(extent={{-100,
            -180},{-80,-160}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque2(tau_constant = 0) annotation(Placement(transformation(extent={{100,
            -180},{80,-160}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(
                                                           J = 20, w(start = 0, fixed = true)) annotation(Placement(transformation(extent={{40,-180},
            {60,-160}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(w(start = 0, fixed = true),
    J=20,
    phi(start=0.17453292519943))                                                                                       annotation(Placement(transformation(extent={{-60,
            -180},{-40,-160}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia4(J=0.1)
    annotation (Placement(transformation(extent={{-60,-220},{-40,-200}})));
  TDL_v1.Transmission.Synchronizer.Synchronizer synchronizer
    annotation (Placement(transformation(extent={{-20,-200},{20,-180}})));
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
    annotation (Placement(transformation(extent={{52,160},{32,180}})));
  Modelica.Blocks.Sources.Step step(
    height=-1,
    offset=2,
    startTime=0.5)
    annotation (Placement(transformation(extent={{120,180},{100,200}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{140,40},{120,60}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.001)
    annotation (Placement(transformation(extent={{100,-138},{120,-118}})));
equation
  connect(ground1.p,signalVoltage1.n) annotation(Line(points={{-40,60},{-40,88},
          {-10,88}},                                                                       color = {0,0,255}, smooth = Smooth.None));
  connect(gain1.y,signalVoltage1.v) annotation(Line(points={{0,119},{0,95}},     color = {0,0,127}, smooth = Smooth.None));
  connect(dCPM1.pin_ap,signalVoltage1. p) annotation (Line(
      points={{6,61.6},{18,61.6},{18,88},{10,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dCPM1.pin_an,signalVoltage1. n) annotation (Line(
      points={{-6,61.6},{-8,61.6},{-8,62},{-16,62},{-16,88},{-10,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(physical_WormGear1.flange_worm,dCPM1. flange) annotation (Line(
      points={{30,50},{9.6,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(physical_WormGear1.flange_gear,inertia. flange_a) annotation (Line(
      points={{40,40},{40,34},{10,34},{10,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia1.flange_b,idealGear2. flange_b) annotation (Line(
      points={{80,20},{80,14},{108,14},{108,-28},{80,-28},{80,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b,idealGear1. flange_a) annotation (Line(
      points={{10,6},{40,6},{40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear1.flange_b,idealGear2. flange_a) annotation (Line(
      points={{40,-20},{40,-24},{64,-24},{64,6},{80,6},{80,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(physical_Gear.flange_a,idealGear1. flange_b) annotation (Line(
      points={{20,-40},{20,-24},{40,-24},{40,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rotational_ExternalForce.flange_a,physical_Gear. flange_b)
    annotation (Line(
      points={{-10,-90},{20,-90},{20,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Cam.flange_cam,physical_Gear. flange_b) annotation (Line(
      points={{0,-120},{0,-90},{20,-90},{20,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Cam1.flange_cam,physical_Gear. flange_b) annotation (Line(
      points={{60,-120},{60,-90},{20,-90},{20,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const.y,rotational_ExternalForce. u_input) annotation (Line(
      points={{-49,-90},{-30,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step1.y,torque.tau) annotation(Line(points={{-119,-210},{-102,-210}},
                                                                              color = {0,0,127}, smooth = Smooth.None));
  connect(constantTorque.flange,inertia3.flange_a) annotation(Line(points={{-80,
          -170},{-60,-170}},                                                                      color = {0,0,0}, smooth = Smooth.None));
  connect(torque.flange,inertia4. flange_a) annotation (Line(
      points={{-80,-210},{-60,-210}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia3.flange_b,synchronizer. Left_Gear) annotation (Line(
      points={{-40,-170},{-26,-170},{-26,-182},{-20,-182}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Left_Axis,inertia4. flange_b) annotation (Line(
      points={{-20,-198},{-26,-198},{-26,-210},{-40,-210}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Right_Axis,constantTorque1. flange) annotation (Line(
      points={{20,-198},{30,-198},{30,-210},{40,-210}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia2.flange_b, constantTorque2.flange) annotation (Line(
      points={{60,-170},{80,-170}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia2.flange_a, synchronizer.Right_Gear) annotation (Line(
      points={{40,-170},{28,-170},{28,-182},{20,-182}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Cam.flange_follower, synchronizer.flange_a) annotation (Line(
      points={{0,-140},{0,-180}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(sensor1.y_output, interface_dll.u[2]) annotation (Line(
      points={{80,121},{80,170.5},{52,170.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, interface_dll.u[1]) annotation (Line(
      points={{99,190},{78,190},{78,169.5},{52,169.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(interface_dll.y[1], gain1.u) annotation (Line(
      points={{32,169.5},{0,169.5},{0,142},{8.88178e-016,142}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(angleSensor1.flange, inertia1.flange_a) annotation (Line(
      points={{80,60},{80,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor1.phi, sensor1.u_input) annotation (Line(
      points={{80,81},{80,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mass.flange_a, ideal_Cam1.flange_follower) annotation (Line(
      points={{100,-128},{84,-128},{84,-146},{60,-146},{60,-140}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-220},{
            140,200}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-220},{140,
            200}})));
end test_CoSimulation_synchronizer;
