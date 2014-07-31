within TDL_v1.Blocks;
block LimPI
  "PI controller with variable limited output,  anti-windup compensation and external reset "
  import SI = Modelica.SIunits;
  import Modelica.Blocks.Types.InitPID;
  import Modelica.Blocks.Types.Init;
  import Modelica.Blocks.Types.SimpleController;
  extends Modelica.Blocks.Interfaces.SVcontrol;
  output Real controlError = u_s - u_m
    "Control error (set point - measurement)";

  parameter Modelica.Blocks.Types.SimpleController controllerType=
         Modelica.Blocks.Types.SimpleController.PID "Type of controller";
  parameter Real k(min=0) = 1 "Gain of controller";
  parameter SI.Time Tp(min=0) = 0
    "Time constant of proportional block (use to break algebraic loop)";
  parameter SI.Time Ti(min=Modelica.Constants.small)=0.5
    "Time constant of Integrator block"
     annotation(Dialog(enable=controllerType==SimpleController.PI or
                              controllerType==SimpleController.PID));
  parameter SI.Time Td(min=Modelica.Constants.small) = 0.1
    "Time constant of Derivative block"
       annotation(Dialog(enable=controllerType==SimpleController.PD or
                                controllerType==SimpleController.PID));
  parameter Real Nd(min=1) = 10
    "The higher Nd, the more ideal the derivative block"
       annotation(Dialog(enable=controllerType==SimpleController.PD or
                                controllerType==SimpleController.PID));
  parameter Real Ni(min=100*Modelica.Constants.eps) = 0.9
    "Ni*Ti is time constant of anti-windup compensation";

  parameter Real wp(min=0) = 1 "Set-point weight for Proportional block (0..1)";
  parameter Real wd(min=0) = 0 "Set-point weight for Derivative block (0..1)"
       annotation(Dialog(enable=controllerType==SimpleController.PD or
                                controllerType==SimpleController.PID));

  parameter Boolean enable_reset = false "Show reset input port"
    annotation(Dialog(group="External reset"));

  parameter Boolean enable_external_max = false
    "Use input signal for time-variable maximal output"
    annotation(Dialog(group="Limits"));
  parameter Boolean enable_external_min = false
    "Use input signal for time-variable minimal output"
    annotation(Dialog(group="Limits"));
  parameter Real yMax=1 "Upper limit of output"
    annotation(Dialog(group="Limits",enable=not enable_external_max));
  parameter Real yMin=-yMax "Lower limit of output"
    annotation(Dialog(group="Limits",enable=not enable_external_min));

  parameter Modelica.Blocks.Types.InitPID initType=
    Modelica.Blocks.Types.InitPID.DoNotUse_InitialIntegratorState
    "Type of initialization"
    annotation(Evaluate=true, Dialog(group="Initialization"));

  parameter Boolean limitsAtInit = true
    "False, if limits are ignored during initializiation"
    annotation(Evaluate=true, Dialog(group="Initialization",
                       enable=controllerType==SimpleController.PI or
                              controllerType==SimpleController.PID));
  parameter Real xi_start=0
    "Initial or guess value value for integrator output (= integrator state)"
    annotation (Dialog(group="Initialization",
                enable=controllerType==SimpleController.PI or
                       controllerType==SimpleController.PID));
  parameter Real xd_start=0
    "Initial or guess value for state of derivative block"
    annotation (Dialog(group="Initialization",
                         enable=controllerType==SimpleController.PD or
                                controllerType==SimpleController.PID));
  parameter Real y_start=(yMax + yMin)/2 "Initial value of output"
    annotation(Dialog(enable=initType == InitPID.InitialOutput, group=
          "Initialization"));

public
  Modelica.Blocks.Interfaces.RealInput y_max if enable_external_max
    "external provided signal for maximal actuator level y_max"
    annotation (Placement(transformation(
        origin={-70,110},
        extent={{-20,-20},{20,20}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput y_min if  enable_external_min
    "external provided signal for minimal actuator level y_max"
    annotation (Placement(transformation(
        origin={70,110},
        extent={{-20,-20},{20,20}},
        rotation=270)));
  Modelica.Blocks.Sources.Constant y_max_const(k=yMax) if  not enable_external_max
    annotation (Placement(transformation(extent={{-100,70},{-90,80}},
          rotation=0)));
  Modelica.Blocks.Sources.Constant y_min_const(k=yMin) if  not enable_external_min
    annotation (Placement(transformation(extent={{40,70},{50,80}},
          rotation=0)));
  Modelica.Blocks.Interfaces.BooleanInput reset if  enable_reset
    "reset trigger input (integrator will reset at rising edge)"
    annotation (Placement(transformation(
        origin={0,110},
        extent={{-20,-20},{20,20}},
        rotation=270)));

public
  Modelica.Blocks.Sources.BooleanConstant noReset(k=false) if  not enable_reset
    annotation (Placement(transformation(extent={{-30,70},{-20,80}},
          rotation=0)));
  IntegratorReset I(
  y_start=xi_start,
  k=1/Ti,
    initType=if initType == InitPID.SteadyState then Init.SteadyState else if
        initType == InitPID.InitialState or initType == InitPID.DoNotUse_InitialIntegratorState
         then Init.InitialState else Init.NoInit) if
             (controllerType == Modelica.Blocks.Types.SimpleController.PI
   or controllerType == Modelica.Blocks.Types.SimpleController.PID)
    annotation (Placement(transformation(extent={{-20,50},{0,30}},
          rotation=0)));

  Modelica.Blocks.Sources.Constant noI(k=0) if  not (controllerType==Modelica.Blocks.Types.SimpleController.PI or controllerType==Modelica.Blocks.Types.SimpleController.PID)
    annotation (Placement(transformation(extent={{40,20},{20,40}},
          rotation=0)));

  Modelica.Blocks.Continuous.Derivative D(
    k=Td,
    T=Td/Nd,
    initType=if initType == InitPID.SteadyState or initType == InitPID.InitialOutput then
              Modelica.Blocks.Types.Init.SteadyState else if initType == InitPID.InitialState then
              Modelica.Blocks.Types.Init.InitialState else Modelica.Blocks.Types.Init.NoInit,
    x_start=xd_start) if (controllerType==Modelica.Blocks.Types.SimpleController.PD or controllerType==Modelica.Blocks.Types.SimpleController.PID)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}},
          rotation=0)));

  Modelica.Blocks.Sources.Constant noD(k=0) if  not (controllerType==Modelica.Blocks.Types.SimpleController.PD or controllerType==Modelica.Blocks.Types.SimpleController.PID)
    annotation (Placement(transformation(extent={{40,-40},{20,-20}},
          rotation=0)));

  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(
          extent={{10,-10},{20,10}}, rotation=0)));
  Modelica.Blocks.Math.Gain gain(k=k)
                                  annotation (Placement(transformation(
          extent={{30,-10},{50,10}}, rotation=0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{70,-10},{90,10}},
          rotation=0)));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(
        origin={30,-70},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Math.Gain antiWindupGain(k=1/(k*Ni))
    annotation (Placement(transformation(
        origin={-10,-70},
        extent={{-10,-10},{10,10}},
        rotation=180)));

  Modelica.Blocks.Math.Add addD(k1=wd, k2=-1)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}},
          rotation=0)));
  Modelica.Blocks.Math.Add3 addI(
    k1=+1,
    k2=-1,
    k3=+1) annotation (Placement(transformation(extent={{-60,30},{-40,
            50}}, rotation=0)));
  Modelica.Blocks.Math.Add addP(k1=wp, k2=-1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}},
          rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrderP(
    initType=Modelica.Blocks.Types.Init.SteadyState,
    T=Tp,
    k=1) if                                                                                                     (Tp>0)
    annotation (Placement(transformation(extent={{-20,-15},{-10,-5}},
          rotation=0)));
  Modelica.Blocks.Routing.RealPassThrough reaPassThrough if
                                    (Tp<=0) annotation (Placement(
        transformation(extent={{-20,5},{-10,15}}, rotation=0)));
equation
  connect(I.y, add3_1.u1)                   annotation (Line(points={{1,
          40},{5,40},{5,8},{9,8}}, color={0,0,127}));
  connect(D.y, add3_1.u3)          annotation (Line(points={{1,-40},{5,
          -40},{5,-8},{9,-8}}, color={0,0,127}));
  connect(add3_1.y, gain.u)
    annotation (Line(points={{20.5,0},{28,0}}, color={0,0,127}));
  connect(gain.y, variableLimiter.u)
    annotation (Line(points={{51,0},{68,0}}, color={0,0,127}));
  connect(variableLimiter.y, y) annotation (Line(points={{91,0},{97,0},
          {97,0},{110,0}}, color={0,0,127}));
  connect(gain.y, add.u2)  annotation (Line(points={{51,0},{56,0},{56,
          -64},{42,-64}}, color={0,0,127}));
  connect(variableLimiter.y, add.u1) annotation (Line(points={{91,0},{
          95,0},{95,-76},{42,-76}}, color={0,0,127}));
  connect(antiWindupGain.u, add.y)
    annotation (Line(points={{2,-70},{19,-70}}, color={0,0,127}));
  connect(noD.y, add3_1.u3) annotation (Line(points={{19,-30},{5,-30},{
          5,-8},{9,-8}}, color={0,0,127}));
  connect(noI.y, add3_1.u1) annotation (Line(points={{19,30},{5,30},{5,
          8},{9,8}}, color={0,0,127}));
  connect(u_s, addI.u1) annotation (Line(points={{-120,0},{-90,0},{-90,
          48},{-62,48}}, color={0,0,127}));
  connect(u_m, addI.u2) annotation (Line(points={{0,-120},{0,-90},{-88,
          -90},{-88,40},{-62,40}}, color={0,0,127}));
  connect(antiWindupGain.y, addI.u3) annotation (Line(points={{-21,-70},
          {-86,-70},{-86,32},{-62,32}}, color={0,0,127}));
  connect(u_s, addP.u1) annotation (Line(points={{-120,0},{-90,0},{-90,
          6},{-62,6}}, color={0,0,127}));
  connect(u_s, addD.u1) annotation (Line(points={{-120,0},{-90,0},{-90,
          -34},{-62,-34}}, color={0,0,127}));
  connect(u_m, addP.u2) annotation (Line(points={{0,-120},{0,-90},{-88,
          -90},{-88,-6},{-62,-6}}, color={0,0,127}));
  connect(u_m, addD.u2) annotation (Line(points={{0,-120},{0,-90},{-88,
          -90},{-88,-46},{-62,-46}}, color={0,0,127}));
  connect(addI.y, I.u) annotation (Line(points={{-39,40},{-22,40}},
        color={0,0,127}));
  connect(addD.y, D.u) annotation (Line(points={{-39,-40},{-22,-40}},
        color={0,0,127}));
  connect(addP.y, reaPassThrough.u)
                          annotation (Line(points={{-39,0},{-30,0},{-30,
          10},{-21,10}}, color={0,0,127}));
  connect(reaPassThrough.y, add3_1.u2)
                             annotation (Line(points={{-9.5,10},{0,10},
          {0,0},{9,0}}, color={0,0,127}));
  connect(addP.y, firstOrderP.u)
                                annotation (Line(points={{-39,0},{-30,0},
          {-30,-10},{-21,-10}}, color={0,0,127}));
  connect(firstOrderP.y, add3_1.u2)
                                   annotation (Line(points={{-9.5,-10},
          {0,-10},{0,0},{9,0}}, color={0,0,127}));
  connect(noReset.y, I.reset) annotation (Line(
      points={{-19.5,75},{-10,75},{-10,52}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(reset, I.reset) annotation (Line(
      points={{0,110},{0,75},{-10,75},{-10,52}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(y_min_const.y, variableLimiter.limit2) annotation (Line(
      points={{50.5,75},{61,75},{61,-8},{68,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y_min, variableLimiter.limit2) annotation (Line(
      points={{70,110},{72,110},{72,26},{61,26},{61,-8},{68,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y_max_const.y, variableLimiter.limit1) annotation (Line(
      points={{-89.5,75},{-70,75},{-70,60},{61,60},{61,8},{68,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y_max, variableLimiter.limit1) annotation (Line(
      points={{-70,110},{-70,60},{61,60},{61,8},{68,8}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-80},{-80,50},{-80,-20},{30,60},{80,60}}),
        Text(
          extent={{-20,-20},{80,-60}},
          lineColor={192,192,192},
          textString="PID")}),
    Documentation(info="<HTML>
<p>
 
<ul>
<li> The output of this controller is limited. If the controller is
     in its limits, anti-windup compensation is activated to drive
     the integrator state to zero. </li>
<li> Setpoint weighting is present, which allows to weight
     the setpoint in the proportional and the derivative part
     independantly from the measurement. The controller will respond
     to load disturbances and measurement noise independantly of this setting
     (parameters wp, wd). However, setpoint changes will depend on this
     setting. For example, it is useful to set the setpoint weight wd
     for the derivative part to zero, if steps may occur in the
     setpoint signal.</li>
</ul>
 
<p>
The parameters of the controller can be manually adjusted by performing
simulations of the closed loop system (= controller + plant connected
together) and using the following strategy:
</p>
 
<ol>
<li> Set very large limits, e.g., yMax = Modelica.Constants.inf</li>
<li> Select a <b>P</b>-controller and manually enlarge parameter <b>k</b>
     (the total gain of the controller) until the closed-loop response
     cannot be improved any more.</li>
<li> Select a <b>PI</b>-controller and manually adjust parameters
     <b>k</b> and <b>Ti</b> (the time constant of the integrator).
     The first value of Ti can be selected, such that it is in the
     order of the time constant of the oscillations occuring with
     the P-controller. If, e.g., vibrations in the order of T=10 ms
     occur in the previous step, start with Ti=0.01 s.</li>
<li> If you want to make the reaction of the control loop faster
     (but probably less robust against disturbances and measurement noise)
     select a <b>PID</b>-Controller and manually adjust parameters 
     <b>k</b>, <b>Ti</b>, <b>Td</b> (time constant of derivative block).</li>
<li> Set the limits yMax and yMin according to your specification.</li>
<li> Perform simulations such that the output of the PID controller
     goes in its limits. Tune <b>Ni</b> (Ni*Ti is the time constant of 
     the anti-windup compensation) such that the input to the limiter
     block (= limiter.u) goes quickly enough back to its limits.
     If Ni is decreased, this happens faster. If Ni=infinity, the
     anti-windup compensation is switched off and the controller works bad.</li>
</ol>
 
<p>
<b>Initialization</b>
</p>
 
<p>
This block can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in 
<a href=\"Modelica://Modelica.Blocks.Types.InitPID\">Modelica.Blocks.Types.InitPID</a>.
This type is identical to 
<a href=\"Modelica://Modelica.Blocks.Types.Init\">Types.Init</a>, 
with the only exception that the additional option
<b>DoNotUse_InitialIntegratorState</b> is added for
backward compatibility reasons (= integrator is initialized with
InitialState whereas differential part is initialized with
NoInit which was the initialization in version 2.2 of the Modelica
standard library).
</p>
 
<p>
Based on the setting of initType, the integrator (I) and derivative (D)
blocks inside the PID controller are initialized according to the following table:
</p>
 
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>initType</b></td>
      <td><b>I.initType</b></td>
      <td><b>D.initType</b></td></tr>
 
  <tr><td><b>NoInit</b></td>
      <td>NoInit</td>
      <td>NoInit</td></tr>
 
  <tr><td><b>SteadyState</b></td>
      <td>SteadyState</td>
      <td>SteadyState</td></tr>
 
  <tr><td><b>InitialState</b></td>
      <td>InitialState</td>
      <td>InitialState</td></tr>
 
  <tr><td><b>InitialOutput</b><br>
          and initial equation: y = y_start</td>
      <td>NoInit</td>
      <td>SteadyState</td></tr>
 
  <tr><td><b>DoNotUse_InitialIntegratorState</b></td>
      <td>InitialState</td>
      <td>NoInit</td></tr>
</table>
 
<p>
In many cases, the most useful initial condition is
<b>SteadyState</b> because initial transients are then no longer
present. If initType = InitPID.SteadyState, then in some
cases difficulties might occur. The reason is the 
equation of the integrator:
</p>
 
<pre>
   <b>der</b>(y) = k*u;
</pre>
 
<p>
The steady state equation \"der(x)=0\" leads to the condition that the input u to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is natural to
initialize it with zero. As sketched this is, however, not possible.
The solution is to not initialize u_m or the variable that is used
to compute u_m by an algebraic equation.
</p>
 
<p>
If parameter <b>limitAtInit</b> = <b>false</b>, the limits at the
output of this controller block are removed from the initialization problem which 
leads to a much simpler equation system. After initialization has been
performed, it is checked via an assert whether the output is in the
defined limits. For backward compatibility reasons 
<b>limitAtInit</b> = <b>true</b>. In most cases it is best
to use <b>limitAtInit</b> = <b>false</b>.
</p>
</HTML>
"), Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics));
end LimPI;
