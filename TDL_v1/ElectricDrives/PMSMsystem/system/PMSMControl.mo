within TDL_v1.ElectricDrives.PMSMsystem.system;
model PMSMControl

  Modelica.Blocks.Math.Gain rad_s2r_min(k = 30 / 3.14) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {-466,-100})));
  Modelica.Blocks.Math.Gain gain(k = 4) annotation(Placement(transformation(extent={{10,-10},
            {-10,10}},
        rotation=180,
        origin={-276,-134})));
  Coordinate_Transformation.Park park1 annotation(Placement(transformation(extent = {{-18,-25},{18,25}}, rotation = 180, origin = {-232,-37})));
  Coordinate_Transformation.inv_Park inv_Park annotation(Placement(transformation(extent={{-166,-2},
            {-114,68}})));
  Coordinate_Transformation.Clarke clarke1 annotation(Placement(transformation(extent={{-18,-42},
            {18,42}},                                                                                        rotation=90,    origin={-46,-100})));
  Coordinate_Transformation.inv_Clarke inv_Clarke annotation(Placement(transformation(extent={{-92,0},
            {-50,70}})));
  TDL_v1.Blocks.PI pI3(
    k_P_p=25,
    k_I_p=1,
    max_limit=336/sqrt(3),
    outMax_Integrator=100,
    sampleLimit_Integrator=false,
    samplePeriod_Integrator=0.1) annotation (Placement(visible=true,
        transformation(
        origin={-227,54},
        extent={{-20,-10},{10,10}},
        rotation=0)));
  TDL_v1.Blocks.PI pI2(
    k_P_p=25,
    max_limit=336/sqrt(3),
    k_I_p=5,
    outMax_Integrator=100,
    sampleLimit_Integrator=false,
    samplePeriod_Integrator=0.1) annotation (Placement(visible=true,
        transformation(
        origin={-227,25},
        extent={{-20,-11},{10,11}},
        rotation=0)));
  TDL_v1.Blocks.PI pI1(
    k_I_p=0.2,
    max_limit=150,
    k_P_p=0.2,
    outMax_Integrator=100,
    sampleLimit_Integrator=false,
    samplePeriod_Integrator=0.1) annotation (Placement(visible=true,
        transformation(
        origin={-419,-28},
        extent={{-20,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-476,-36},{-456,-16}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(extent = {{-272,16},{-252,36}})));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(transformation(extent = {{-284,44},{-264,64}})));
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-398,10},{-378,30}})));
  Modelica.Blocks.Logical.Not not1 annotation(Placement(transformation(extent = {{-454,-4},{-434,16}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = 1.5) annotation(Placement(transformation(extent = {{-488,44},{-468,64}})));
  Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-350,6},{-330,26}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = 2.5) annotation(Placement(transformation(extent={{-420,
            -110},{-400,-90}})));
  Modelica.Blocks.Logical.Switch switch2 annotation(Placement(transformation(extent={{-376,
            -106},{-356,-86}})));
  Modelica.Blocks.Sources.Constant reverse(k = -1) annotation(Placement(transformation(extent={{-402,
            -82},{-386,-66}})));
  Modelica.Blocks.Sources.Constant forward(k = 1) annotation(Placement(transformation(extent={{-400,
            -134},{-384,-118}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = false) annotation(Placement(transformation(extent={{-270,78},
            {-250,98}})));
  Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin={-466,-68})));
  Modelica.Blocks.Interfaces.RealInput Torque_require
    annotation (Placement(transformation(extent={{-560,60},{-520,100}})));
  Modelica.Blocks.Interfaces.RealInput targetSpd
    annotation (Placement(transformation(extent={{-560,-80},{-520,-40}})));
  Modelica.Blocks.Interfaces.RealInput Trq_or_Spd
    annotation (Placement(transformation(extent={{-560,-10},{-520,30}})));
  Modelica.Blocks.Interfaces.RealInput F_or_R annotation (Placement(
        transformation(extent={{-560,-150},{-520,-110}})));
  Modelica.Blocks.Interfaces.RealInput theta_m annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-374,-200})));
  Modelica.Blocks.Interfaces.RealInput ia annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-140,-200})));
  Modelica.Blocks.Interfaces.RealInput ib annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-200})));
  Modelica.Blocks.Interfaces.RealInput ic annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={40,-200})));
  Modelica.Blocks.Interfaces.RealOutput ua
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput ub
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput uc
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput spd annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-466,-200})));
  Modelica.Blocks.Tables.CombiTable2D id_req(tableOnFile = true, tableName = "id_table",
    fileName="D:/TDL_Version2_Workspace/PMSM/id_table.mat")                                                                                                     annotation(Placement(transformation(extent={{-310,40},
            {-290,60}})));
  Modelica.Blocks.Tables.CombiTable2D iq_req(tableOnFile = true, tableName = "iq_table",
    fileName="D:/TDL_Version2_Workspace/PMSM/iq_table.mat")                                                                                                     annotation(Placement(transformation(extent={{-306,2},
            {-286,22}})));
equation
  connect(pI2.y,inv_Park.u_q) annotation(Line(points={{-217,25},{-212,25},{
          -212,33},{-166,33}},                                                                    color = {0,0,127}));
  connect(pI3.y,inv_Park.u_d) annotation(Line(points={{-217,54},{-212,54},{
          -166,54}},                                                                              color = {0,0,127}));
  connect(inv_Park.u_alfa,inv_Clarke.i_alfa) annotation(Line(points={{-114,47},
          {-114,56},{-92.84,56}},                                                                                      color = {0,0,127}, smooth = Smooth.None));
  connect(inv_Park.u_beta,inv_Clarke.i_beta) annotation(Line(points={{-114,19},
          {-94,19},{-94,14},{-92.84,14}},                                                                              color = {0,0,127}, smooth = Smooth.None));
  connect(gain.y,park1.theta) annotation(Line(points={{-265,-134},{-202,
          -134},{-202,-22},{-214,-22}},                                                               color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_beta,clarke1.i_beta) annotation(Line(points={{-214,-37},{
          -37.6,-37},{-37.6,-82}},                                                                  color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_alfa,clarke1.i_alfa) annotation(Line(points={{-214,-52},{
          -62.8,-52},{-62.8,-82}},                                                                  color = {0,0,127}, smooth = Smooth.None));
  connect(inv_Park.theta,park1.theta) annotation(Line(points={{-166,12},{
          -202,12},{-202,-22},{-214,-22}},                                                                  color = {0,0,127}, smooth = Smooth.None));
  connect(feedback.y,pI1.u) annotation(Line(points = {{-457,-26},{-438,-26},{-438,-28},{-439,-28}}, color = {0,0,127}, smooth = Smooth.None));
  connect(feedback1.y,pI2.u) annotation(Line(points = {{-253,26},{-252,26},{-252,25},{-247,25}}, color = {0,0,127}, smooth = Smooth.None));
  connect(feedback2.y,pI3.u) annotation(Line(points = {{-265,54},{-247,54}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_q,feedback1.u2) annotation(Line(points = {{-250,-27},{-262,-27},{-262,18}}, color = {0,0,127}, smooth = Smooth.None));
  connect(park1.i_d,feedback2.u2) annotation(Line(points = {{-250,-47},{-274,-47},{-274,46}}, color = {0,0,127}, smooth = Smooth.None));
  connect(pI1.y,switch1.u3) annotation(Line(points = {{-409,-28},{-400,-28},{-400,12}}, color = {0,0,127}, smooth = Smooth.None));
  connect(not1.u,switch1.u2) annotation(Line(points = {{-456,6},{-456,54},{-416,54},{-416,20},{-400,20}}, color = {255,0,255}, smooth = Smooth.None));
  connect(not1.y,pI1.u1) annotation(Line(points = {{-433,6},{-430,6},{-430,-38.2},{-429.2,-38.2}}, color = {255,0,255}, smooth = Smooth.None));
  connect(greaterThreshold.y,switch1.u2) annotation(Line(points = {{-467,54},{-416,54},{-416,20},{-400,20}}, color = {255,0,255}, smooth = Smooth.None));
  connect(switch1.y,product.u1) annotation(Line(points = {{-377,20},{-364,20},{-364,22},{-352,22}}, color = {0,0,127}, smooth = Smooth.None));
  connect(greaterThreshold1.y,switch2.u2) annotation(Line(points={{-399,
          -100},{-388,-100},{-388,-96},{-378,-96}},                                                               color = {255,0,255}, smooth = Smooth.None));
  connect(switch2.y,product.u2) annotation(Line(points={{-355,-96},{-354,
          -96},{-354,10},{-352,10}},                                                                  color = {0,0,127}, smooth = Smooth.None));
  connect(reverse.y,switch2.u1) annotation(Line(points={{-385.2,-74},{-378,
          -74},{-378,-88}},                                                                    color = {0,0,127}, smooth = Smooth.None));
  connect(forward.y,switch2.u3) annotation(Line(points={{-383.2,-126},{-380,
          -126},{-380,-104},{-378,-104}},                                                                   color = {0,0,127}, smooth = Smooth.None));
  connect(booleanConstant.y,pI3.u1) annotation(Line(points={{-249,88},{-238,88},
          {-238,66},{-237.2,66},{-237.2,43.8}},                                                                color = {255,0,255}, smooth = Smooth.None));
  connect(pI2.u1,pI3.u1) annotation(Line(points = {{-237.2,13.78},{-237.2,43.8}}, color = {255,0,255}, smooth = Smooth.None));
  connect(abs1.y,feedback.u2) annotation(Line(points={{-466,-57},{-466,-34}},   color = {0,0,127}, smooth = Smooth.None));
  connect(rad_s2r_min.y,abs1.u) annotation(Line(points={{-466,-89},{-466,
          -80}},                                                                  color = {0,0,127}, smooth = Smooth.None));
  connect(switch1.u1, Torque_require) annotation (Line(
      points={{-400,28},{-408,28},{-408,80},{-540,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Trq_or_Spd, greaterThreshold.u) annotation (Line(
      points={{-540,10},{-490,10},{-490,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(targetSpd, feedback.u1) annotation (Line(
      points={{-540,-60},{-516,-60},{-516,-26},{-490,-26},{-490,-26},{
          -474,-26},{-474,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(F_or_R, greaterThreshold1.u) annotation (Line(
      points={{-540,-130},{-496,-130},{-496,-146},{-440,-146},{-440,
          -100},{-422,-100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theta_m, gain.u) annotation (Line(
      points={{-374,-200},{-374,-134},{-288,-134}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ia, clarke1.i_a) annotation (Line(
      points={{-140,-200},{-140,-130},{-71.2,-130},{-71.2,-118}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ib, clarke1.i_b) annotation (Line(
      points={{-50,-200},{-50,-160},{-46,-160},{-46,-118}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ic, clarke1.i_c) annotation (Line(
      points={{40,-200},{40,-140},{-20.8,-140},{-20.8,-118}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inv_Clarke.i_a, ua) annotation (Line(
      points={{-47.06,63},{-34,63},{-34,80},{110,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inv_Clarke.i_b, ub) annotation (Line(
      points={{-47.06,35},{-38,35},{-38,40},{110,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inv_Clarke.i_c, uc) annotation (Line(
      points={{-47.06,7},{-47.06,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spd, rad_s2r_min.u) annotation (Line(
      points={{-466,-200},{-466,-112}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(id_req.u1, product.y) annotation (Line(
      points={{-312,56},{-326,56},{-326,16},{-329,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iq_req.u1, product.y) annotation (Line(
      points={{-308,18},{-326,18},{-326,16},{-329,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(id_req.u2, feedback.u2) annotation (Line(
      points={{-312,44},{-318,44},{-318,-48},{-466,-48},{-466,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iq_req.u2, feedback.u2) annotation (Line(
      points={{-308,6},{-318,6},{-318,-48},{-466,-48},{-466,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(id_req.y, feedback2.u1) annotation (Line(
      points={{-289,50},{-286,50},{-286,54},{-282,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iq_req.y, feedback1.u1) annotation (Line(
      points={{-285,12},{-277.5,12},{-277.5,26},{-270,26}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(Diagram(coordinateSystem(extent={{-540,-200},{100,140}},   preserveAspectRatio=false),   graphics), Icon(coordinateSystem(extent = {{-540,-200},{100,140}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSMControl;
