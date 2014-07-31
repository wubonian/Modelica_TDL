within TDL_v1.Blocks;
block PIAW "PI controller with anti-windup"
  parameter Real K=1 "Proportional gain";
  parameter Modelica.SIunits.Time Ti=1 "Integrator time constant";
  parameter Real Tt=Ti "Tracking parameter";
  extends Modelica.Blocks.Interfaces.SISO;
  output Real x "State of block";

  Modelica.Blocks.Interfaces.RealInput v "Tracking input"
    annotation (Placement(transformation(
        origin={0,-110},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  der(x) = K*u/Ti + (v - y)/Tt;
  y = x + K*u;
  annotation (
    Documentation(info="<HTML>
This block is a modification of <a href=\"Modelica.Blocks.Continuous.PI\">Modelica.Blocks.Continuous.PI</a> to include anti-windup and tracking. Connect the limited control signal or tracking signal to the external input v. The term (v-y)/(K*N*Ti) is added to the integrator to keep the internal state bounded. 
</HTML>
"), Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-80,-80},{-80,-20},{60,80}},
          color={0,0,255},
          thickness=0.25),
        Text(
          extent={{0,6},{60,-56}},
          lineColor={192,192,192},
          textString="PI"),
        Text(
          extent={{-150,-150},{150,-110}},
          lineColor={0,0,0},
          textString="T=%T")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}),
        Text(
          extent={{-68,24},{-24,-18}},
          lineColor={0,0,0},
          textString=
               "k"),
        Text(
          extent={{-32,48},{60,0}},
          lineColor={0,0,0},
          textString=
               "T s + 1"),
        Text(
          extent={{-30,-8},{52,-40}},
          lineColor={0,0,0},
          textString=
               "T s"),
        Line(points={{-24,0},{54,0}}, color={0,0,0}),
        Line(points={{-100,0},{-60,0}}),
        Line(points={{62,0},{100,0}})}));
end PIAW;
