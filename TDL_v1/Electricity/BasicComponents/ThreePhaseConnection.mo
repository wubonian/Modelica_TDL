within TDL_v1.Electricity.BasicComponents;
model ThreePhaseConnection

  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug positivePlug
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug negativePlug
    annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Ron=0,
      Goff=0) annotation (Placement(transformation(extent={{-30,30},{-50,50}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch(Ron=0,
      Goff=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={0,20})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch1
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-60})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{30,-100},{50,-80}})));
  Modelica.Blocks.Interfaces.BooleanVectorInput fault[3]
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
equation
  connect(idealOpeningSwitch.p, positivePlug.pin[1]) annotation (Line(
      points={{-30,40},{60,40},{60,0},{96,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealOpeningSwitch.n, negativePlug.pin[1]) annotation (Line(
      points={{-50,40},{-60,40},{-60,0},{-96,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch.p, idealOpeningSwitch.p) annotation (Line(
      points={{0,30},{0,40},{-30,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch.n, positivePlug.pin[2]) annotation (Line(
      points={{0,10},{0,0},{96,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch.n, negativePlug.pin[2]) annotation (Line(
      points={{0,10},{0,0},{-96,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch1.n, ground.p) annotation (Line(
      points={{40,-70},{40,-80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(positivePlug, positivePlug) annotation (Line(
      points={{96,0},{96,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch1.p, positivePlug.pin[3]) annotation (Line(
      points={{40,-50},{40,-42},{60,-42},{60,0},{96,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch1.p, negativePlug.pin[3]) annotation (Line(
      points={{40,-50},{40,-42},{-60,-42},{-60,0},{-96,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealOpeningSwitch.control, fault[1]) annotation (Line(
      points={{-40,47},{-40,80},{0,80},{0,93.3333}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch.control, fault[2]) annotation (Line(
      points={{7,20},{20,20},{20,80},{0,80},{0,100}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch1.control, fault[3]) annotation (Line(
      points={{47,-60},{80,-60},{80,80},{0,80},{0,106.667}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end ThreePhaseConnection;
