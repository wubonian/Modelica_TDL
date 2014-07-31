within TDL_v1.Wheel;
model SimpleWheelRvar
  "Simple model of a rolling wheel with speed dependent wheel radius"
  extends BaseClasses.Wheel_VaryingRadius;

equation
  w = v/wheelRadius;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-100,10},{-46,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={230,230,255}),
        Line(points={{-24,-86},{12,-86}}, color={0,0,0}),
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          lineColor={0,0,255},
          fontSize=0),
        Ellipse(extent={{-50,86},{0,-86}}, lineColor={0,0,0}),
        Line(points={{-24,86},{12,86}}, color={0,0,0}),
        Polygon(
          points={{76,8},{76,26},{60,26},{60,20},{70,20},{70,-20},{60,-20},{60,
              -26},{76,-26},{76,-8},{84,-8},{84,8},{76,8}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-50,80},{10,-80}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={160,160,164}),
        Rectangle(
          extent={{-20,80},{12,-80}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={160,160,164}),
        Ellipse(
          extent={{-16,80},{44,-80}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={160,160,164}),
        Ellipse(
          extent={{-2,52},{34,-52}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{12,10},{20,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={230,230,255}),
        Ellipse(extent={{-16,86},{44,-86}}, lineColor={0,0,0}),
        Rectangle(
          extent={{16,10},{60,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={230,230,255}),
        Ellipse(
          extent={{56,10},{64,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={230,230,255}),
        Line(
          points={{84,0},{84,-100},{0,-100}},
          color={0,127,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<HTML>
<p>
A simple model of a rolling wheel which has inertia but no rolling resistance.
The rolling radius is dependant upon the rotational speed of the wheel and is
implemented through following table:
</p>
<pre>
   wheelRadius = [   0, 0.310;
                    50, 0.311;
                   100, 0.312;
                   120, 0.313 ]
</pre>
where:
<pre>
    column 1 - wheel angular velocity [rad/s]
    column 2 - tire rolling radius [m]
</pre>
<p>
The table is realized with a CombiTable1D, i.e., the table can be
directly given as matrix, read from a file or stored as static
array in function usertab in file usertab.c.
</p></HTML>
"), Diagram(graphics={
        Ellipse(extent={{60,-60},{-60,60}}),
        Line(points={{-80,-60},{80,-60}}),
        Ellipse(
          extent={{-6,6},{6,-6}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{0,16},{-6,16},{-12,12},{-16,4},{-16,-4},{-12,-10}},
            color={0,0,0}),
        Polygon(
          points={{-4,18},{-4,14},{4,16},{-4,18}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(extent={{-28,-6},{-18,8}}, textString="w"),
        Line(points={{0,0},{0,-60}}, color={0,0,0}),
        Polygon(
          points={{0,0},{-2,-6},{2,-6},{0,0}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-60},{-2,-54},{2,-54},{0,-60}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(extent={{-60,-40},{-4,-30}}, textString="wheelRadius"),
        Line(points={{-48,80},{-12,80}}),
        Line(
          points={{12,80},{40,80}},
          color={0,0,255},
          arrow={Arrow.None,Arrow.Filled}),
        Text(extent={{22,84},{78,94}}, textString="wheelRadius"),
        Text(extent={{-42,82},{-32,96}}, textString="w")}));
end SimpleWheelRvar;
