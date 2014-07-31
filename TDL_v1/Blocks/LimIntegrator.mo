within TDL_v1.Blocks;
block LimIntegrator "Integrator with limited value of the output"
  import Modelica.Blocks.Types.Init;
  parameter Real k(unit = "1") = 1 "Integrator gain";
  parameter Real outMax(start = 1) "Upper limit of output";
  parameter Real outMin = -outMax "Lower limit of output";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialState
    "Type of initialization (1: no init, 2: steady state, 3/4: initial output)"
                                                                                                        annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Boolean limitsAtInit = true
    "= false, if limits are ignored during initialization (i.e., der(y)=k*u)"                           annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real y_start = 0
    "Initial or guess value of output (must be in the limits outMin .. outMax)"
                                                                                                        annotation(Dialog(group = "Initialization"));
  parameter Boolean strict = false "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, choices(checkBox = true), Dialog(tab = "Advanced"));
  extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
  Modelica.Blocks.Interfaces.BooleanInput Reset annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 90, origin = {-42,-120})));

  parameter Boolean sample_limit(start = false);
  extends Modelica.Blocks.Interfaces.DiscreteBlock;

initial equation
  if initType == Init.SteadyState then
    der(y) = 0;
  elseif initType == Init.InitialState or initType == Init.InitialOutput then
    y = y_start;
  else
  end if;
equation
  if initial() and not limitsAtInit then
    der(y) = k * u;
    assert(y >= outMin - 0.001 * abs(outMax - outMin) and y <= outMax + 0.001 * abs(outMax - outMin), "LimIntegrator: During initialization the limits have been ignored.\n" + "However, the result is that the output y is not within the required limits:\n" + "  y = " + String(y) + ", outMin = " + String(outMin) + ", outMax = " + String(outMax));
  elseif strict then
    der(y) = noEvent(if y < outMin and k * u < 0 or y > outMax and k * u > 0 then 0 else k * u);
  else
    der(y) = if y < outMin and k * u < 0 or y > outMax and k * u > 0 then 0 else k * u;
  end if;
  when Reset or y >= outMax or y <= outMin or (sample_limit and sampleTrigger) then
    reinit(y, y_start);
  end when;

  annotation(Documentation(info = "<html>
<p>
This blocks computes <b>y</b> (element-wise) as <i>integral</i>
of the input <b>u</b> multiplied with the gain <i>k</i>. If the
integral reaches a given upper or lower <i>limit</i> and the
input will drive the integral outside of this bound, the
integration is halted and only restarted if the input drives
the integral away from the bounds.
</p>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

<p>
If parameter <b>limitAtInit</b> = <b>false</b>, the limits of the
integrator are removed from the initialization problem which
leads to a much simpler equation system. After initialization has been
performed, it is checked via an assert whether the output is in the
defined limits. For backward compatibility reasons
<b>limitAtInit</b> = <b>true</b>. In most cases it is best
to use <b>limitAtInit</b> = <b>false</b>.
</p>
</html>"),
       Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{-80,78},{-80,-90}}, color=  {192,192,192}),Polygon(points=  {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor=  {192,192,192}, fillColor=  {192,192,192},
            fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-90,-80},{82,-80}}, color=  {192,192,192}),Polygon(points=  {{90,-80},{68,-72},{68,-88},{90,-80}}, lineColor=  {192,192,192}, fillColor=  {192,192,192},
            fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-80,-80},{20,20},{80,20}}, color=  {0,0,127}),Text(extent=  {{0,-10},{60,-70}}, lineColor=  {192,192,192}, textString=  "I"),Text(extent=  {{-150,-150},{150,-110}}, lineColor=  {0,0,0}, textString=  "k=%k"),Line(visible=  strict, points=  {{20,20},{80,20}}, color=  {255,0,0}, smooth=  Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-60,58},{60,-60}}, lineColor=  {0,0,255}),Text(extent=  {{-54,44},{-4,-48}}, lineColor=  {0,0,0}, textString=  "lim"),Line(points=  {{-100,0},{-60,0}}, color=  {0,0,255}),Line(points=  {{60,0},{100,0}}, color=  {0,0,255}),Text(extent=  {{-8,60},{60,2}}, lineColor=  {0,0,0}, textString=  "k"),Text(extent=  {{-8,-2},{60,-60}}, lineColor=  {0,0,0}, textString=  "s"),Line(points=  {{4,0},{46,0}}, color=  {0,0,0}),Line(points=  {{-42,-60},{-42,-100}}, color=  {0,0,255}, smooth=  Smooth.None)}));
end LimIntegrator;
