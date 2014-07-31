within TDL_v1.Wheel.BaseClasses;
partial model Wheel_VaryingRadius
  "Base class of a wheel with speed dependent wheel radius"
  import SI = Modelica.SIunits;
  extends BaseClasses.Wheel(
    hubFlange(
      phi(
        start=0,
        fixed=true,
        stateSelect=StateSelect.always)));

  parameter SI.Inertia J=1 "Wheel inertia";
  parameter Boolean tableOnFile=false
    "True, if rolling radius table is defined on file"
    annotation (Dialog(group="Rolling radius"));
  parameter Real table[:,:]=[0,0.3; 100,0.3]
    "Table of tire rolling radius [m] against wheel speed [rad/s] (col. 1)"
    annotation (Dialog(enable=not tableOnFile, group="Rolling radius"));
  parameter String fileName= "RollingRadius.txt"
    "File name where table is stored"
    annotation (Dialog(enable=tableOnFile, group="Rolling radius"));
  parameter String tableName="rollingRadius"
    "Name of table for tire rolling radius"
    annotation (Dialog(enable=tableOnFile, group="Rolling radius"));
  parameter SI.Time tau=0.01 "Time constant of radius change";

  // A dummy (non zero!) value must by set as initial value of wheelRadius
  // to enable correct iteration at initialization
  SI.Distance wheelRadius(start=0.3, fixed=false, stateSelect=StateSelect.always)
    "Wheel radius";
  SI.AngularVelocity w(start=0) "Angular velocity of wheel";
  SI.AngularAcceleration a "Angular acceleration of wheel";
protected
  SI.Velocity v "Velocity of roadFlange";

public
  Modelica.Blocks.Tables.CombiTable1D rollingRadius(
    final tableOnFile=tableOnFile,
    final table=table,
    final tableName=tableName,
    final fileName=fileName) "Table for rolling radius (col 1: w, col 2: R)"                   annotation (Placement(
        transformation(extent={{-10,70},{10,90}}, rotation=0)));

equation
  v = der(roadFlange.s);
  w = der(hubFlange.phi);
  rollingRadius.u[1] = w;
  der(wheelRadius) = (rollingRadius.y[1] - wheelRadius)/tau;

  a = der(w);
  J*a = hubFlange.tau + roadFlange.f*wheelRadius;
initial equation
  wheelRadius = rollingRadius.y[1];
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
         graphics),
    Documentation(info="<HTML>
<p>
This partial model defines the base class for all simple models of rolling wheel that have inertia but no rolling resistance.
</p>
<p>
The rolling radius is dependant upon the rotational speed of the wheel and is
implemented through table such as:
</p>
<pre>
   rollingRadius = [   0, 0.310;
                      50, 0.311;
                     100, 0.312;
                     120, 0.313 ]
</pre>
<p>where:</p>
<pre>
    column 1 ... wheel angular velocity [rad/s]
    column 2 ... tire rolling radius [m]
</pre>
<p>
The table evaluation is realized with a CombiTable1D, i.e., the table can
be directly given as matrix, read from a file or stored as static array in
function usertab in file usertab.c.
</p>
<p>
The variable <code>wheelRadius</code> represents <b>dynamic rolling radius</b> of the wheel.
It can be used e.g. for the slip calculation in the class that extends this model. 
It also reflects some transition effects utilizing:
</p>
<pre>
                       rollingRadius(w) - wheelRadius
   der(wheelRadius) = ---------------------------------
                                tau
</pre>
<p>
The wheel dynamics is considered utilizing inertia&nbsp;<code>J</code> about its spin axis.</p>
</HTML>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Ellipse(extent={{60,-60},{-60,60}}),
        Line(points={{-80,-60},{80,-60}}),
        Ellipse(
          extent={{-6,6},{6,-6}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{0,16},{-6,16},{-12,12},{-16,4},{-16,-4},{-12,-10}}, color=
             {0,0,0}),
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
        Text(extent={{-42,82},{-32,96}}, textString="w"),
        Line(
          points={{-60,-60},{-70,-70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-40,-60},{-50,-70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-20,-60},{-30,-70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{0,-60},{-10,-70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{20,-60},{10,-70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{40,-60},{30,-70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{60,-60},{50,-70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{80,-60},{70,-70}},
          color={0,0,0},
          smooth=Smooth.None)}));
end Wheel_VaryingRadius;
