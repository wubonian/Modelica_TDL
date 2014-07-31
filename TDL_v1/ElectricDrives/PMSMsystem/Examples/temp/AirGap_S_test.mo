within TDL_v1.ElectricDrives.PMSMsystem.Examples.temp;
model AirGap_S_test

  Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasor
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={82,0})));
  Modelica.Electrical.MultiPhase.Basic.Star star annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={38,-14})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.01)
    annotation (Placement(transformation(extent={{76,-54},{96,-34}})));
  Modelica.Electrical.Machines.BasicMachines.Components.DamperCage damperCage(
    Lrsigmad=0.0001,
    Lrsigmaq=0.0001,
    Rrd=0.01,
    Rrq=0.02) annotation (Placement(transformation(extent={{66,-94},{86,-74}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{-4,-68},{16,-48}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ia annotation(Placement(transformation(extent={{4,56},{
            24,76}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ib annotation(Placement(transformation(extent={{12,28},
            {32,48}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor ic annotation(Placement(transformation(extent={{32,8},{
            52,28}})));
  Elements.Pins2Plug pins2Plug1 annotation(Placement(transformation(extent={{54,28},{66,
            52}})));
  Elements.Inverter_withoutPWM inverter_withoutPWM annotation(Placement(transformation(extent={{-56,6},
            {-18,34}})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 50, freqHz = 10) annotation(Placement(transformation(extent={{-80,38},
            {-56,62}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 50, freqHz = 10,
    phase=-2.0943951023932)                                                                 annotation(Placement(transformation(extent={{-66,54},
            {-44,76}})));
  Modelica.Blocks.Sources.Sine sine2(amplitude = 50, freqHz = 10, phase = -4.1887902047864) annotation(Placement(transformation(extent={{-40,66},
            {-20,86}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(
                                                                     V = 336) annotation(Placement(transformation(origin={-72,20},   extent={{-10,-10},
            {10,10}},                                                                                                    rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent={{-82,-10},
            {-62,10}})));
  Modelica.Electrical.Machines.BasicMachines.Components.PermanentMagnet permanentMagnet(
      Ie=5) annotation (Placement(transformation(extent={{32,-90},{52,-70}})));
  Elements.AirGapS_cxp airGap1(
    Lmd=0.0002,
    p=4,
    Lmq=0.0003) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={48,-40})));
equation
  connect(inverter_withoutPWM.a,ia. p) annotation (Line(
      points={{-18,28.4},{-18,28},{-12,28},{-12,66},{4,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ia.n,pins2Plug1. pin) annotation (Line(
      points={{24,66},{54,66},{54,66},{56,66},{56,56},{55.6292,56},{
          55.6292,46.7892}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ib.n,pins2Plug1. pin1) annotation (Line(
      points={{32,38},{55.6292,38},{55.6292,39.9779}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ic.n,pins2Plug1. pin2) annotation (Line(
      points={{52,18},{55.6292,18},{55.6292,33.5951}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.b,ib. p) annotation (Line(
      points={{-18,20},{-6,20},{-6,36},{4,36},{4,38},{12,38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ic.p,inverter_withoutPWM. c) annotation (Line(
      points={{32,18},{16,18},{16,12},{-18,12},{-18,11.32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sine1.y,inverter_withoutPWM.b_sig) annotation(Line(points={{-42.9,65},{-40,65},
          {-40,50},{-38,50},{-38,42},{-37,42},{-37,33.16}},                                             color = {0,0,127}, smooth = Smooth.None));
  connect(sine2.y,inverter_withoutPWM.c_sig) annotation(Line(points={{-19,76},{-28,76},{
          -28,58},{-26,58},{-26,33.16},{-25.6,33.16}},                                                             color = {0,0,127}, smooth = Smooth.None));
  connect(sine.y, inverter_withoutPWM.a_sig) annotation (Line(
      points={{-54.8,50},{-48,50},{-48,50},{-47.26,50},{-47.26,33.16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ground1.p, constantVoltage1.n) annotation (Line(
      points={{-72,10},{-72,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.minus, constantVoltage1.n) annotation (Line(
      points={{-56.38,14.12},{-62,14.12},{-62,10},{-72,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.plus, constantVoltage1.p) annotation (Line(
      points={{-56.38,28.4},{-70,28.4},{-70,30},{-72,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inverter_withoutPWM.minus, ground1.p) annotation (Line(
      points={{-56.38,14.12},{-62,14.12},{-62,10},{-72,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(spacePhasor.ground, spacePhasor.zero) annotation (Line(
      points={{72,-10},{82,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(star.plug_p, spacePhasor.plug_n) annotation (Line(
      points={{48,-14},{58,-14},{58,10},{72,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(spacePhasor.plug_p, pins2Plug1.positiveplug1) annotation (Line(
      points={{92,10},{92,28},{63.7885,28},{63.7885,39.8851}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(permanentMagnet.spacePhasor_r, damperCage.spacePhasor_r) annotation (Line(
      points={{32,-70},{34,-70},{34,-62},{58,-62},{58,-74},{66,-74}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(airGap1.support, fixed.flange) annotation (Line(
      points={{40.3077,-38.4615},{28,-38.4615},{28,-42},{6,-42},{6,-58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(airGap1.spacePhasor_s, spacePhasor.spacePhasor) annotation (Line(
      points={{55.6923,-28.4615},{66,-28.4615},{66,-28},{92,-28},{92,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(airGap1.spacePhasor_r, damperCage.spacePhasor_r) annotation (Line(
      points={{55.6923,-48.4615},{62,-48.4615},{62,-58},{66,-58},{66,-74}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(airGap1.flange, inertia.flange_a) annotation (Line(
      points={{55.6923,-38.4615},{62,-38.4615},{62,-42},{76,-42},{76,-44}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics));
end AirGap_S_test;
