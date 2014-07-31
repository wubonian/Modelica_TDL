within TDL_v1.Blocks;
block PIreset
  "PI controller with reset, limited output, and anti-windup compensation"
  import Modelica.Blocks.Types.Init;
  extends Modelica.Blocks.Interfaces.SISO(y(start=0));

  parameter Real k(
    min=10*Modelica.Constants.eps,
    unit="1") = 1 "Gain of PI block (k > 0)";
  parameter Modelica.SIunits.Time T(min=10*Modelica.Constants.eps)
    "Time constant of integrator (T > 0)";
  parameter Real N(min=10*Modelica.Constants.eps) = 0.9
    "N*T is time constant of anti-windup compensation (N > 0)";
  parameter Real yMax=Modelica.Constants.inf "Upper limit of output";
  parameter Real yMin=-yMax "Lower limit of output (yMin < yMax)";
  parameter Boolean enableReset=false
    "True, if connectors reset and yReset are enabled";
  output Real x(start=0,fixed=true) "Integrator state"
    annotation (Dialog(showStartAttribute=true));
  output Real xd(start=0) = der(x) "= der(x)"
    annotation (Dialog(showStartAttribute=true));
  output Real yDesired "Output y before limitation";
  output Real uAntiWindup
    "Additional input to integrator due to anti-windup compensation";

  Modelica.Blocks.Interfaces.BooleanInput reset if enableReset
    "Reset integrator state, if resetTrigger has a rising edge" annotation (
      Placement(transformation(
        origin={-60,-120},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealInput yReset if enableReset
    "Reset integrator state, so that the output is set to 'yReset'"
    annotation (Placement(transformation(
        origin={60,-120},
        extent={{-20,-20},{20,20}},
        rotation=90)));

protected
  model ResetState "Reset the state if required"
    import Modelica;
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Real k "Gain of controller";
    parameter Real yMax "Upper limit of output";
    parameter Real yMin "Lower limit of output";
    input Real x(stateSelect=StateSelect.always) "Integrator state"
      annotation (Dialog);
    Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput reset annotation (Placement(
          transformation(
          origin={-60,-120},
          extent={{-20,-20},{20,20}},
          rotation=90)));
    Modelica.Blocks.Interfaces.RealInput yReset annotation (Placement(
          transformation(
          origin={58,-120},
          extent={{-20,-20},{20,20}},
          rotation=90)));
  protected
    discrete Real yReset2;
  equation
    // Reset integrator
    when reset then
      yReset2 = if yReset > yMax then yMax else if yReset < yMin then yMin
         else yReset;
      reinit(x, yReset2/k - u);
    end when;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-56,62},{56,2}},
            lineColor={0,0,255},
            textString="reset"), Text(
            extent={{-54,10},{58,-50}},
            lineColor={0,0,255},
            textString="state")}), Diagram(graphics));
  end ResetState;

  parameter Real oldTime(fixed=false)
    "Used to trigger a reinit at start time, when the limits are not fulfilled";

protected
  ResetState resetState(
    k=k,
    yMax=yMax,
    yMin=yMin,
    x=x) if enableReset annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, rotation=0)));

initial equation
  oldTime = time - 1;

equation
  // Check that limits are consistent
  assert(yMax > yMin, "Limits must be consistent. However, yMax (=" + String(
    yMax) + ") <= yMin (=" + String(yMin) + ")");

  // Anti-windup compensation
  uAntiWindup = (y - yDesired)/(k*N);

  // Integrator
  der(x) = (u + uAntiWindup)/T;

  // Gain
  yDesired = k*(x + u);

  // Limited output
  if initial() then
    y = yDesired;
  else
    y = smooth(0, if yDesired > yMax then yMax else if yDesired < yMin then
      yMin else yDesired);
  end if;

  // Connect to block that resets the state
  connect(reset, resetState.reset) annotation (Line(points={{-60,-120},{-60,-80},
          {-6,-80},{-6,-12}}, color={255,0,255}));
  connect(yReset, resetState.yReset) annotation (Line(points={{60,-120},{60,-80},
          {5.8,-80},{5.8,-12}}, color={0,0,127}));
  connect(resetState.u, u)
    annotation (Line(points={{-12,0},{-120,0}}, color={0,0,127}));
  annotation (
    defaultComponentName="PID",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{-80,78},{-80,-60}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-88,-52},{84,-52}}, color={192,192,192}),
        Polygon(
          points={{93,-52},{71,-44},{71,-60},{93,-52}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-52},{-80,-20},{-80,-20},{30,60},{80,60}}),
        Text(
          extent={{-2,29},{100,-20}},
          lineColor={192,192,192},
          textString="PI"),
        Text(
          extent={{-100,-79},{-4,-92}},
          lineColor={0,0,0},
          textString="reset"),
        Text(
          extent={{2,-81},{100,-94}},
          lineColor={0,0,0},
          textString="yReset")}),
    Documentation(info="<HTML>
<p>
<p>
This blocks defines a PI controller where the output y is computed
basically from the input u by the following transfer function:
</p>
<pre>
                 1
   y = k * (1 + ---) * u
                T*s
</pre>
<p>
or equivalently by the following equation in the time domain:
</p>
<pre>
   y = k * (u + 1/T * Integral(u*dt))
</pre>
<p>
<p>
This basic formula is modified to take into account
several practical aspects:
</p>
 
<ul>
<li> The output of this block is limited. If the block is
     in its limits, anti-windup compensation is activated to drive
     the integrator state to zero. The \"speed\" to drive it back
     to zero is defined via parameter <b>N</b> (the time constant
     of the anti-windup compensation is \"N*T\")</li>
<li> At a rising edige of the optional Boolean input <b>reset</b>,
     the state of the PI controller is reset so that the output y
     gets the value of the additional input signal <b>yReset</b>
     (if yReset is outside of the yMax/yMin limits, it is changed
     to the corresponding limit before the state is re-initialized).</li>
<li> During initialization, the output limits are switched off to
     ease the initialization. If the output is outside of its limits
     after initialization, the integrator state is re-initialized so
     that the output is exactly at its corresponding limit.</li>
<li> This block can be optionally initialized either in steady state, with a given state
     or a given output. Usually, the default initialization with a given state of zero
     is most reasonable, since this means that the PI controller acts as a
     P controller during initialization. Steady state initialization can lead to a singular
     system during initialization due to the equation \"<b>der</b>(x) = k*u;\"
     of the integrator: The steady state equation \"der(x)=0\" leads to the condition
     that the input u to the integrator is zero. If the input u is 
     already (directly or indirectly) defined by another initial condition, 
     then the initialization problem is <b>singular</b> (has none or 
     infinitely many solutions). This situation occurs often
     for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
     since speed is both a state and a derivative, it is natural to
     initialize it with zero.
     The solution is to <b>not</b> initialize the \"measuredSpeed but let it
     indirectly be computed by \"measuredSpeed.start = desiredSpeed.start - u.start
     = desiredSpeed.start).</li>
</ul>
 
<p>
The parameters of the controller can be manually adjusted by performing
simulations of the closed loop system (= controller + plant connected
together) and using the following strategy:
</p>
 
<ol>
<li> Set very large limits, e.g., yMax = Modelica.Constants.inf</li>
<li> Select a high value of <b>T</b> (e.g. T = 10000), to basically
     switch of the integral part.</li>
<li> Manually enlarge parameter <b>k</b>
     (the total gain of the controller) until the closed-loop response
     cannot be improved any more.</li>
<li> Manually adjust the integral time constant <b>T</b>.
     The first value of T can be selected, such that it is in the
     order of the time constant of the oscillations occuring with
     the P-controller from the previous step. 
     If, e.g., vibrations in the order of T=10 ms
     occur in the previous step, start with T=0.01 s.</li>
<li> Manually adjust k and T, so that the response becomes better.</li>
<li> Set the limits yMax and yMin according to your specification.</li>
<li> Perform simulations such that the output of the PI controller
     goes in its limits. Tune <b>N</b> (N*T is the time constant of 
     the anti-windup compensation) such that the integrator
     state goes quickly enough back to its limits.
     If N is decreased, this happens faster. If N=infinity, the
     anti-windup compensation is switched off and the controller works badly).</li>
</ol>
 
 
<p>
The anti-windup componensation of this PI controller
has been implemented according to chapter 3 of the book:
</p>
 
<dl>
<dt>Astroem K.J., and Haegglund T.:</dt>
<dd> <b>PID Controllers: Theory, Design, and Tuning</b>.
     Instrument Society of America, 2nd edition, 1995.
     Information from:
     <a href=\"http://www.control.lth.se/publications/books/asthagg95.html\">http://www.control.lth.se/publications/books/asthagg95.html</a>
     </dd>
</dl>
 
</html>
", revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics));
end PIreset;
