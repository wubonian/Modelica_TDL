within TDL_v1.Transmission.Synchronizer;
model Synchronizer
  import Modelica.Constants.pi;
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Right_Ring(J=1e-3,
      stateSelect=StateSelect.prefer)
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Hub(J=1e-3,
      stateSelect=StateSelect.default)
    annotation (Placement(transformation(extent={{-20,-100},{20,-60}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Left_Ring(J=0.001,
      stateSelect=StateSelect.prefer)
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Left_Gear(J=1e-3,
      stateSelect=StateSelect.prefer)
    annotation (Placement(transformation(extent={{-170,10},{-150,30}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Right_Gear(J=1e-3,
      stateSelect=StateSelect.prefer)
    annotation (Placement(transformation(extent={{152,10},{172,30}})));
  Modelica.Mechanics.Translational.Components.Mass mass_sleeve(m=0.05)
                                                               annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,70})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a Left_Gear
    annotation (Placement(transformation(extent={{-190,70},{-170,90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b Right_Gear
    annotation (Placement(transformation(extent={{170,70},{190,90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a Left_Axis
    annotation (Placement(transformation(extent={{-190,-90},{-170,-70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b Right_Axis
    annotation (Placement(transformation(extent={{170,-90},{190,-70}})));
  BasicComponents.Endstop.Translational.Translational_ElasticEndstop
    translational_Endstop(mode=2,
    gap=-0.0104,
    d=1e4,
    gap_L=-0.0104,
    gap_R=0.0104,
    c=1e7)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Modelica.Mechanics.Translational.Components.Fixed Left_Gear_Fix annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,36})));
  Modelica.Mechanics.Translational.Components.Fixed Left_Ring_Fix annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-136,-2})));
  Modelica.Mechanics.Translational.Components.Fixed Right_Ring_Fix annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={136,-2})));
  Modelica.Mechanics.Translational.Components.Fixed Right_Gear_Fix annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,36})));
  Modelica.Blocks.Sources.RealExpression Left_Force(y=Left_Force_Sensor.f/sin(
        4.4381/180*pi) + 1)
    annotation (Placement(transformation(extent={{-110,-30},{-130,-10}})));
  Modelica.Blocks.Sources.RealExpression Right_Force(y=Right_Force_Sensor.f/sin(
        4.4381/180*pi) + 1)
    annotation (Placement(transformation(extent={{118,-34},{138,-14}})));
  BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction Left_Friction(
    parm_mue=0.3,
    parm_w_limit=1e-3,
    parm_cgeo=0.022)
    annotation (Placement(transformation(extent={{-150,-60},{-130,-40}})));
  BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction Right_Friction(
    parm_mue=0.3,
    parm_w_limit=1e-3,
    parm_cgeo=0.022)
    annotation (Placement(transformation(extent={{130,-60},{150,-40}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor Left_Force_Sensor
    annotation (Placement(transformation(extent={{-100,-12},{-80,8}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor Right_Force_Sensor
    annotation (Placement(transformation(extent={{80,-12},{100,8}})));
  MechanicalActuator.DogClutch.DogClutch Right_Gear_Contact(
    stateSelect_T=StateSelect.default,
    stateSelect_R=StateSelect.default,
    r=0.028,
    keci=0.0001,
    N=27,
    N_contact=21,
    alfa=56/180*pi,
    gap=0.00612,
    c=1e7,
    d=1e4,
    mue=0.2,
    v_limit=0.001,
    direction=1,
    remove_friction=true)
    annotation (Placement(transformation(extent={{40,18},{60,38}})));
  MechanicalActuator.DogClutch.DogClutch Left_Gear_Contact(
    stateSelect_T=StateSelect.default,
    stateSelect_R=StateSelect.default,
    r=0.028,
    keci=0.0001,
    N=27,
    N_contact=21,
    alfa=56/180*pi,
    gap=0.00612,
    c=1e7,
    d=1e4,
    mue=0.2,
    v_limit=0.001,
    direction=-1,
    remove_friction=true)
    annotation (Placement(transformation(extent={{-40,18},{-60,38}})));
  MechanicalActuator.DogClutch.DogClutch Left_Ring_Contact(
    stateSelect_T=StateSelect.default,
    stateSelect_R=StateSelect.default,
    r=0.028,
    keci=0.0001,
    N=27,
    N_contact=18,
    alfa=56/180*pi,
    gap=0.003,
    c=1e7,
    d=1e4,
    mue=0.2,
    v_limit=0.001,
    direction=-1,
    remove_friction=true)
    annotation (Placement(transformation(extent={{-40,-20},{-60,0}})));
  MechanicalActuator.DogClutch.DogClutch Right_Ring_Contact(
    stateSelect_T=StateSelect.default,
    stateSelect_R=StateSelect.default,
    r=0.028,
    keci=0.0001,
    N=27,
    N_contact=18,
    alfa=56/180*pi,
    gap=0.003,
    c=1e7,
    d=1e4,
    mue=0.2,
    v_limit=0.001,
    direction=1,
    remove_friction=true)
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(
    b=7/180*pi,
    c=1e7,
    d=1e4) annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash1(
    b=7/180*pi,
    c=1e7,
    d=1e4) annotation (Placement(transformation(extent={{-40,-60},{-60,-40}})));
  BasicComponents.Friction.Translational.Translational_ContinuousCoulombFriction
    translational_ContinuousCoulombFriction(
    parm_mue=1,
    parm_cgeo=1,
    parm_v_limit=0.005)
    annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,60})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    tableOnFile=true,
    tableName="resistance",
    fileName=
        "D:/Library_Update/TDL_Workspace/Cam/synchronizer_resistance.mat")
    annotation (Placement(transformation(extent={{50,80},{70,100}})));
equation
  //Right_Friction.f_input=if
  connect(Left_Gear, inertia_Left_Gear.flange_a) annotation (Line(
      points={{-180,80},{-178,80},{-178,20},{-170,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia_Hub.flange_a, Left_Axis) annotation (Line(
      points={{-20,-80},{-180,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia_Hub.flange_b, Right_Axis) annotation (Line(
      points={{20,-80},{180,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Gear, inertia_Right_Gear.flange_b) annotation (Line(
      points={{180,80},{176,80},{176,20},{172,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(translational_Endstop.flange, mass_sleeve.flange_b) annotation (Line(
      points={{-40,70},{-20,70},{-20,36},{0,36},{0,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(flange_a, mass_sleeve.flange_a) annotation (Line(
      points={{0,100},{0,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Friction.flange_b, inertia_Left_Ring.flange_a) annotation (Line(
      points={{-130,-50},{-100,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Friction.flange_a, inertia_Left_Gear.flange_b) annotation (Line(
      points={{-150,-50},{-150,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Force.y, Left_Friction.f_input) annotation (Line(
      points={{-131,-20},{-140,-20},{-140,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Right_Friction.flange_b, inertia_Right_Gear.flange_a) annotation (
      Line(
      points={{150,-50},{152,-50},{152,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Friction.flange_a, inertia_Right_Ring.flange_b) annotation (
      Line(
      points={{130,-50},{100,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Force.y, Right_Friction.f_input) annotation (Line(
      points={{139,-24},{140,-24},{140,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Right_Force_Sensor.flange_b, Right_Ring_Fix.flange) annotation (Line(
      points={{100,-2},{136,-2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Force_Sensor.flange_a, Left_Ring_Fix.flange) annotation (Line(
      points={{-100,-2},{-136,-2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Right_Gear_Contact.flange_Ta, mass_sleeve.flange_b) annotation (Line(
      points={{40,36},{0,36},{0,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Right_Gear_Contact.flange_Tb, Right_Gear_Fix.flange) annotation (Line(
      points={{60,36},{80,36}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Right_Gear_Contact.flange_Rb, inertia_Right_Gear.flange_a)
    annotation (Line(
      points={{60,20},{152,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Gear_Contact.flange_Ra, inertia_Hub.flange_b) annotation (Line(
      points={{40,20},{20,20},{20,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Gear_Contact.flange_Ta, mass_sleeve.flange_b) annotation (Line(
      points={{-40,36},{0,36},{0,60},{-1.77636e-015,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Gear_Contact.flange_Tb, Left_Gear_Fix.flange) annotation (Line(
      points={{-60,36},{-80,36}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Gear_Contact.flange_Rb, inertia_Left_Gear.flange_b) annotation (
      Line(
      points={{-60,20},{-150,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Gear_Contact.flange_Ra, inertia_Hub.flange_a) annotation (Line(
      points={{-40,20},{-20,20},{-20,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Force_Sensor.flange_b, Left_Ring_Contact.flange_Tb) annotation (
      Line(
      points={{-80,-2},{-60,-2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Ring_Contact.flange_Rb, inertia_Left_Ring.flange_b) annotation (
      Line(
      points={{-60,-18},{-80,-18},{-80,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Ring_Contact.flange_Ra, inertia_Hub.flange_a) annotation (Line(
      points={{-40,-18},{-20,-18},{-20,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Ring_Contact.flange_Ta, mass_sleeve.flange_b) annotation (Line(
      points={{-40,-2},{0,-2},{0,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Right_Ring_Contact.flange_Rb, inertia_Right_Ring.flange_a)
    annotation (Line(
      points={{60,-18},{80,-18},{80,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Ring_Contact.flange_Tb, Right_Force_Sensor.flange_a)
    annotation (Line(
      points={{60,-2},{80,-2}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Right_Ring_Contact.flange_Ta, mass_sleeve.flange_b) annotation (Line(
      points={{40,-2},{0,-2},{0,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Right_Ring_Contact.flange_Ra, inertia_Hub.flange_b) annotation (Line(
      points={{40,-18},{20,-18},{20,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(mass_sleeve.flange_a, positionSensor.flange) annotation (Line(
      points={{1.77636e-015,80},{20,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(elastoBacklash1.flange_a, inertia_Hub.flange_a) annotation (Line(
      points={{-40,-50},{-20,-50},{-20,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(elastoBacklash1.flange_b, inertia_Left_Ring.flange_b) annotation (
      Line(
      points={{-60,-50},{-80,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(elastoBacklash.flange_a, inertia_Hub.flange_b) annotation (Line(
      points={{40,-50},{20,-50},{20,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(elastoBacklash.flange_b, inertia_Right_Ring.flange_a) annotation (
      Line(
      points={{60,-50},{80,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(translational_ContinuousCoulombFriction.flange_a, mass_sleeve.flange_b)
    annotation (Line(
      points={{40,60},{0,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(fixed.flange, translational_ContinuousCoulombFriction.flange_b)
    annotation (Line(
      points={{90,60},{60,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(positionSensor.s, combiTable1D.u[1]) annotation (Line(
      points={{41,80},{40,80},{40,90},{48,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTable1D.y[1], translational_ContinuousCoulombFriction.f_input)
    annotation (Line(
      points={{71,90},{80,90},{80,70},{50,70}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -100},{180,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-180,-100},{180,100}})),
    Documentation(info="<html>
<p>This Model models the detailed synchronizer physical behavior, but needs more simulation speed.</p>
</html>"));
end Synchronizer;
