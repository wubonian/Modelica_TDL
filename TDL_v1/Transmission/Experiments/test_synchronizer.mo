within TDL_v1.Transmission.Experiments;
model test_synchronizer

  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque1(tau_constant = 0) annotation(Placement(transformation(extent={{60,-40},
            {40,-20}})));
  Modelica.Mechanics.Translational.Sources.Force force annotation(Placement(transformation(extent={{-40,40},
            {-20,60}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent={{-100,
            -40},{-80,-20}})));
  Modelica.Blocks.Sources.Step step1(startTime = 0.5, height = -100, offset = 100) annotation(Placement(transformation(extent={{-140,
            -40},{-120,-20}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(tau_constant = 0) annotation(Placement(transformation(extent={{-100,0},
            {-80,20}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque2(tau_constant = 0) annotation(Placement(transformation(extent={{100,0},
            {80,20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 20, w(start = 0, fixed = true)) annotation(Placement(transformation(extent={{40,0},{
            60,20}})));
  Modelica.Blocks.Sources.Step step(offset = 0, height = 2000, startTime = 0.5) annotation(Placement(visible = true, transformation(origin={-69.552,
            50},                                                                                                    extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(w(start = 0, fixed = true),
    J=20,
    phi(start=0.17453292519943))                                                                                       annotation(Placement(transformation(extent={{-60,0},
            {-40,20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J=0.1)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  TDL_v1.Transmission.Synchronizer.Synchronizer synchronizer
    annotation (Placement(transformation(extent={{-20,-20},{20,0}})));
equation
  connect(step.y,force.f) annotation(Line(points={{-58.552,50},{-58.552,50},{
          -42,50}},                                                           color = {0,0,127}));
  connect(step1.y,torque.tau) annotation(Line(points={{-119,-30},{-102,-30}}, color = {0,0,127}, smooth = Smooth.None));
  connect(inertia.flange_b,constantTorque2.flange) annotation(Line(points={{60,10},
          {80,10}},                                                                            color = {0,0,0}, smooth = Smooth.None));
  connect(constantTorque.flange,inertia1.flange_a) annotation(Line(points={{-80,10},
          {-60,10}},                                                                              color = {0,0,0}, smooth = Smooth.None));
  connect(torque.flange,inertia2. flange_a) annotation (Line(
      points={{-80,-30},{-60,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia1.flange_b, synchronizer.Left_Gear) annotation (Line(
      points={{-40,10},{-26,10},{-26,-2},{-20,-2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Left_Axis, inertia2.flange_b) annotation (Line(
      points={{-20,-18},{-26,-18},{-26,-30},{-40,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Right_Axis, constantTorque1.flange) annotation (Line(
      points={{20,-18},{30,-18},{30,-30},{40,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(force.flange, synchronizer.flange_a) annotation (Line(
      points={{-20,50},{0,50},{0,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(synchronizer.Right_Gear, inertia.flange_a) annotation (Line(
      points={{20,-2},{30,-2},{30,10},{40,10}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-100},{
            150,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-150,-100},{150,
            100}})));
end test_synchronizer;
