within TDL_v1.Engine;
model Engine2
  Modelica.Blocks.Interfaces.RealInput throttle
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Continuous.CriticalDamping criticalDamping
    annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,30})));
  Modelica.Blocks.Math.Gain gain(k=30/Modelica.Constants.pi)
    annotation (Placement(transformation(extent={{20,40},{0,60}})));
equation
  connect(throttle, criticalDamping.u) annotation (Line(
      points={{-100,0},{-100,-6},{-82,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(criticalDamping.y, combiTable2D.u2) annotation (Line(
      points={{-59,-6},{-42,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(torque.tau, combiTable2D.y) annotation (Line(
      points={{-2,0},{-19,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(torque.flange, inertia.flange_a) annotation (Line(
      points={{20,0},{30,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b, bearingFriction.flange_a) annotation (Line(
      points={{50,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bearingFriction.flange_b, flange_a) annotation (Line(
      points={{80,0},{90,0},{90,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.flange, inertia.flange_b) annotation (Line(
      points={{50,20},{50,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gain.u, speedSensor.w) annotation (Line(
      points={{22,50},{50,50},{50,41}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, combiTable2D.u1) annotation (Line(
      points={{-1,50},{-52,50},{-52,6},{-42,6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Engine2;
