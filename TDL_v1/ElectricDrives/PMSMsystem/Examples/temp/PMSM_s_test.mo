within TDL_v1.ElectricDrives.PMSMsystem.Examples.temp;
model PMSM_s_test
  Modelica.Electrical.Analog.Sensors.CurrentSensor ia annotation(Placement(transformation(extent={{-272,20},
            {-252,40}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ib annotation(Placement(transformation(extent={{-236,-6},
            {-216,14}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ic annotation(Placement(transformation(extent={{-196,
            -28},{-176,-8}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent={{10,-168},
            {-10,-148}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent={{-30,
            -150},{-52,-128}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y") annotation(Placement(transformation(extent={{-108,
            -42},{-64,2}})));
  Elements.Pins2Plug pins2Plug1 annotation(Placement(transformation(extent={{-160,
            -36},{-114,54}})));
  Elements.Inverter_withoutPWM inverter_withoutPWM annotation(Placement(transformation(extent={{-370,
            -40},{-302,44}})));
  Elements.SM_PermanentMagnet_s_cxp smpm1(
    p=4,
    fsNominal=50,
    Rs=0.00827,
    alpha20s=Modelica.Electrical.Machines.Thermal.Constants.alpha20Zero,
    Jr=0.011,
    useSupport=false,
    psi_f=0.0703,
    Lmd=0.000342,
    Lmq=0.00071,
    useDamperCage=false) annotation (Placement(transformation(extent={{-102,-92},{-72,
            -62}})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 50, freqHz = 10) annotation(Placement(transformation(extent={{-386,58},
            {-362,82}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 50, freqHz = 10, phase = -2.0943951023932) annotation(Placement(transformation(extent={{-350,76},
            {-328,98}})));
  Modelica.Blocks.Sources.Sine sine2(amplitude = 50, freqHz = 10, phase = -4.1887902047864) annotation(Placement(transformation(extent={{-316,90},
            {-296,110}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 336) annotation(Placement(transformation(origin={-469,15},  extent={{-19,-19},
            {19,19}},                                                                                                    rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent={{-480,
            -32},{-460,-12}})));
equation
  connect(pins2Plug1.positiveplug1,terminalBox.plugSupply) annotation(Line(points={{
          -122.478,8.5693},{-122.478,8},{-86,8},{-86,-37.6}},                                                                                  color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.a, ia.p) annotation (Line(
      points={{-302,27.2},{-272,27.2},{-272,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ia.n, pins2Plug1.pin) annotation (Line(
      points={{-252,30},{-194,30},{-194,36},{-153.755,36},{-153.755,
          34.4595}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ib.n, pins2Plug1.pin1) annotation (Line(
      points={{-216,4},{-153.755,4},{-153.755,8.91718}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ic.n, pins2Plug1.pin2) annotation (Line(
      points={{-176,-18},{-153.755,-18},{-153.755,-15.0184}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.b, ib.p) annotation (Line(
      points={{-302,2},{-280,2},{-280,4},{-236,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ic.p, inverter_withoutPWM.c) annotation (Line(
      points={{-196,-18},{-232,-18},{-232,-22},{-302,-22},{-302,-24.04}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(terminalBox.plug_sn, smpm1.plug_sn) annotation (Line(
      points={{-99.2,-42},{-98,-42},{-98,-62},{-93,-62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(terminalBox.plug_sp, smpm1.plug_sp) annotation (Line(
      points={{-72.8,-42},{-76,-42},{-76,-62.3},{-78,-62.3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sine1.y,inverter_withoutPWM.b_sig) annotation(Line(points={{-326.9,87},{-320,
          87},{-320,64},{-336,64},{-336,41.48}},                                                        color = {0,0,127}, smooth = Smooth.None));
  connect(sine2.y,inverter_withoutPWM.c_sig) annotation(Line(points={{-295,100},{-288,
          100},{-288,64},{-288,64},{-314,64},{-314,42},{-314,41.48},{-315.6,41.48}},                               color = {0,0,127}, smooth = Smooth.None));
  connect(sine.y, inverter_withoutPWM.a_sig) annotation (Line(
      points={{-360.8,70},{-360,70},{-360,68},{-354.36,68},{-354.36,41.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ground1.p, constantVoltage.n) annotation (Line(
      points={{-470,-12},{-470,-4},{-469,-4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.minus, constantVoltage.n) annotation (Line(
      points={{-370.68,-15.64},{-420,-15.64},{-420,-4},{-469,-4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.plus, constantVoltage.p) annotation (Line(
      points={{-370.68,27.2},{-420,27.2},{-420,34},{-469,34}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(angleSensor.flange, smpm1.flange) annotation (Line(
      points={{-30,-139},{-26,-139},{-26,-77},{-72,-77}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.flange, smpm1.flange) annotation (Line(
      points={{10,-158},{14,-158},{14,-78},{-26,-78},{-26,-77},{-72,-77}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(extent={{-540,-200},{100,140}},   preserveAspectRatio=false),   graphics), Icon(coordinateSystem(extent = {{-540,-200},{100,140}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSM_s_test;
