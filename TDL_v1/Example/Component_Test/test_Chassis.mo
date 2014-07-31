within TDL_v1.Example.Component_Test;
model test_Chassis

  Vehicle.Vehicle_1D_Suspension vehicle_1D_Suspension
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Wheel.ParametrizedModels.Rill_195_65_R15_Set1 pacejka_195_65_R15_Set1_1
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-50,-50})));
  Wheel.ParametrizedModels.Rill_195_65_R15_Set1 pacejka_195_65_R15_Set1_2
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,50})));
  Wheel.ParametrizedModels.Rill_195_65_R15_Set1 pacejka_195_65_R15_Set1_3
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,50})));
  Wheel.ParametrizedModels.Rill_195_65_R15_Set1 pacejka_195_65_R15_Set1_4
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={50,-50})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(
      tau_constant=0)
    annotation (Placement(transformation(extent={{100,40},{80,60}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque1(
      tau_constant=0)
    annotation (Placement(transformation(extent={{100,-60},{80,-40}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.03)
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque2(
      tau_constant=100)
    annotation (Placement(transformation(extent={{-180,-10},{-160,10}})));
  Transmission.Differential.Differential differential annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-90,0})));
equation
  connect(pacejka_195_65_R15_Set1_1.carrierFlange, vehicle_1D_Suspension.frontAxle_left)
    annotation (Line(
      points={{-40,-50},{-15.2,-50},{-15.2,-19.2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(pacejka_195_65_R15_Set1_2.carrierFlange, vehicle_1D_Suspension.frontAxle_right)
    annotation (Line(
      points={{-40,50},{-15.2,50},{-15.2,19.2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(pacejka_195_65_R15_Set1_3.carrierFlange, vehicle_1D_Suspension.rearAxle_right)
    annotation (Line(
      points={{40,50},{15.2,50},{15.2,19.2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(pacejka_195_65_R15_Set1_4.carrierFlange, vehicle_1D_Suspension.rearAxle_left)
    annotation (Line(
      points={{40,-50},{15.2,-50},{15.2,-19.2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(pacejka_195_65_R15_Set1_4.roadFlange, vehicle_1D_Suspension.chassis)
    annotation (Line(
      points={{50,-40},{50,-30},{-40,-30},{-40,0},{-20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(pacejka_195_65_R15_Set1_1.roadFlange, vehicle_1D_Suspension.chassis)
    annotation (Line(
      points={{-50,-40},{-50,0},{-20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(pacejka_195_65_R15_Set1_2.roadFlange, vehicle_1D_Suspension.chassis)
    annotation (Line(
      points={{-50,40},{-50,0},{-20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(pacejka_195_65_R15_Set1_3.roadFlange, vehicle_1D_Suspension.chassis)
    annotation (Line(
      points={{50,40},{50,30},{-40,30},{-40,0},{-20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(const.y, vehicle_1D_Suspension.slope_resistance) annotation (Line(
      points={{39,0},{20,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(constantTorque.flange, pacejka_195_65_R15_Set1_3.hubFlange)
    annotation (Line(
      points={{80,50},{60,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constantTorque1.flange, pacejka_195_65_R15_Set1_4.hubFlange)
    annotation (Line(
      points={{80,-50},{60,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constantTorque2.flange, inertia.flange_a) annotation (Line(
      points={{-160,0},{-140,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, differential.diffInput) annotation (Line(
      points={{-120,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(differential.diffOutput1, pacejka_195_65_R15_Set1_2.hubFlange)
    annotation (Line(
      points={{-90,10},{-90,50},{-60,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(differential.diffOutput2, pacejka_195_65_R15_Set1_1.hubFlange)
    annotation (Line(
      points={{-90,-10},{-90,-50},{-60,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -100},{100,100}}), graphics), Icon(coordinateSystem(extent={{-180,-100},
            {100,100}})));
end test_Chassis;
