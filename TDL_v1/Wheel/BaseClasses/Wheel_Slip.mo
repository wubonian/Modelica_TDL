within TDL_v1.Wheel.BaseClasses;
partial model Wheel_Slip
  "Base class for wheel model with slip (without force calculation)"
  import SI = Modelica.SIunits;
  extends BaseClasses.Wheel_VaryingRadius(w(
        stateSelect=StateSelect.always));

  // parameter Real sigmac(min=10*Modelica.Constants.eps)=0.05 "Relaxation length of the tire";
  parameter SI.Velocity v_roll_min=1
    "Minimum vehicle velocity for slip calculation"
    annotation (Dialog(tab="Advanced"));

  Real slip "Longitudinal slip = (R*w - v)/R*abs(w)";
  SI.Force fDrive "Driving force of wheel";

protected
  SI.Velocity v_roll "Rolling velocity of wheel";
  SI.Velocity v_slip "Slip velocity of wheel";

function softMax "Smooth approximation of max(u1,u2)"
  extends Modelica.Icons.Function;

  import Modelica.Math;
  input Real u1 "Input u1";
  input Real u2 "Input u2";
  input Real tol(min=Modelica.Constants.eps) = 0.01
      "Defines the tolerance for the smoothing (> 0)";
  output Real y "Smooth approximation of max(u1,u2)";
algorithm
  y :=tol*Math.log(Math.exp(u1/tol) + Math.exp(u2/tol));
end softMax;

equation
  // The force fDrive has to be defined in the class which extends from this one!
  fDrive = -roadFlange.f;

  // Speeds of the hub and contact patch
  v_roll = w*wheelRadius;
  v_slip = v - v_roll;

  // Slip calculation
  // sigmac*der(slip) + v_roll*slip = v_slip;
  slip = -v_slip/softMax(
    v_roll_min,
    noEvent(abs(v)),
    0.1);

initial equation
  // slip = if abs(v_roll) > 0 then (v - v_roll)/v_roll else 0;
  w = v/wheelRadius;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-100,10},{-8,-10}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={230,230,255}),
        Ellipse(extent={{-48,86},{12,-86}},lineColor={0,0,0}),
        Rectangle(
          extent={{-20,80},{20,-80}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-48,80},{12,-80}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={95,95,95}),
        Ellipse(
          extent={{-10,80},{50,-80}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{4,54},{36,-54}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,20},{-60,20}}, color={0,0,0}),
        Line(points={{-100,-20},{-60,-20}}, color={0,0,0}),
        Polygon(
          points={{-80,20},{-84,30},{-76,30},{-80,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={235,235,235}),
        Text(
          extent={{-150,140},{150,100}},
          lineColor={0,0,255},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={235,235,235},
          textString="%name"),
        Line(points={{-18,86},{18,86}}, color={0,0,0}),
        Line(points={{-18,-86},{18,-86}}, color={0,0,0}),
        Ellipse(extent={{-10,86},{50,-86}},lineColor={0,0,0})}),
    Documentation(info="<html>
<p>
This partial model defines the base class for all wheel models that utilize tire forces calculation based on a nonlinear slip.
</p>
<p>
In this class, the scalar force <code>fDrive</code> is applied to the road contact patch <code>roadFlange</code>. The magnitude of the force (roadFlange.f = fDrive(slip)) must be determined by the class that extends this model. The slip is considered here as a pure longitudinal slip and is calculated according to:</p>
<pre>
          w * wheelRadius(w) - v
  slip = ------------------------
         max(v_roll_min, (abs(v))
</pre>
<!--
<pre>
   sigma * der(slip) + w * r * slip = v - w * r;
</pre>
-->
where:
<!--
   sigma = relaxation length of contact patch
-->
<pre>
   w ............. angular velocity of wheel hub [rad/s]
   wheelRadius ... dynamic rolling radius of tire [m]
   v ............. chassis linear velocity [m/s]
</pre>
<p>This formula for calculating slip can handle the zero velocity condition since it switches to v_roll_min for low velocities.</p>
</html>"));
end Wheel_Slip;
