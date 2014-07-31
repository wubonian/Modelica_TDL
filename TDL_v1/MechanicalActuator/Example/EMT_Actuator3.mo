within TDL_v1.MechanicalActuator.Example;
model EMT_Actuator3

  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(transformation(extent = {{-140,80},{-160,100}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-190,40},{-170,60}})));
  Modelica.Blocks.Math.Gain gain(k = 12 / 16000) annotation(Placement(transformation(extent = {{10,-10},{-10,10}}, rotation = 90, origin = {-150,130})));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 0.01) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {-110,-70})));
  TDL_v1.Transmission.Gear.Ideal_Gear idealGear1(i=2.245) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,-10})));
  TDL_v1.Transmission.Gear.Ideal_Gear idealGear2(i=2.5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={90,-10})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.0001) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {20,16})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.0001) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {90,30})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{-40,40},{-20,60}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(Placement(transformation(extent = {{20,78},{0,98}})));
  Modelica.Blocks.Math.Gain gain1(k = 12 / 16000) annotation(Placement(transformation(extent = {{10,-10},{-10,10}}, rotation = 90, origin = {10,130})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 0.0001) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {180,16})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(Placement(transformation(extent = {{120,40},{140,60}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation(Placement(transformation(extent = {{180,78},{160,98}})));
  Modelica.Blocks.Math.Gain gain2(k = -12 / 16000) annotation(Placement(transformation(extent = {{10,-10},{-10,10}}, rotation = 90, origin = {170,130})));
  Modelica.Blocks.Interfaces.RealInput PWM_Clutch annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {-150,180})));
  Modelica.Blocks.Interfaces.RealInput PWM_Motor_1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {10,180})));
  Modelica.Blocks.Interfaces.RealInput PWM_Motor_2 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {170,180})));
  Modelica.Blocks.Interfaces.RealOutput Value_Clutch annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {-70,180})));
  Modelica.Blocks.Interfaces.RealOutput Value_Motor_1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {90,180})));
  Modelica.Blocks.Interfaces.RealOutput Value_Motor_2 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {250,180})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_clutch annotation(Placement(transformation(extent={{-122,
            -176},{-102,-156}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_syn_1_2 annotation(Placement(transformation(extent={{-32,
            -176},{-12,-156}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_syn_3_4 annotation(Placement(transformation(extent={{48,-176},
            {68,-156}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_syn_si_5 annotation(Placement(transformation(extent={{130,
            -176},{150,-156}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_syn_so annotation(Placement(transformation(extent={{210,
            -176},{230,-156}})));
  Lever.Lever_Ideal lever_Ideal annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-110,-30})));
  RackAndPinion.RackPinion_Ideal rackPinion_Ideal(ratio=78.3085)
                                                  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-110,10})));
  WormAndGear.Physical_WormGear physical_WormGear(
    i=68,
    r_worm=0.010718,
    r_gear=0.061382,
    theta_pressure=10/180*3.14,
    c=1e7,
    d=1e3,
    mue=0.12,
    v_limit=1e-3)
    annotation (Placement(transformation(extent={{-120,40},{-100,60}})));
  Electricity.Machines.DCMachines.DCPM dCPM1
    annotation (Placement(transformation(extent={{0,38},{20,62}})));
  WormAndGear.Physical_WormGear physical_WormGear1(
    i=67/3,
    r_worm=0.008707,
    r_gear=0.056,
    theta_pressure=0.19198621771938,
    c=1e7,
    d=1e3,
    mue=0.12,
    v_limit=1e-3)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Electricity.Machines.DCMachines.DCPM dCPM2
    annotation (Placement(transformation(extent={{160,38},{180,62}})));
  WormAndGear.Physical_WormGear physical_WormGear2(
    i=67/3,
    r_worm=0.008707,
    r_gear=0.056,
    theta_pressure=0.19198621771938,
    c=1e7,
    d=1e3,
    mue=0.12,
    v_limit=1e-3)
    annotation (Placement(transformation(extent={{200,40},{220,60}})));
  Transmission.Gear.Ideal_Gear ideal_Gear(i=2.245)
                                          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={190,-10})));
  Sensor_Actuator.AngleSensor_physical angleSensor_physical(
    parm_u_bias=0,
    parm_y_bias=3400,
    parm_resolution=1734.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,90})));
  Sensor_Actuator.AngleSensor_physical angleSensor_physical1(
    parm_u_bias=0,
    parm_y_bias=1138,
    parm_resolution=2182) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,90})));
  Sensor_Actuator.AngleSensor_physical angleSensor_physical2(
    parm_u_bias=0,
    parm_y_bias=2380,
    parm_resolution=-815) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={250,90})));
  Electricity.Machines.DCMachines.DCPM dCPM
    annotation (Placement(transformation(extent={{-158,38},{-138,62}})));
  BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction
    rotational_ContinuousCoulombFriction1(
    parm_mue=1,
    parm_cgeo=1,
    parm_w_limit=0.01)
    annotation (Placement(transformation(extent={{140,-100},{160,-80}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={110,-90})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
    annotation (Placement(transformation(extent={{160,-60},{140,-40}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D1(
    tableOnFile=true,
    fileName="D:/Library_Update/TDL_Workspace/Cam/cam_resistance.mat",
    tableName="power_resistance")
    annotation (Placement(transformation(extent={{120,-60},{100,-40}})));
  BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction
    rotational_ContinuousCoulombFriction(
    parm_mue=1,
    parm_cgeo=1,
    parm_w_limit=0.01)
    annotation (Placement(transformation(extent={{-30,-112},{-10,-92}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,-102})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent={{0,-62},{-20,-42}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    tableOnFile=true,
    tableName="select_resistance",
    fileName="D:/Library_Update/TDL_Workspace/Cam/cam_resistance.mat")
    annotation (Placement(transformation(extent={{-40,-62},{-60,-42}})));
  Cam.Cam_Ideal_1_2 cam_Ideal_1_2_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-130})));
  Cam.Cam_Ideal_3_4 cam_Ideal_3_4_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-130})));
  Cam.Cam_Ideal_si_5 cam_Ideal_si_5_1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={170,-130})));
  Cam.Cam_Ideal_so cam_Ideal_so annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={230,-130})));
  TDL_v1.Transmission.Gear.Ideal_Gear idealGear3(i=0.5826) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-42})));
  Transmission.Gear.Ideal_Gear ideal_Gear1(i=0.5826)
                                          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={190,-40})));
equation
  connect(ground.p,signalVoltage.n) annotation(Line(points = {{-180,60},{-180,90},{-160,90}}, color = {0,0,255}, smooth = Smooth.None));
  connect(gain.y,signalVoltage.v) annotation(Line(points = {{-150,119},{-150,97}}, color = {0,0,127}, smooth = Smooth.None));
  connect(ground1.p,signalVoltage1.n) annotation(Line(points = {{-30,60},{-30,88},{0,88}}, color = {0,0,255}, smooth = Smooth.None));
  connect(gain1.y,signalVoltage1.v) annotation(Line(points = {{10,119},{10,95}}, color = {0,0,127}, smooth = Smooth.None));
  connect(ground2.p,signalVoltage2.n) annotation(Line(points = {{130,60},{130,88},{160,88}}, color = {0,0,255}, smooth = Smooth.None));
  connect(gain2.y,signalVoltage2.v) annotation(Line(points = {{170,119},{170,95}}, color = {0,0,127}, smooth = Smooth.None));
  connect(PWM_Clutch,gain.u) annotation(Line(points = {{-150,180},{-150,142}}, color = {0,0,127}, smooth = Smooth.None));
  connect(PWM_Motor_1,gain1.u) annotation(Line(points = {{10,180},{10,142}}, color = {0,0,127}, smooth = Smooth.None));
  connect(PWM_Motor_2,gain2.u) annotation(Line(points = {{170,180},{170,142}}, color = {0,0,127}, smooth = Smooth.None));
  connect(flange_clutch,mass.flange_a) annotation(Line(points={{-112,-166},{-112,
          -124},{-110,-124},{-110,-80}},                                                  color = {0,127,0}, smooth = Smooth.None));
  connect(lever_Ideal.flange_b, mass.flange_b) annotation (Line(
      points={{-110,-40},{-110,-60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rackPinion_Ideal.flangeT, lever_Ideal.flange_a) annotation (Line(
      points={{-110,0},{-110,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(physical_WormGear.flange_gear, rackPinion_Ideal.flangeR) annotation (
      Line(
      points={{-110,40},{-110,20}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(dCPM1.pin_ap, signalVoltage1.p) annotation (Line(
      points={{16,61.6},{28,61.6},{28,88},{20,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dCPM1.pin_an, signalVoltage1.n) annotation (Line(
      points={{4,61.6},{2,61.6},{2,62},{-6,62},{-6,88},{0,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(physical_WormGear1.flange_worm, dCPM1.flange) annotation (Line(
      points={{40,50},{19.6,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(physical_WormGear1.flange_gear, inertia.flange_a) annotation (Line(
      points={{50,40},{50,34},{20,34},{20,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia1.flange_b, idealGear2.flange_b) annotation (Line(
      points={{90,20},{90,14},{118,14},{118,-28},{90,-28},{90,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, idealGear1.flange_a) annotation (Line(
      points={{20,6},{50,6},{50,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear1.flange_b, idealGear2.flange_a) annotation (Line(
      points={{50,-20},{50,-24},{74,-24},{74,6},{90,6},{90,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dCPM2.pin_ap, signalVoltage2.p) annotation (Line(
      points={{176,61.6},{190,61.6},{190,88},{180,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dCPM2.pin_an, signalVoltage2.n) annotation (Line(
      points={{164,61.6},{152,61.6},{152,88},{160,88}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dCPM2.flange, physical_WormGear2.flange_worm) annotation (Line(
      points={{179.6,50},{200,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(physical_WormGear2.flange_gear, inertia2.flange_a) annotation (Line(
      points={{210,40},{210,30},{180,30},{180,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia2.flange_b, ideal_Gear.flange_a) annotation (Line(
      points={{180,6},{190,6},{190,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor_physical.flange_a, rackPinion_Ideal.flangeR)
    annotation (Line(
      points={{-70,80},{-70,32},{-110,32},{-110,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor_physical.physical, Value_Clutch) annotation (Line(
      points={{-70,100},{-70,180}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(angleSensor_physical1.flange_a, inertia1.flange_a) annotation (
      Line(
      points={{90,80},{90,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor_physical1.physical, Value_Motor_1) annotation (Line(
      points={{90,100},{90,180}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(angleSensor_physical2.physical, Value_Motor_2) annotation (Line(
      points={{250,100},{250,100},{250,180}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dCPM.pin_ap, signalVoltage.p) annotation (Line(
      points={{-142,61.6},{-140,61.6},{-140,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dCPM.pin_an, signalVoltage.n) annotation (Line(
      points={{-154,61.6},{-160,61.6},{-160,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dCPM.flange, physical_WormGear.flange_worm) annotation (Line(
      points={{-138.4,50},{-120,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(fixed1.flange, rotational_ContinuousCoulombFriction1.flange_a)
    annotation (Line(
      points={{110,-90},{140,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(combiTable1D1.u[1], angleSensor1.phi) annotation (Line(
      points={{122,-50},{139,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTable1D1.y[1], rotational_ContinuousCoulombFriction1.f_input)
    annotation (Line(
      points={{99,-50},{90,-50},{90,-68},{150,-68},{150,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fixed.flange,rotational_ContinuousCoulombFriction. flange_a)
    annotation (Line(
      points={{-50,-102},{-30,-102}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(combiTable1D.u[1],angleSensor. phi) annotation (Line(
      points={{-38,-52},{-21,-52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTable1D.y[1],rotational_ContinuousCoulombFriction. f_input)
    annotation (Line(
      points={{-61,-52},{-72,-52},{-72,-72},{-20,-72},{-20,-92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cam_Ideal_1_2_1.flange_follower, flange_syn_1_2) annotation (
      Line(
      points={{0,-139.6},{0,-166},{-22,-166}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(cam_Ideal_3_4_1.flange_follower, flange_syn_3_4) annotation (
      Line(
      points={{60,-139.6},{60,-152},{60,-166},{58,-166}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(cam_Ideal_si_5_1.flange_follower, flange_syn_si_5) annotation (
      Line(
      points={{170,-139.6},{170,-166},{140,-166}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(cam_Ideal_so.flange_follower, flange_syn_so) annotation (Line(
      points={{230,-139.6},{230,-166},{220,-166}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(idealGear3.flange_b, angleSensor.flange) annotation (Line(
      points={{40,-52},{0,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear3.flange_b, cam_Ideal_3_4_1.flange_cam) annotation (
      Line(
      points={{40,-52},{40,-100},{60,-100},{60,-120.4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear3.flange_b, cam_Ideal_1_2_1.flange_cam) annotation (
      Line(
      points={{40,-52},{40,-100},{0,-100},{0,-120.4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear3.flange_a, idealGear1.flange_b) annotation (Line(
      points={{40,-32},{40,-24},{50,-24},{50,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Gear1.flange_a, ideal_Gear.flange_b) annotation (Line(
      points={{190,-30},{190,-25},{190,-25},{190,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Gear1.flange_b, angleSensor1.flange) annotation (Line(
      points={{190,-50},{160,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Gear1.flange_b, angleSensor_physical2.flange_a)
    annotation (Line(
      points={{190,-50},{250,-50},{250,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Gear1.flange_b, cam_Ideal_si_5_1.flange_cam) annotation (
      Line(
      points={{190,-50},{190,-90},{170,-90},{170,-120.4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rotational_ContinuousCoulombFriction1.flange_b, ideal_Gear1.flange_b)
    annotation (Line(
      points={{160,-90},{190,-90},{190,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ideal_Gear1.flange_b, cam_Ideal_so.flange_cam) annotation (Line(
      points={{190,-50},{190,-90},{230,-90},{230,-120.4}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (                                                              Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-200,
            -170},{280,180}}),                                                                                                    graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-200,
            -170},{280,180}})));
end EMT_Actuator3;
