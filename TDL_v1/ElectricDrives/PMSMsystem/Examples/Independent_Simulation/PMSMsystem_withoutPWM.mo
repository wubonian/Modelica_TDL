within TDL_v1.ElectricDrives.PMSMsystem.Examples.Independent_Simulation;
model PMSMsystem_withoutPWM
  Modelica.Electrical.Analog.Sensors.CurrentSensor ia annotation(Placement(transformation(extent = {{-26,48},{-6,68}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ib annotation(Placement(transformation(extent = {{-4,28},{16,48}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ic annotation(Placement(transformation(extent = {{18,12},{38,32}})));
  Modelica.Blocks.Sources.Constant i_d_target(k = 0) annotation(Placement(transformation(extent = {{-312,44},{-292,64}})));
  Modelica.Blocks.Sources.Constant target_speed(k = 2000) annotation(Placement(transformation(extent = {{-532,-36},{-512,-16}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{-86,-126},{-106,-106}})));
  Modelica.Blocks.Math.Gain rad_s2r_min(k = 30 / 3.14) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {-466,-100})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{-68,-96},{-90,-74}})));
  Modelica.Blocks.Math.Gain gain(k = 4) annotation(Placement(transformation(extent = {{-112,-96},{-132,-76}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y") annotation(Placement(transformation(extent = {{28,-46},{72,-2}})));
  Coordinate_Transformation.Park park1 annotation(Placement(transformation(extent = {{-18,-25},{18,25}}, rotation = 180, origin = {-232,-37})));
  Coordinate_Transformation.inv_Park inv_Park annotation(Placement(transformation(extent = {{-196,28},{-176,48}})));
  Coordinate_Transformation.Clarke clarke1 annotation(Placement(transformation(extent = {{-17,-25},{17,25}}, rotation = 180, origin = {-141,-43})));
  Elements.Pins2Plug pins2Plug1 annotation(Placement(transformation(extent = {{44,10},{76,68}})));
  Coordinate_Transformation.inv_Clarke inv_Clarke annotation(Placement(transformation(extent = {{-162,22},{-132,58}})));
  Elements.Inverter_withoutPWM inverter_withoutPWM annotation(Placement(transformation(extent = {{-76,22},{-36,56}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-100,12},{-90,22}})));
  Modelica.Blocks.Math.Gain Te_iq(k = 2 / (3 * 4 * (0.0703 + 0.000342 - 0.00071))) annotation(Placement(transformation(extent = {{-9,-9},{9,9}}, rotation = 0, origin = {-299,17})));
  Control.PI pI3(k_P_p = 25, k_I_p = 1, max_limit = 336 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-227,54}, extent = {{-20,-10},{10,10}}, rotation = 0)));
  Control.PI pI2(k_P_p = 25, max_limit = 336 / sqrt(3), k_I_p = 5) annotation(Placement(visible = true, transformation(origin = {-227,25}, extent = {{-20,-11},{10,11}}, rotation = 0)));
  Control.PI pI1(k_I_p = 0.2, max_limit = 150, k_P_p = 0.2) annotation(Placement(visible = true, transformation(origin = {-419,-28}, extent = {{-20,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-476,-36},{-456,-16}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(extent = {{-272,16},{-252,36}})));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(transformation(extent = {{-284,44},{-264,64}})));
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-398,10},{-378,30}})));
  Modelica.Blocks.Sources.Step torque_req(height = -25, offset = 20, startTime = 1) annotation(Placement(transformation(extent = {{-528,84},{-508,104}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 336) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-100,40})));
  Modelica.Blocks.Logical.Not not1 annotation(Placement(transformation(extent = {{-454,-4},{-434,16}})));
  Modelica.Blocks.Sources.Step Torq_Spd(height = -1, offset = 2,
    startTime=0.2)                                                              annotation(Placement(transformation(extent = {{-526,44},{-506,64}})));
  Modelica.Blocks.Sources.Constant F_or_R(k = 2) annotation(Placement(transformation(extent = {{-534,-158},{-514,-138}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = 1.5) annotation(Placement(transformation(extent = {{-488,44},{-468,64}})));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-350,6},{-330,26}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = 2.5) annotation(Placement(transformation(extent = {{-420,-84},{-400,-64}})));
  Modelica.Blocks.Logical.Switch switch2 annotation(Placement(transformation(extent = {{-376,-80},{-356,-60}})));
  Modelica.Blocks.Sources.Constant reverse(k = -1) annotation(Placement(transformation(extent = {{-402,-56},{-386,-40}})));
  Modelica.Blocks.Sources.Constant forward(k = 1) annotation(Placement(transformation(extent = {{-400,-108},{-384,-92}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = false) annotation(Placement(transformation(extent = {{-322,106},{-302,126}})));
  Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {-466,-62})));
  Elements.SM_PermanentMagnet_cxp smpm(p = 4, fsNominal = 50, Rs = 0.00827, alpha20s(displayUnit = "1/K") = Modelica.Electrical.Machines.Thermal.Constants.alpha20Zero, Jr = 0.011, useSupport = false, psi_f = 0.0703, Lmd = 0.000342, Lmq = 0.00071, useDamperCage = false, wMechanical(start = 0)) annotation(Placement(transformation(extent = {{30,-104},{58,-76}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=0.08)
    annotation (Placement(transformation(extent={{-30,-174},{-10,-154}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{4,-180},{24,-160}})));
equation
  connect(pI2.y,inv_Park.u_q) annotation(Line(points = {{-217,25},{-212,25},{-212,38},{-196,38}}, color = {0,0,127}));
  connect(pI3.y,inv_Park.u_d) annotation(Line(points = {{-217,54},{-212,54},{-212,44},{-196,44}}, color = {0,0,127}));
  connect(speedSensor.w,rad_s2r_min.u) annotation(Line(points = {{-107,-116},{-466,-116},{-466,-112}}, color = {0,0,127}, smooth = Smooth.None));
  connect(speedSensor.flange,angleSensor.flange) annotation(Line(points = {{-86,-116},{-68,-116},{-68,-85}}, color = {0,0,0}, smooth = Smooth.None));
  connect(inv_Park.u_alfa,inv_Clarke.i_alfa) annotation(Line(points = {{-176,42},{-166,42},{-166,50.8},{-162.6,50.8}}, color = {0,0,127}, smooth = Smooth.None));
  connect(inv_Park.u_beta,inv_Clarke.i_beta) annotation(Line(points = {{-176,34},{-166,34},{-166,29.2},{-162.6,29.2}}, color = {0,0,127}, smooth = Smooth.None));
  connect(inv_Clarke.i_a,inverter_withoutPWM.a_sig) annotation(Line(points = {{-129.9,54.4},{-66.8,54.4},{-66.8,54.98}}, color = {0,0,127}, smooth = Smooth.None));
  connect(inv_Clarke.i_b,inverter_withoutPWM.b_sig) annotation(Line(points = {{-129.9,40},{-124,40},{-124,64},{-56,64},{-56,54.98}}, color = {0,0,127}, smooth = Smooth.None));
  connect(inv_Clarke.i_c,inverter_withoutPWM.c_sig) annotation(Line(points = {{-129.9,25.6},{-44,25.6},{-44,54.98}}, color = {0,0,127}, smooth = Smooth.None));
  connect(inverter_withoutPWM.a,ia.p) annotation(Line(points = {{-36,49.2},{-28,49.2},{-28,56},{-26,56},{-26,58}}, color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.b,ib.p) annotation(Line(points = {{-36,39},{-10,39},{-10,38},{-4,38}}, color = {0,0,255}, smooth = Smooth.None));
  connect(inverter_withoutPWM.c,ic.p) annotation(Line(points = {{-36,28.46},{-28,28.46},{-28,28},{0,28},{0,22},{18,22}}, color = {0,0,255}, smooth = Smooth.None));
  connect(ia.n,pins2Plug1.pin) annotation(Line(points={{-6,58},{28,58},
          {28,55.4072},{48.3445,55.4072}},                                                                color = {0,0,255}, smooth = Smooth.None));
  connect(ib.n,pins2Plug1.pin1) annotation(Line(points={{16,38},{40,
          38},{40,38.9466},{48.3445,38.9466}},                                                             color = {0,0,255}, smooth = Smooth.None));
  connect(ic.n,pins2Plug1.pin2) annotation(Line(points={{38,22},{48,
          22},{48,23.5215},{48.3445,23.5215}},                                                             color = {0,0,255}, smooth = Smooth.None));
  connect(pins2Plug1.positiveplug1,terminalBox.plugSupply) annotation(Line(points={{70.1026,
          38.7224},{70.1026,40},{78,40},{78,2},{50,2},{50,-41.6}},                                                                                     color = {0,0,255}, smooth = Smooth.None));
  connect(gain.y,park1.theta) annotation(Line(points = {{-133,-86},{-182,-86},{-182,-22},{-214,-22}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_beta,clarke1.i_beta) annotation(Line(points = {{-214,-37},{-158,-37},{-158,-38}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_alfa,clarke1.i_alfa) annotation(Line(points = {{-214,-52},{-158,-52},{-158,-53}}, color = {0,0,127}, smooth = Smooth.None));
  connect(inv_Park.theta,park1.theta) annotation(Line(points = {{-196,32},{-202,32},{-202,-22},{-214,-22}}, color = {0,0,127}, smooth = Smooth.None));
  connect(clarke1.i_c,ic.i) annotation(Line(points = {{-124,-28},{28,-28},{28,12}}, color = {0,0,127}, smooth = Smooth.None));
  connect(clarke1.i_b,ib.i) annotation(Line(points = {{-124,-43},{7,-43},{7,28},{6,28}}, color = {0,0,127}, smooth = Smooth.None));
  connect(clarke1.i_a,ia.i) annotation(Line(points = {{-124,-58},{-16,-58},{-16,48}}, color = {0,0,127}, smooth = Smooth.None));
  connect(target_speed.y,feedback.u1) annotation(Line(points = {{-511,-26},{-474,-26}}, color = {0,0,127}, smooth = Smooth.None));
  connect(feedback.y,pI1.u) annotation(Line(points = {{-457,-26},{-438,-26},{-438,-28},{-439,-28}}, color = {0,0,127}, smooth = Smooth.None));
  connect(gain.u,angleSensor.phi) annotation(Line(points = {{-110,-86},{-86,-86},{-86,-85},{-91.09999999999999,-85}}, color = {0,0,127}, smooth = Smooth.None));
  connect(Te_iq.y,feedback1.u1) annotation(Line(points = {{-289.1,17},{-280,17},{-280,26},{-270,26}}, color = {0,0,127}, smooth = Smooth.None));
  connect(feedback1.y,pI2.u) annotation(Line(points = {{-253,26},{-252,26},{-252,25},{-247,25}}, color = {0,0,127}, smooth = Smooth.None));
  connect(i_d_target.y,feedback2.u1) annotation(Line(points = {{-291,54},{-282,54}}, color = {0,0,127}, smooth = Smooth.None));
  connect(feedback2.y,pI3.u) annotation(Line(points = {{-265,54},{-247,54}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_q,feedback1.u2) annotation(Line(points = {{-250,-27},{-262,-27},{-262,18}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_d,feedback2.u2) annotation(Line(points = {{-250,-47},{-274,-47},{-274,46}}, color = {0,0,127}, smooth = Smooth.None));
  connect(pI1.y,switch1.u3) annotation(Line(points = {{-409,-28},{-400,-28},{-400,12}}, color = {0,0,127}, smooth = Smooth.None));
  connect(torque_req.y,switch1.u1) annotation(Line(points = {{-507,94},{-406,94},{-406,28},{-400,28}}, color = {0,0,127}, smooth = Smooth.None));
  connect(constantVoltage.p,inverter_withoutPWM.plus) annotation(Line(points = {{-100,50},{-90,50},{-90,49.2},{-76.40000000000001,49.2}}, color = {0,0,255}, smooth = Smooth.None));
  connect(constantVoltage.n,inverter_withoutPWM.minus) annotation(Line(points = {{-100,30},{-88,30},{-88,31.86},{-76.40000000000001,31.86}}, color = {0,0,255}, smooth = Smooth.None));
  connect(ground.p,constantVoltage.n) annotation(Line(points = {{-95,22},{-98,22},{-98,30},{-100,30}}, color = {0,0,255}, smooth = Smooth.None));
  connect(not1.u,switch1.u2) annotation(Line(points = {{-456,6},{-456,54},{-416,54},{-416,20},{-400,20}}, color = {255,0,255}, smooth = Smooth.None));
  connect(not1.y,pI1.u1) annotation(Line(points = {{-433,6},{-430,6},{-430,-38.2},{-429.2,-38.2}}, color = {255,0,255}, smooth = Smooth.None));
  connect(Torq_Spd.y,greaterThreshold.u) annotation(Line(points = {{-505,54},{-490,54}}, color = {0,0,127}, smooth = Smooth.None));
  connect(greaterThreshold.y,switch1.u2) annotation(Line(points = {{-467,54},{-416,54},{-416,20},{-400,20}}, color = {255,0,255}, smooth = Smooth.None));
  connect(switch1.y,product.u1) annotation(Line(points = {{-377,20},{-364,20},{-364,22},{-352,22}}, color = {0,0,127}, smooth = Smooth.None));
  connect(product.y,Te_iq.u) annotation(Line(points = {{-329,16},{-319.5,16},{-319.5,17},{-309.8,17}}, color = {0,0,127}, smooth = Smooth.None));
  connect(F_or_R.y,greaterThreshold1.u) annotation(Line(points = {{-513,-148},{-434,-148},{-434,-74},{-422,-74}}, color = {0,0,127}, smooth = Smooth.None));
  connect(greaterThreshold1.y,switch2.u2) annotation(Line(points = {{-399,-74},{-388,-74},{-388,-70},{-378,-70}}, color = {255,0,255}, smooth = Smooth.None));
  connect(switch2.y,product.u2) annotation(Line(points = {{-355,-70},{-354,-70},{-354,10},{-352,10}}, color = {0,0,127}, smooth = Smooth.None));
  connect(reverse.y,switch2.u1) annotation(Line(points = {{-385.2,-48},{-378,-48},{-378,-62}}, color = {0,0,127}, smooth = Smooth.None));
  connect(forward.y,switch2.u3) annotation(Line(points = {{-383.2,-100},{-380,-100},{-380,-78},{-378,-78}}, color = {0,0,127}, smooth = Smooth.None));
  connect(booleanConstant.y,pI3.u1) annotation(Line(points = {{-301,116},{-301,79},{-237.2,79},{-237.2,43.8}}, color = {255,0,255}, smooth = Smooth.None));
  connect(pI2.u1,pI3.u1) annotation(Line(points = {{-237.2,13.78},{-237.2,43.8}}, color = {255,0,255}, smooth = Smooth.None));
  connect(abs1.y,feedback.u2) annotation(Line(points = {{-466,-51},{-466,-34}}, color = {0,0,127}, smooth = Smooth.None));
  connect(rad_s2r_min.y,abs1.u) annotation(Line(points = {{-466,-89},{-466,-74}}, color = {0,0,127}, smooth = Smooth.None));
  connect(smpm.plug_sn,terminalBox.plug_sn) annotation(Line(points = {{35.6,-76},{36,-76},{36,-46},{36.8,-46}}, color = {0,0,255}, smooth = Smooth.None));
  connect(smpm.plug_sp,terminalBox.plug_sp) annotation(Line(points = {{52.4,-76},{52.4,-61},{63.2,-61},{63.2,-46}}, color = {0,0,255}, smooth = Smooth.None));
  connect(smpm.flange,angleSensor.flange) annotation(Line(points = {{58,-90},{72,-90},{72,-140},{-68,-140},{-68,-85}}, color = {0,0,0}, smooth = Smooth.None));
  connect(damper.flange_b, fixed.flange) annotation (Line(
      points={{-10,-164},{2,-164},{2,-170},{14,-170}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper.flange_a, angleSensor.flange) annotation (Line(
      points={{-30,-164},{-30,-140},{-68,-140},{-68,-85}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(extent={{-540,-200},{100,140}},   preserveAspectRatio=false),   graphics), Icon(coordinateSystem(extent = {{-540,-200},{100,140}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSMsystem_withoutPWM;
