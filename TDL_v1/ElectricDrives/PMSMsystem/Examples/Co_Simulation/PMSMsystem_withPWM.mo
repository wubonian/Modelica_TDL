within TDL_v1.ElectricDrives.PMSMsystem.Examples.Co_Simulation;
model PMSMsystem_withPWM "PMSMsystem_withPWM.mo"
  // CP: 65001
  // SimulationX Version: 3.5.705.14
  Elements.Pins2Plug pins2Plug annotation(Placement(transformation(extent = {{14,42},{30,68}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y") annotation(Placement(transformation(extent = {{23,35},{39,51}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(origin = {23,1}, extent = {{-5,-5},{5,5}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(origin = {30,-14}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = 30 / 3.1416) annotation(Placement(transformation(origin = {6,-14}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ic annotation(Placement(transformation(extent = {{-10,42},{-4,48}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ib annotation(Placement(transformation(extent = {{-6,50},{0,56}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ia annotation(Placement(transformation(extent = {{0,60},{6,66}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{-58,36},{-52,42}})));
  Modelica.Blocks.Math.Gain gain1(k = 4) annotation(Placement(transformation(origin = {10,0}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(tau_constant = 0) annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation = 180, origin = {53,19})));
  Elements.Inverter_withPWM pWMinverter annotation(Placement(transformation(extent = {{-44,42},{-14,66}})));
  Control.signal_deal signal_deal2 annotation(Placement(transformation(extent = {{-7,-4},{7,4}}, rotation = 90, origin = {-36,21})));
  Control.signal_deal signal_deal3 annotation(Placement(transformation(extent = {{-7,-4},{7,4}}, rotation = 90, origin = {-26,21})));
  Modelica.Blocks.Math.Gain gain2(k = 1) annotation(Placement(transformation(origin = {18,-14}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  CoSimulation.Interface_dll interface_dll(dll_name_ex = "Control_PMSM_withPWM_MTPA_win32.dll", init_name_ex = "Control_PMSM_withPWM_MTPA_initialize", step_name_ex = "Control_PMSM_withPWM_MTPA_step", ter_name_ex = "Control_PMSM_withPWM_MTPA_terminate", in_name_ex = "Control_PMSM_withPWM_MTPA_U", out_name_ex = "Control_PMSM_withPWM_MTPA_Y", samplePeriod = 1e-005, in_num_ex = 5, out_num_ex = 3) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 180, origin = {-42,-8})));
  Elements.SM_PermanentMagnet_cxp smpm(p = 4, fsNominal = 50, Rs = 0.00827, alpha20s(displayUnit = "1/K") = Modelica.Electrical.Machines.Thermal.Constants.alpha20Zero, Jr = 0.011, useSupport = false, psi_f = 0.0703, Lmd = 0.000342, Lmq = 0.00071, useDamperCage = false, wMechanical(start = 209.43951023932)) annotation(Placement(transformation(extent = {{24,14},{38,28}})));
  PMSMsystem.Control.signal_deal signal_deal1 annotation (Placement(
        visible=true, transformation(
        origin={-46.25,20.875},
        extent={{-7.125,-3.75},{7.125,3.75}},
        rotation=90)));
  Vehicle.Battery.BatCircuit batCircuit annotation(Placement(transformation(extent = {{-62,48},{-48,56}})));
equation
  connect(signal_deal1.y,pWMinverter.u3) annotation(Line(points = {{-46.25,28.4275},{-46.25,40.1747},{-37.7,40.1747},{-37.7,40.8}}));
  connect(interface_dll.y[1],signal_deal1.u) annotation(Line(points={{-52,
          -7.33333},{-58,-7.33333},{-58,10},{-46,10},{-46,13.3225},{
          -48,13.3225},{-46.25,13.3225}}));
  connect(pWMinverter.u2,interface_dll.y[3]) annotation(Line(points={{-21.2,
          67.2},{-20,67.2},{-20,80},{-82,80},{-82,-8.66667},{-52,
          -8.66667}}));
  connect(pWMinverter.u1,interface_dll.y[2]) annotation(Line(points = {{-29.3,67.2},{-28,67.2},{-28,76},{-76,76},{-76,-8},{-52,-8}}));
  connect(interface_dll.y[1],pWMinverter.u) annotation(Line(points={{-52,
          -7.33333},{-70,-7.33333},{-70,72},{-38,72},{-38,67.2},{
          -37.7,67.2}}));
  connect(signal_deal3.u,interface_dll.y[3]) annotation(Line(points={{-26,
          13.58},{-26,6},{-54,6},{-54,-8},{-52,-8},{-52,-8.66667}}));
  connect(interface_dll.y[2],signal_deal2.u) annotation(Line(points = {{-52,-8},{-56,-8},{-56,8},{-36,8},{-36,14},{-36,13.58}}));
  connect(pins2Plug.positiveplug1,terminalBox.plugSupply) annotation(Line(points={{27.0513,
          54.8756},{30,54.8756},{30,52},{30,38},{31,38},{31,36.6}}));
  connect(speedSensor.flange,angleSensor.flange) annotation(Line(points = {{34,-14},{36,-14},{36,1},{28,1}}, color = {0,0,0}));
  connect(gain1.u,angleSensor.phi) annotation(Line(points = {{14.8,-4.44089e-016},{16,-4.44089e-016},{16,1},{17.5,1}}, color = {0,0,127}, smooth = Smooth.None));
  connect(constantTorque.flange,angleSensor.flange) annotation(Line(points = {{48,19},{48,20},{42,20},{42,2},{34,2},{34,1},{28,1}}, color = {0,0,0}, smooth = Smooth.None));
  connect(ic.p,pWMinverter.pin2) annotation(Line(points = {{-10,45},{-12,45},{-12,44.4},{-13.7,44.4}}, color = {0,0,255}, smooth = Smooth.None));
  connect(pWMinverter.pin1,ib.p) annotation(Line(points = {{-14,54},{-8,54},{-8,53},{-6,53}}, color = {0,0,255}, smooth = Smooth.None));
  connect(pWMinverter.pin,ia.p) annotation(Line(points = {{-14,63.36},{-2,63.36},{-2,63},{0,63}}, color = {0,0,255}, smooth = Smooth.None));
  connect(signal_deal2.y,pWMinverter.u4) annotation(Line(points = {{-36,28.42},{-36,34},{-29,34},{-29,40.8}}, color = {0,0,127}, smooth = Smooth.None));
  connect(signal_deal3.y,pWMinverter.u5) annotation(Line(points = {{-26,28.42},{-26,32},{-21.2,32},{-21.2,40.8}}, color = {0,0,127}, smooth = Smooth.None));
  connect(gain.u,gain2.y) annotation(Line(points = {{10.8,-14},{13.6,-14}}, color = {0,0,127}, smooth = Smooth.None));
  connect(gain2.u,speedSensor.w) annotation(Line(points = {{22.8,-14},{25.6,-14}}, color = {0,0,127}, smooth = Smooth.None));
  connect(ia.i,interface_dll.u[1]) annotation(Line(points={{3,60},{4,
          60},{4,8},{-4,8},{-4,-8},{-32,-8},{-32,-7.2}},                                                              color = {0,0,127}, smooth = Smooth.None));
  connect(ib.i,interface_dll.u[2]) annotation(Line(points={{-3,50},{
          -2,50},{-2,14},{-8,14},{-8,-8},{-32,-8},{-32,-7.6}},                                                             color = {0,0,127}, smooth = Smooth.None));
  connect(ic.i,interface_dll.u[3]) annotation(Line(points = {{-7,42},{-12,42},{-12,-8},{-32,-8}}, color = {0,0,127}, smooth = Smooth.None));
  connect(gain1.y,interface_dll.u[4]) annotation(Line(points={{5.6,
          4.44089e-016},{0,4.44089e-016},{0,-8},{-20,-8},{-20,-8.4},{
          -32,-8.4}},                                                                                                    color = {0,0,127}, smooth = Smooth.None));
  connect(gain.y,interface_dll.u[5]) annotation(Line(points={{1.6,-14},
          {-10,-14},{-10,-8.8},{-32,-8.8}},                                                                color = {0,0,127}, smooth = Smooth.None));
  connect(terminalBox.plug_sp,smpm.plug_sp) annotation(Line(points = {{35.8,35},{35.8,30.5},{35.2,30.5},{35.2,28}}, color = {0,0,255}, smooth = Smooth.None));
  connect(terminalBox.plug_sn,smpm.plug_sn) annotation(Line(points = {{26.2,35},{26.2,30.5},{26.8,30.5},{26.8,28}}, color = {0,0,255}, smooth = Smooth.None));
  connect(smpm.flange,angleSensor.flange) annotation(Line(points = {{38,21},{38,20},{42,20},{42,2},{34,2},{34,1},{28,1}}, color = {0,0,0}, smooth = Smooth.None));
  connect(ib.n,pins2Plug.pin1) annotation(Line(points={{0,53},{10,53},
          {10,54},{14,54},{14,54.9761},{16.1722,54.9761}},                                                               color = {0,0,255}, smooth = Smooth.None));
  connect(pins2Plug.pin,ia.n) annotation(Line(points={{16.1723,62.355},
          {8,62.355},{8,63},{6,63}},                                                                color = {0,0,255}, smooth = Smooth.None));
  connect(ic.n,pins2Plug.pin2) annotation(Line(points={{-4,45},{4,45},
          {4,46},{16,46},{16,48.0614},{16.1723,48.0614}},                                                               color = {0,0,255}, smooth = Smooth.None));
  connect(batCircuit.p,pWMinverter.pin_p) annotation(Line(points = {{-55,56.4},{-55,61.2},{-44,61.2}}, color = {0,0,255}, smooth = Smooth.None));
  connect(batCircuit.n,pWMinverter.pin_n) annotation(Line(points = {{-55,47.6},{-55,46.8},{-44,46.8}}, color = {0,0,255}, smooth = Smooth.None));
  connect(ground1.p,batCircuit.n) annotation(Line(points = {{-55,42},{-55,42},{-55,47.6}}, color = {0,0,255}, smooth = Smooth.None));
  annotation(viewSettings(clrRaster = 8421504), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006, Interval = 1e-005));
end PMSMsystem_withPWM;
