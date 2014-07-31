within TDL_v1.Blocks;
block IntegratorReset
  "Output the integral of the input signals, has an external reset trigger"
  extends Modelica.Blocks.Continuous.Integrator;

  Modelica.Blocks.Interfaces.BooleanInput reset
    annotation (Placement(transformation(
        origin={0,-120},
        extent={{-20,-20},{20,20}},
        rotation=90)));
equation
  when reset then
    reinit(y, y_start);
  end when;

  annotation (
    Documentation(info="
<HTML>
<p>This block extends <a href=\"Modelica://Modelica.Blocks.Continuous.Integrator\">Modelica.Blocks.Continuous.Integrator</a> and adds an external reset trigger.  When the boolean input <b>reset</b> becomes true the integrator start is reset to <b>y_start</b>.</p>
</HTML>
"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
         graphics),
    Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}),
        Line(points={{-100,0},{-60,0}}),
        Line(points={{60,0},{100,0}}),
        Text(
          extent={{-36,60},{32,2}},
          lineColor={0,0,0},
          textString=
               "k"),
        Text(
          extent={{-32,0},{36,-58}},
          lineColor={0,0,0},
          textString=
               "s"),
        Line(points={{-46,0},{46,0}}, color={0,0,0})}));
end IntegratorReset;
