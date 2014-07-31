within TDL_v1.ElectricDrives.PMSMsystem.system;
model PMSM_withoutPWM
  Modelica.Electrical.Analog.Sensors.CurrentSensor ia annotation(Placement(transformation(extent={{-280,16},
            {-260,36}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ib annotation(Placement(transformation(extent={{-240,
            -10},{-220,10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ic annotation(Placement(transformation(extent={{-200,
            -32},{-180,-12}})));
  Elements.Pins2Plug pins2Plug1 annotation(Placement(transformation(extent={{-160,
            -44},{-114,46}})));
  Elements.Inverter_withoutPWM inverter_withoutPWM annotation(Placement(transformation(extent={{-370,
            -42},{-302,42}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-546,90},{-526,110}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{-546,-110},{-526,-90}})));
  Modelica.Blocks.Interfaces.RealInput ua annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-380,150})));
  Modelica.Blocks.Interfaces.RealInput ub annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-220,150})));
  Modelica.Blocks.Interfaces.RealInput uc annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-80,152})));
  Modelica.Blocks.Interfaces.RealOutput i_a annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-460,-140})));
  Modelica.Blocks.Interfaces.RealOutput i_b annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-380,-140})));
  Modelica.Blocks.Interfaces.RealOutput i_c annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-300,-144})));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug positivePlug
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation
  connect(inverter_withoutPWM.a, ia.p) annotation (Line(
      points={{-302,25.2},{-280,25.2},{-280,26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ia.n, pins2Plug1.pin) annotation (Line(
      points={{-260,26},{-153.755,26},{-153.755,26.4595}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(ib.n, pins2Plug1.pin1) annotation (Line(
      points={{-220,0},{-153.755,0},{-153.755,0.917178}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ic.n, pins2Plug1.pin2) annotation (Line(
      points={{-180,-22},{-153.755,-22},{-153.755,-23.0184}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.b, ib.p) annotation (Line(
      points={{-302,0},{-240,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ic.p, inverter_withoutPWM.c) annotation (Line(
      points={{-200,-22},{-302,-22},{-302,-26.04}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.a_sig, ua) annotation (Line(
      points={{-354.36,39.48},{-354.36,78},{-380,78},{-380,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.b_sig, ub) annotation (Line(
      points={{-336,39.48},{-336,100},{-220,100},{-220,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.c_sig, uc) annotation (Line(
      points={{-315.6,39.48},{-315.6,78},{-80,78},{-80,152}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pin_p, inverter_withoutPWM.plus) annotation (Line(
      points={{-536,100},{-420,100},{-420,25.2},{-370.68,25.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pin_n, inverter_withoutPWM.minus) annotation (Line(
      points={{-536,-100},{-460,-100},{-460,-16},{-370.68,-16},{-370.68,
          -17.64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ia.i, i_a) annotation (Line(
      points={{-270,16},{-270,-74},{-460,-74},{-460,-140}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ib.i, i_b) annotation (Line(
      points={{-230,-10},{-230,-94},{-380,-94},{-380,-140}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ic.i, i_c) annotation (Line(
      points={{-190,-32},{-190,-114},{-300,-114},{-300,-144}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pins2Plug1.positiveplug1, positivePlug) annotation (Line(
      points={{-122.478,0.569305},{2,0.569305},{2,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(extent={{-540,-140},{0,140}},     preserveAspectRatio=false),   graphics), Icon(coordinateSystem(extent={{-540,
            -140},{0,140}},                                                                                                    preserveAspectRatio=false),   graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSM_withoutPWM;
