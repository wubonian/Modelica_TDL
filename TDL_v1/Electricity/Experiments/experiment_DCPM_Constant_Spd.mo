within TDL_v1.Electricity.Experiments;
model experiment_DCPM_Constant_Spd
  Machines.DCMachines.DCPM dCPM
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(extent={{30,0},{10,20}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,10})));
  MechanicalActuator.Sensor_Actuator.VelocitySensor_rpm
    velocitySensor_rpm annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-30})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.1)
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Modelica.Blocks.Continuous.PI PI(k=0.1, T=0.05)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(outMax=12)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-70,40},{-50,60}})));
  Modelica.Blocks.Sources.Constant const(k=1000)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
equation
  connect(signalVoltage.p, dCPM.pin_ap) annotation (Line(
      points={{30,10},{30,-20.3333},{26,-20.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(signalVoltage.n, dCPM.pin_an) annotation (Line(
      points={{10,10},{10,-20.3333},{14,-20.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ground.p, signalVoltage.n) annotation (Line(
      points={{0,10},{10,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inertia.flange_a, dCPM.flange) annotation (Line(
      points={{60,-30},{29.6,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, velocitySensor_rpm.flange_a) annotation (Line(
      points={{80,-30},{100,-30},{100,-60},{-60,-60},{-60,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(PI.y, limIntegrator.u) annotation (Line(
      points={{-19,50},{-12,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limIntegrator.y, signalVoltage.v) annotation (Line(
      points={{11,50},{20,50},{20,17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, PI.u) annotation (Line(
      points={{-51,50},{-42,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(velocitySensor_rpm.rpm, feedback.u2) annotation (Line(
      points={{-60,-20},{-60,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, feedback.u1) annotation (Line(
      points={{-79,50},{-68,50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}), graphics));
end experiment_DCPM_Constant_Spd;
