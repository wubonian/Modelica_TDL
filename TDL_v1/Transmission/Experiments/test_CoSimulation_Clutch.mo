within TDL_v1.Transmission.Experiments;
model test_CoSimulation_Clutch

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
        origin={0,130})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin={80,20})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(transformation(extent={{10,40},
            {-10,60}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent={{-40,0},
            {-20,20}})));
  Modelica.Blocks.Math.Gain gain(k = 12 / 16000) annotation(Placement(transformation(extent = {{10,-10},{-10,10}}, rotation = 90, origin={0,90})));
  TDL_v1.MechanicalActuator.Lever.Lever_Ideal lever_Ideal annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-110})));
  TDL_v1.MechanicalActuator.WormAndGear.Physical_WormGear physical_WormGear(
    i=68,
    r_worm=0.010718,
    r_gear=0.061382,
    theta_pressure=10/180*3.14,
    c=10000000.0,
    d=1000.0,
    mue=0.12,
    v_limit=0.001)
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
  TDL_v1.Electricity.Machines.DCMachines.DCPM dCPM
    annotation (Placement(transformation(extent={{-10,-2},{10,22}})));
  TDL_v1.Electricity.Sensor_Actuator.Sensor sensor(
    parm_u_bias=0,
    parm_y_bias=3400,
    parm_resolution=1734.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,70})));
  Modelica.Blocks.Sources.TimeTable timeTable(table = [0,1;0.5,1;0.505,2;10,2]) annotation(Placement(transformation(extent={{-48,140},
            {-28,160}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J=0.001)
                                                            annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-30})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2)
    annotation (Placement(transformation(extent={{-70,-168},{-50,-148}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=10)
    annotation (Placement(transformation(extent={{32,-168},{52,-148}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(
      tau_constant=20)
    annotation (Placement(transformation(extent={{-110,-168},{-90,-148}})));
  TDL_v1.Transmission.Clutch.Clutch clutch(diaphragm_spring(
      fileName_large_edge=
          "D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat",
      fileName_small_edge=
          "D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat",
      c_endstop=4e6,
      d_endstop=1e4,
      d_large_edge=1e4,
      d_small_edge=1e4))
    annotation (Placement(transformation(extent={{-20,-160},{0,-140}})));
  TDL_v1.MechanicalActuator.RackAndPinion.RackPinion_Ideal rackPinion_Ideal(ratio=
        78.3085) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-70})));
equation
  connect(ground.p,signalVoltage.n) annotation(Line(points={{-30,20},{-30,50},{-10,
          50}},                                                                          color = {0,0,255}, smooth = Smooth.None));
  connect(gain.y,signalVoltage.v) annotation(Line(points={{0,79},{0,57}},     color = {0,0,127}, smooth = Smooth.None));
  connect(dCPM.flange,physical_WormGear.flange_worm) annotation(Line(points={{9.6,10},
          {30,10}},                                                                                color = {0,0,0}, smooth = Smooth.None));
  connect(signalVoltage.p,dCPM.pin_ap) annotation(Line(points={{10,50},{20,50},{
          20,21.6},{6,21.6}},                                                                          color = {0,0,255}, smooth = Smooth.None));
  connect(dCPM.pin_an,signalVoltage.n) annotation(Line(points={{-6,21.6},{-8,21.6},
          {-8,22},{-18,22},{-18,50},{-10,50}},                                                                     color = {0,0,255}, smooth = Smooth.None));
  connect(sensor.u_input,angleSensor.phi) annotation(Line(points={{80,60},{80,31}},   color = {0,0,127}, smooth = Smooth.None));
  connect(timeTable.y,interface_dll2.u[1]) annotation(Line(points={{-27,150},{-0.5,
          150},{-0.5,140}},                                                                          color = {0,0,127}, smooth = Smooth.None));
  connect(sensor.y_output,interface_dll2.u[2]) annotation(Line(points={{80,81},{
          80,164},{0.5,164},{0.5,140}},                                                                           color = {0,0,127}, smooth = Smooth.None));
  connect(inertia2.flange_a, physical_WormGear.flange_gear) annotation (Line(
      points={{40,-20},{40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor.flange, physical_WormGear.flange_gear) annotation (Line(
      points={{80,10},{80,-6},{40,-6},{40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(interface_dll2.y[1], gain.u) annotation (Line(
      points={{-0.75,120},{-0.75,112},{0,112},{0,102}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(constantTorque.flange, inertia.flange_a) annotation (Line(
      points={{-90,-158},{-70,-158}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, clutch.Engine_Flange) annotation (Line(
      points={{-50,-158},{-20,-158}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Transmission_Flange, inertia1.flange_a) annotation (Line(
      points={{0,-158},{32,-158}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(lever_Ideal.flange_b, clutch.Actuator_Flange) annotation (Line(
      points={{40,-120},{40,-142},{0,-142}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rackPinion_Ideal.flangeT, lever_Ideal.flange_a) annotation (Line(
      points={{40,-80},{40,-100}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rackPinion_Ideal.flangeR, inertia2.flange_b) annotation (Line(
      points={{40,-60},{40,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (                                  Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-140,
            -180},{120,180}}),                                                                                                    graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-140,
            -180},{120,180}})));
end test_CoSimulation_Clutch;
