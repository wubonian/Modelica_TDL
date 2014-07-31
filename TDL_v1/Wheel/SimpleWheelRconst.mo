within TDL_v1.Wheel;
model SimpleWheelRconst "Simple 1D model of an ideal rolling wheel"
  import SI = Modelica.SIunits;
  extends BaseClasses.Wheel;

  parameter SI.Inertia J=1 "Wheel inertia";
  parameter SI.Distance wheelRadius=0.3 "Wheel radius";

  SI.AngularVelocity w;

equation
  // Kinematics
  roadFlange.s = wheelRadius*hubFlange.phi;

  // Inertia of wheel
  w = der(hubFlange.phi);
  J*der(w) = hubFlange.tau + wheelRadius*roadFlange.f;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-100,10},{-46,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={230,230,255}),
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
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          lineColor={0,0,255},
          fontSize=0),
        Polygon(
          points={{76,8},{76,26},{60,26},{60,20},{70,20},{70,-20},{60,-20},{60,
              -26},{76,-26},{76,-8},{84,-8},{84,8},{76,8}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{84,0},{84,-100},{0,-100}},
          color={0,127,0},
          pattern=LinePattern.Dot)}), Documentation(info="<HTML>
<p>
A simple model of a rolling wheel which has inertia but no rolling resistance.
The wheel slip is neglected yielding the following kinematics
</p>
<pre>
   roadFlange.s = wheelRadius * hubFlange.phi.
</pre>
<p>
The rolling radius stays constant.
</p>
</HTML>"));
end SimpleWheelRconst;
