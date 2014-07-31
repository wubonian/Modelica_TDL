within TDL_v1.ElectricDrives.PMSMsystem.Examples.Co_Simulation;
model PMSMsystem_withoutPWM "PMSMsystem_withoutPWM.mo"
  // CP: 65001
  // SimulationX Version: 3.5.705.14
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y") annotation(Placement(transformation(extent = {{15,39},{31,55}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(origin = {9,3}, extent = {{-5,-5},{5,5}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(origin = {8,-12}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain(k = 30 / 3.1416) annotation(Placement(transformation(origin = {-16,-12}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ic annotation(Placement(transformation(extent = {{-28,44},{-22,50}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ib annotation(Placement(transformation(extent = {{-18,50},{-12,56}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ia annotation(Placement(transformation(extent = {{-8,54},{-2,60}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{-64,40},{-56,48}})));
  Modelica.Blocks.Math.Gain gain1(k = 4) annotation(Placement(transformation(origin = {-24,4}, extent = {{-4,-4},{4,4}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(tau_constant = 0) annotation(Placement(transformation(extent = {{-5,-5},{5,5}}, rotation = 180, origin = {57,19})));
  Elements.Inverter_withoutPWM inverter_withoutPWM annotation(Placement(transformation(extent = {{-54,46},{-34,66}})));
  Elements.SM_PermanentMagnet_cxp smpm(p = 4, fsNominal = 50, Rs = 0.00827, alpha20s(displayUnit = "1/K") = Modelica.Electrical.Machines.Thermal.Constants.alpha20Zero, Jr = 0.011, useSupport = false, psi_f = 0.0703, Lmd = 0.000342, Lmq = 0.00071, useDamperCage = false) annotation(Placement(transformation(extent = {{16,18},{30,32}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {13,75}, extent = {{-5,-5},{5,5}}, rotation = 0)));
  Elements.Pins2Plug pins2Plug annotation(Placement(visible = true, transformation(origin = {60,60}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor2 annotation(Placement(visible = true, transformation(origin = {32,84}, extent = {{-4,-4},{4,4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant target_speed(k = 1000) annotation(Placement(transformation(extent = {{-502,32},{-482,52}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantvoltage1(V = 336) annotation(Placement(visible = true, transformation(origin = {-62,58}, extent = {{-5,-5},{5,5}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(Placement(transformation(extent = {{30,-24},{40,-14}})));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 0.25) annotation(Placement(transformation(extent = {{-7,-7},{7,7}}, rotation = 90, origin = {35,-7})));
  CoSimulation.Interface_dll interface_dll(out_num_ex = 3,                                                                                                    samplePeriod = 0.0001,
    dll_name_ex="Control_PMSM_withoutPWM_id0_win32.dll",
    init_name_ex="Control_PMSM_withoutPWM_id0_initialize",
    step_name_ex="Control_PMSM_withoutPWM_id0_step",
    ter_name_ex="Control_PMSM_withoutPWM_id0_terminate",
    in_name_ex="Control_PMSM_withoutPWM_id0_U",
    out_name_ex="Control_PMSM_withoutPWM_id0_Y")                                                                                                     annotation(Placement(visible = true, transformation(origin = {-60,-20}, extent = {{-10,-10},{10,10}}, rotation = 180)));
equation
  connect(inverter_withoutPWM.c_sig,interface_dll.y[3]) annotation(Line(points={{-38,
          65.4},{-38,80},{-90,80},{-90,-20.6667},{-70,-20.6667}},                                                                                           color = {0,0,127}));
  connect(inverter_withoutPWM.b_sig,interface_dll.y[2]) annotation(Line(points = {{-44,65.40000000000001},{-44,76},{-86,76},{-86,-20},{-70,-20}}, color = {0,0,127}));
  connect(inverter_withoutPWM.a_sig,interface_dll.y[1]) annotation(Line(points={{-49.4,
          65.4},{-50,65.4},{-50,72},{-82,72},{-82,-20},{-70,-20},{-70,
          -19.3333}},                                                                                                    color = {0,0,127}));
  connect(gain.y,interface_dll.u[5]) annotation(Line(points={{-20.4,
          -12},{-34,-12},{-34,-20},{-50,-20},{-50,-20}},                                                               color = {0,0,127}));
  connect(gain1.y,interface_dll.u[4]) annotation(Line(points={{-28.4,4},
          {-28.4,4},{-34,4},{-34,-18},{-38,-18},{-38,-20},{-50,-20},{
          -50,-20.75}},                                                                                                    color = {0,0,127}));
  connect(ic.i,interface_dll.u[3]) annotation(Line(points={{-25,44},{
          -26,44},{-26,16},{-34,16},{-34,-20.25},{-50,-20.25}},                                                        color = {0,0,127}));
  connect(ib.i,interface_dll.u[2]) annotation(Line(points={{-15,50},{
          -16,50},{-16,16},{-34,16},{-34,-19.75},{-50,-19.75}},                                                            color = {0,0,127}));
  connect(ia.i,interface_dll.u[1]) annotation(Line(points={{-5,54},{
          -4,54},{-4,16},{-34,16},{-34,-18},{-50,-18},{-50,-19.25}},                                                            color = {0,0,127}));
  connect(constantvoltage1.n,inverter_withoutPWM.minus) annotation(Line(points = {{-62,53},{-62,51.9949},{-54.2,51.9949},{-54.2,51.8}}));
  connect(constantvoltage1.p,inverter_withoutPWM.plus) annotation(Line(points = {{-62,63},{-62,62.0335},{-54.2,62.0335},{-54.2,62}}));
  connect(gain1.u,angleSensor.phi) annotation(Line(points = {{-19.2,4},{3.71179,4},{3.71179,3},{3.5,3}}));
  connect(voltagesensor2.p,pins2Plug.pin) annotation(Line(points={{28,84},
          {27.0245,84},{27.0245,65.6577},{52.7153,65.6577}}));
  connect(voltagesensor1.n,pins2Plug.pin1) annotation(Line(points={{18,75},
          {18,60},{52.7153,60},{52.7153,59.9816}}));
  connect(voltagesensor1.p,pins2Plug.pin) annotation(Line(points={{8,75},{
          5.40541,75},{5.40541,65.6577},{52.7153,65.6577}}));
  connect(ia.n,pins2Plug.pin) annotation(Line(points={{-2,57},{-2,
          65.6577},{52.7153,65.6577}}));
  connect(ib.n,pins2Plug.pin1) annotation(Line(points={{-12,53},{20,
          53},{20,60},{52.7153,60},{52.7153,59.9816}}));
  connect(ic.n,pins2Plug.pin2) annotation(Line(points={{-22,47},{-22,
          48},{32,48},{52.7153,48},{52.7153,54.6626}}));
  connect(pins2Plug.positiveplug1,terminalBox.plugSupply) annotation(Line(points={{66.3141,
          59.9043},{74,59.9043},{74,56},{74,44},{23,44},{23,40.6}}));
  connect(speedSensor.flange,angleSensor.flange) annotation(Line(points = {{12,-12},{18,-12},{18,3},{14,3}}, color = {0,0,0}));
  connect(gain.u,speedSensor.w) annotation(Line(points = {{-11.2,-12},{-2,-12},{3.6,-12}}, color = {0,0,127}));
  connect(constantTorque.flange,angleSensor.flange) annotation(Line(points = {{52,19},{46,19},{46,20},{40,20},{40,2},{32,2},{32,3},{14,3}}, color = {0,0,0}, smooth = Smooth.None));
  connect(inverter_withoutPWM.a,ia.p) annotation(Line(points = {{-34,62},{-22,62},{-22,57},{-8,57}}, color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.b,ib.p) annotation(Line(points = {{-34,56},{-26,56},{-26,53},{-18,53}}, color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.c,ic.p) annotation(Line(points = {{-34,49.8},{-32,49.8},{-32,47},{-28,47}}, color = {0,0,255}, smooth = Smooth.None));
  connect(smpm.plug_sn,terminalBox.plug_sn) annotation(Line(points = {{18.8,32},{18.2,32},{18.2,39}}, color = {0,0,255}, smooth = Smooth.None));
  connect(smpm.plug_sp,terminalBox.plug_sp) annotation(Line(points = {{27.2,32},{27.8,32},{27.8,39}}, color = {0,0,255}, smooth = Smooth.None));
  connect(smpm.flange,angleSensor.flange) annotation(Line(points = {{30,25},{36,25},{36,20},{40,20},{40,2},{32,2},{32,3},{14,3}}, color = {0,0,0}, smooth = Smooth.None));
  connect(voltagesensor2.n,pins2Plug.pin2) annotation(Line(points={{36,84},
          {36,54},{48,54},{52,54},{52,54.6626},{52.7153,54.6626}},                                                                    color = {0,0,255}, smooth = Smooth.None));
  connect(ground1.p,inverter_withoutPWM.minus) annotation(Line(points = {{-60,48},{-60,52},{-54.2,51.8}}, color = {0,0,255}, smooth = Smooth.None));
  connect(damper1.flange_a,fixed.flange) annotation(Line(points = {{35,-14},{35,-19}}, color = {0,0,0}, smooth = Smooth.None));
  connect(damper1.flange_b,angleSensor.flange) annotation(Line(points = {{35,2.66454e-015},{35,2},{32,2},{32,3},{14,3}}, color = {0,0,0}, smooth = Smooth.None));
  annotation(viewSettings(clrRaster = 8421504), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSMsystem_withoutPWM;
