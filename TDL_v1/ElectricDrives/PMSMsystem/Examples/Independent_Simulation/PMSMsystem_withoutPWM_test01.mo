within TDL_v1.ElectricDrives.PMSMsystem.Examples.Independent_Simulation;
model PMSMsystem_withoutPWM_test01
  // CP: 65001
  // SimulationX Version: 3.5.705.14
  Elements.Pins2Plug pins2Plug annotation(Placement(transformation(extent = {{4,14},{24,34}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y") annotation(Placement(transformation(extent = {{17,9},{33,25}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 336) annotation(Placement(transformation(origin = {-68,24}, extent = {{-10,-10},{10,10}}, rotation = 270)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(origin = {9,-27}, extent = {{-5,-5},{5,5}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(origin = {10,-42}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = 30 / 3.1416) annotation(Placement(transformation(origin = {-14,-42}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ic annotation(Placement(transformation(extent = {{-26,14},{-20,20}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ib annotation(Placement(transformation(extent = {{-16,20},{-10,26}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ia annotation(Placement(transformation(extent = {{-6,24},{0,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{-76,-18},{-56,2}})));
  Modelica.Blocks.Math.Gain gain1(k = 4) annotation(Placement(transformation(origin = {-14,-26}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
                                                                                             smpm(p = 4, Rs = 0.00827, alpha20s(displayUnit = "1/K") = Modelica.Electrical.Machines.Thermal.Constants.alpha20Zero, Js = 0.011, Lmd = 0.000342, Lmq = 0.00071, useDamperCage = false, fsNominal = 50, VsOpenCircuit = 15.6, Jr = 0.011, useSupport = false) annotation(Placement(transformation(extent = {{20,-16},{34,-2}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(tau_constant = 0) annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation = 180, origin = {59,-11})));
  Elements.Inverter_withoutPWM inverter_withoutPWM annotation(Placement(transformation(extent = {{-52,16},{-32,36}})));
  Coordinate_Transformation.Clarke clarke annotation(Placement(transformation(extent = {{-30,-10},{-42,8}})));
  Coordinate_Transformation.Park park1 annotation(Placement(transformation(extent = {{-6,-8},{6,8}}, rotation = 180, origin = {-68,-28})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 50, freqHz = 10) annotation(Placement(transformation(extent = {{-62,38},{-54,46}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 50, freqHz = 10, phase = -2.0943951023932) annotation(Placement(transformation(extent = {{-52,48},{-44,56}})));
  Modelica.Blocks.Sources.Sine sine2(amplitude = 50, freqHz = 10, phase = -4.1887902047864) annotation(Placement(transformation(extent = {{-42,58},{-34,66}})));
  Elements.SM_PermanentMagnet_cxp smpm_cxp(p = 4, fsNominal = 50, Rs = 0.00827, alpha20s(displayUnit = "1/K") = Modelica.Electrical.Machines.Thermal.Constants.alpha20Zero, Jr = 0.011, VsOpenCircuit = 15.6, Lmd = 0.000342, Lmq = 0.00071, useDamperCage = false) annotation(Placement(transformation(extent = {{40,36},{54,50}})));
equation
  connect(pins2Plug.positiveplug1,terminalBox.plugSupply) annotation(Line(points={{20.3141,
          23.9043},{24,23.9043},{24,24},{26,24},{26,12},{25,12},{25,10.6}}));
  connect(speedSensor.flange,angleSensor.flange) annotation(Line(points = {{14,-42},{20,-42},{20,-27},{14,-27}}, color = {0,0,0}));
  connect(gain.u,speedSensor.w) annotation(Line(points = {{-9.199999999999999,-42},{0,-42},{5.6,-42}}, color = {0,0,127}));
  connect(ic.n,pins2Plug.pin2) annotation(Line(points={{-20,17},{-6,17},{-6,18.6626},{
          6.71534,18.6626}}));
  connect(ib.n,pins2Plug.pin1) annotation(Line(points={{-10,23},{0,23},{0,24},{6,24},{6,
          23.9816},{6.7153,23.9816}}));
  connect(ia.n,pins2Plug.pin) annotation(Line(points={{0,27},{0,29.6577},{6.71534,
          29.6577}}));
  connect(constantVoltage.n,ground1.p) annotation(Line(points = {{-68,14},{-68,9},{-68,5},{-66,5},{-66,2}}, thickness = 0.0625));
  connect(gain1.u,angleSensor.phi) annotation(Line(points = {{-9.199999999999999,-26},{0,-26},{0,-27},{3.5,-27}}, color = {0,0,127}, smooth = Smooth.None));
  connect(smpm.flange,angleSensor.flange) annotation(Line(points = {{34,-9},{42,-9},{42,-26},{34,-26},{34,-27},{14,-27}}, color = {0,0,0}, smooth = Smooth.None));
  connect(constantTorque.flange,angleSensor.flange) annotation(Line(points = {{54,-11},{48,-11},{48,-8},{42,-8},{42,-26},{34,-26},{34,-27},{14,-27}}, color = {0,0,0}, smooth = Smooth.None));
  connect(smpm.plug_sn,terminalBox.plug_sn) annotation(Line(points = {{22.8,-2},{22.8,4},{20.2,4},{20.2,9}}, color = {0,0,255}, smooth = Smooth.None));
  connect(smpm.plug_sp,terminalBox.plug_sp) annotation(Line(points = {{31.2,-2},{29.8,-2},{29.8,9}}, color = {0,0,255}, smooth = Smooth.None));
  connect(constantVoltage.p,inverter_withoutPWM.plus) annotation(Line(points = {{-68,34},{-60,34},{-60,32},{-52.2,32}}, color = {0,0,255}, smooth = Smooth.None));
  connect(constantVoltage.n,inverter_withoutPWM.minus) annotation(Line(points = {{-68,14},{-60,14},{-60,21.8},{-52.2,21.8}}, color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.a,ia.p) annotation(Line(points = {{-32,32},{-20,32},{-20,27},{-6,27}}, color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.b,ib.p) annotation(Line(points = {{-32,26},{-24,26},{-24,23},{-16,23}}, color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.c,ic.p) annotation(Line(points = {{-32,19.8},{-30,19.8},{-30,17},{-26,17}}, color = {0,0,255}, smooth = Smooth.None));
  connect(ib.i,clarke.i_b) annotation(Line(points = {{-13,20},{-13,-1},{-30,-1}}, color = {0,0,127}, smooth = Smooth.None));
  connect(ic.i,clarke.i_c) annotation(Line(points = {{-23,14},{-23,-6.4},{-30,-6.4}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_beta,clarke.i_beta) annotation(Line(points = {{-62,-28},{-44,-28},{-44,-2},{-42,-2},{-42,-2.8}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_alfa,clarke.i_alfa) annotation(Line(points = {{-62,-32.8},{-50,-32.8},{-50,2.6},{-42,2.6}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.theta,gain1.y) annotation(Line(points = {{-62,-23.2},{-42,-23.2},{-42,-26},{-18.4,-26}}, color = {0,0,127}, smooth = Smooth.None));
  connect(clarke.i_a,ia.i) annotation(Line(points = {{-30,4.4},{-4,4.4},{-4,24},{-3,24}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sine.y,inverter_withoutPWM.a_sig) annotation(Line(points = {{-53.6,42},{-50,42},{-50,35.4},{-47.4,35.4}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sine1.y,inverter_withoutPWM.b_sig) annotation(Line(points = {{-43.6,52},{-42,52},{-42,35.4}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sine2.y,inverter_withoutPWM.c_sig) annotation(Line(points = {{-33.6,62},{-34,62},{-34,35.4},{-36,35.4}}, color = {0,0,127}, smooth = Smooth.None));
  annotation(viewSettings(clrRaster = 8421504), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.4, Tolerance = 1e-006));
end PMSMsystem_withoutPWM_test01;
