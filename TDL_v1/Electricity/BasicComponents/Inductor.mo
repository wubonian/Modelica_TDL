within TDL_v1.Electricity.BasicComponents;
model Inductor
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.SIunits.Inductance L(start=1) "Inductance";
  parameter Boolean quasiStationary(start=false)
    "No electrical transients if true"
    annotation(Evaluate=true);
  Modelica.Blocks.Interfaces.RealInput L_bias annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,100})));
equation
  v = if quasiStationary then 0 else (L+L_bias)*der(i);
  annotation (
    Documentation(info="<html>
<p>The linear inductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>v = L * di/dt</i>.
If <code>quasiStationary == false</code>, the electrical transients are neglected, i.e., the voltage drop is zero.</p>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
        Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
        Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
        Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
        Rectangle(
          extent={{-60,-30},{60,0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{60,0},{90,0}}, color={0,0,255}),
        Line(points={{-90,0},{-60,0}}, color={0,0,255}),
        Text(
          extent={{-138,-60},{144,-94}},
          lineColor={0,0,0},
          textString="L=%L"),
        Text(
          extent={{-152,79},{148,39}},
          textString="%name",
          lineColor={0,0,255}),
        Rectangle(visible=quasiStationary,
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
        Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
        Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
        Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
        Rectangle(
          extent={{-60,-30},{60,0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{60,0},{96,0}}, color={0,0,255}),
        Line(points={{-96,0},{-60,0}}, color={0,0,255})}));
end Inductor;
