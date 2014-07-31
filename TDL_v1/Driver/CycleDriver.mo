within TDL_v1.Driver;
model CycleDriver
  "Core of a basic driver model for drive cycle simulation with automatic transmissions"
  extends Modelica.Blocks.Interfaces.BlockIcon;

  parameter Real k=1 "Gain of PI controller";
  parameter Modelica.SIunits.Time T=1 "Time constant of PI controller";
  //parameter Real initialCond=0.1 "Initial output from PI controller";

public
  Modelica.Blocks.Interfaces.RealOutput acceleratorPedalPosition(unit="1")
    "Normalized accelerator pedal position (0=fully released ... 1=fully pressed)"
                                         annotation (Placement(transformation(
          extent={{100,-70},{120,-50}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput brakePedalPosition(unit="1")
    "Normalized brake pedal position (0=fully released ... 1=fully pressed)"
                                      annotation (Placement(transformation(
          extent={{100,50},{120,70}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vehicleSpeed
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}, rotation=
           0)));
  Modelica.Blocks.Interfaces.RealInput desiredVehicleSpeed
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput resetValue
    annotation (Placement(transformation(
        origin={60,-120},
        extent={{20,-20},{-20,20}},
        rotation=270)));
  Modelica.Blocks.Interfaces.BooleanInput reset
    annotation (Placement(transformation(
        origin={-60,-120},
        extent={{20,-20},{-20,20}},
        rotation=270)));
  Modelica.Blocks.Continuous.Derivative acceleration(initType=Modelica.Blocks.Types.Init.SteadyState,
    k=1,
    T=0.01)
    annotation (Placement(transformation(extent={{-82,-66},{-70,-54}}, rotation=
           0)));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-80,50},{-60,30}}, rotation=0)));
  Modelica.Blocks.Logical.Hysteresis hysteresis(
    y(start=false),
    uLow=-0.7,
    uHigh=-0.001)
               annotation (Placement(transformation(extent={{-62,-66},{-50,-54}},
          rotation=0)));
  Modelica.Blocks.Logical.Edge edge
    annotation (Placement(transformation(
        origin={-20,-25},
        extent={{5,-5},{-5,5}},
        rotation=270)));
  Modelica.Blocks.Logical.Switch throttleSwitch
    annotation (Placement(transformation(extent={{40,-50},{60,-70}}, rotation=0)));
  Modelica.Blocks.Logical.Switch brakeSwitch
    annotation (Placement(transformation(extent={{40,70},{60,50}}, rotation=0)));
  Modelica.Blocks.Sources.Constant zero(final k=0)
    annotation (Placement(transformation(extent={{52,-6},{40,6}}, rotation=0)));
  Modelica.Blocks.Math.Gain gain(final k=-1)
    annotation (Placement(transformation(extent={{66,55},{76,65}}, rotation=0)));
  Modelica.Blocks.Logical.And throttleOrBrakeControl
    annotation (Placement(transformation(extent={{-40,-39},{-27,-50}}, rotation=
           0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold=0)
    annotation (Placement(transformation(extent={{-80,15},{-70,25}}, rotation=0)));
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(
        origin={-6,-5},
        extent={{5,-5},{-5,5}},
        rotation=270)));
  Modelica.Blocks.Logical.Switch throttleSwitch1
    annotation (Placement(transformation(
        origin={6,-65},
        extent={{5,-8},{-5,8}},
        rotation=270)));
  Modelica.Blocks.Sources.Constant zero1(final k=0)
    annotation (Placement(transformation(
        origin={-25,-80},
        extent={{5,-5},{-5,5}},
        rotation=180)));
  TDL_v1.Blocks.PIreset PI(
    final k=k,
    final T=T,
    yMax=1,
    yMin=-1,
    enableReset=true) annotation (Placement(transformation(extent={{-10,10},{10,
            30}}, rotation=0)));
  Modelica.Blocks.Logical.Switch brakeSwitch1
    annotation (Placement(transformation(extent={{-30,10},{-20,30}}, rotation=0)));
  Modelica.Blocks.Sources.Constant dummy2(k=-1)
    annotation (Placement(transformation(
        origin={-45,5},
        extent={{5,-5},{-5,5}},
        rotation=180)));
  TDL_v1.Blocks.Limiter throttleLimiter(final uMax=1, final uMin=0) annotation
    (Placement(transformation(extent={{80,-65},{90,-55}}, rotation=0)));
  TDL_v1.Blocks.Limiter brakeLimiter(final uMax=1, final uMin=0) annotation (
      Placement(transformation(extent={{80,55},{90,65}}, rotation=0)));

  Modelica.Blocks.Math.Gain matchUnits(final k=1)
    annotation (Placement(transformation(extent={{-52,34},{-40,46}})));

equation
  connect(hysteresis.y,throttleOrBrakeControl. u1) annotation (Line(points={{
          -49.4,-60},{-46,-60},{-46,-44.5},{-41.3,-44.5}}, color={255,0,255}));
  connect(greaterThreshold1.y,throttleOrBrakeControl. u2) annotation (Line(
        points={{-69.5,20},{-60,20},{-60,-40},{-41.3,-40},{-41.3,-40.1}}, color=
         {255,0,255}));
  connect(throttleOrBrakeControl.y, brakeSwitch.u2) annotation (Line(points={{
          -26.35,-44.5},{28,-44.5},{28,60},{38,60}}, color={255,0,255}));
  connect(throttleOrBrakeControl.y, throttleSwitch.u2) annotation (Line(points=
          {{-26.35,-44.5},{28,-44.5},{28,-60},{38,-60}}, color={255,0,255}));
  connect(throttleOrBrakeControl.y,edge. u) annotation (Line(points={{-26.35,
          -44.5},{-20,-44.5},{-20,-31}}, color={255,0,255}));
  connect(edge.y,or1. u2) annotation (Line(points={{-20,-19.5},{-20,-15},{-10,
          -15},{-10,-11}}, color={255,0,255}));
  connect(or1.u1, reset) annotation (Line(points={{-6,-11},{-6,-90},{-60,-90},{
          -60,-120}}, color={255,0,255}));
  connect(reset, throttleSwitch1.u2) annotation (Line(points={{-60,-120},{-60,
          -90},{6,-90},{6,-71}}, color={255,0,255}));
  connect(resetValue, throttleSwitch1.u1) annotation (Line(points={{60,-120},{
          60,-90},{13,-90},{13,-71},{12.4,-71}}, color={0,0,127}));
  connect(zero1.y, throttleSwitch1.u3)  annotation (Line(points={{-19.5,-80},{0,
          -80},{0,-71},{-0.4,-71}}, color={0,0,127}));
  connect(PI.y, throttleSwitch.u1)               annotation (Line(points={{11,
          20},{24,20},{24,-68},{38,-68}}, color={0,0,127}));
  connect(PI.y, brakeSwitch.u3)               annotation (Line(points={{11,20},
          {24,20},{24,68},{38,68}}, color={0,0,127}));
  connect(desiredVehicleSpeed, feedback.u1) annotation (Line(points={{-120,-60},
          {-90,-60},{-90,40},{-78,40}}, color={0,0,127}));
  connect(desiredVehicleSpeed,greaterThreshold1. u) annotation (Line(points={{
          -120,-60},{-90,-60},{-90,20},{-81,20}}, color={0,0,127}));
  connect(greaterThreshold1.y, brakeSwitch1.u2) annotation (Line(points={{-69.5,
          20},{-31,20}}, color={255,0,255}));
  connect(brakeSwitch1.y, PI.u)               annotation (Line(points={{-19.5,
          20},{-12,20}}, color={0,0,127}));
  connect(dummy2.y, brakeSwitch1.u3) annotation (Line(points={{-39.5,5},{-35,5},
          {-35,12},{-31,12}},     color={0,0,127}));
  connect(vehicleSpeed, feedback.u2) annotation (Line(points={{-120,60},{-70,60},
          {-70,48}}, color={0,0,127}));
  connect(or1.y, PI.reset) annotation (Line(points={{-6,0.5},{-6,4.25},{-6,8}},
                   color={255,0,255}));
  connect(throttleSwitch1.y, PI.yReset)      annotation (Line(points={{6,-59.5},
          {6,-25.75},{6,8}},            color={0,0,127}));
  connect(brakeSwitch.y, gain.u)
    annotation (Line(points={{61,60},{65,60}}, color={0,0,127}));
  connect(zero.y, throttleSwitch.u3) annotation (Line(points={{39.4,0},{32,0},{
          32,-52},{38,-52}}, color={0,0,127}));
  connect(zero.y, brakeSwitch.u1) annotation (Line(points={{39.4,0},{32,0},{32,
          52},{38,52}}, color={0,0,127}));
  connect(desiredVehicleSpeed, acceleration.u) annotation (Line(points={{-120,
          -60},{-83.2,-60}}, color={0,0,127}));
  connect(acceleration.y, hysteresis.u) annotation (Line(points={{-69.4,-60},{
          -63.2,-60}}, color={0,0,127}));
  connect(throttleSwitch.y, throttleLimiter.u)
    annotation (Line(points={{61,-60},{79,-60}}, color={0,0,127}));
  connect(throttleLimiter.y, acceleratorPedalPosition)
    annotation (Line(points={{90.5,-60},{110,-60}}, color={0,0,127}));
  connect(gain.y, brakeLimiter.u) annotation (Line(points={{76.5,60},{79,60}},
        color={0,0,127}));
  connect(brakeLimiter.y, brakePedalPosition)
                                      annotation (Line(points={{90.5,60},{110,
          60}}, color={0,0,127}));

  connect(matchUnits.y, brakeSwitch1.u1) annotation (Line(
      points={{-39.4,40},{-35,40},{-35,28},{-31,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, matchUnits.u) annotation (Line(
      points={{-61,40},{-53.2,40}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Documentation(info="<HTML>
<p>A basic driver model for driving cycle simulation with an automatic transmission.
The model is based around a PI controller that is used to determine the desired throttle
and brake pedal positions.  The driver will only control one pedal at once and the
pedal being controlled is decided by a logic system based on the desired speed, acceleration
rather than by comparing the desired and actual speeds and acceleration.</p>
</HTML>
"), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Line(points={{-80,-80},{-60,-80},{-12,14},{36,14},{70,-10}}, color={0,0,
              255}),
        Line(points={{-80,-80},{-60,-80},{-52,-72},{-40,-54},{-28,-6},{-18,16},
              {-10,20},{2,18},{19,14},{36,14},{57,6},{70,-8}}, color={255,0,0}),
        Text(
          extent={{-5,68},{86,51}},
          lineColor={0,0,0},
          textString="brake..."),
        Text(
          extent={{0,-52},{91,-69}},
          lineColor={0,0,0},
          textString="acc...")}));
end CycleDriver;
