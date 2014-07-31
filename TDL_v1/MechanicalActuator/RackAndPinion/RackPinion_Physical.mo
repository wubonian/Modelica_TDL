within TDL_v1.MechanicalActuator.RackAndPinion;
model RackPinion_Physical
  import SI = Modelica.SIunits;
  parameter SI.Radius r;
  parameter SI.TranslationalSpringConstant c;
  parameter SI.TranslationalDampingConstant d;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialElementaryRotationalToTranslational;

protected
  SI.Position s_rel;
  SI.Velocity v_rel;
  SI.Force f;
equation
  s_rel=flangeR.phi*r-flangeT.s;
  v_rel=der(s_rel);
  f=c*s_rel+d*v_rel;
  flangeR.tau=f*r;
  flangeT.f=-f;
annotation (
       Icon(
    coordinateSystem(preserveAspectRatio=true,
      extent={{-100.0,-100.0},{100.0,100.0}},
      initialScale=0.1),
      graphics={
    Rectangle(origin={133.3333,0.0},
      lineColor={64,64,64},
      fillColor={192,192,192},
      fillPattern=FillPattern.HorizontalCylinder,
      extent={{-233.3333,-10.0},{-163.3333,10.0}}),
    Rectangle(fillColor={160,160,164},
      fillPattern=FillPattern.Solid,
      extent={{95.0,-60.0},{106.0,-10.0}}),
    Rectangle(origin={-0.5889,0.0},
      fillColor={160,160,164},
      fillPattern=FillPattern.Solid,
      extent={{-74.4111,-80.0},{106.5889,-60.0}}),
    Line(points={{-100.0,15.0},{-80.0,15.0}}),
    Line(points={{-100.0,-16.0},{-80.0,-16.0}}),
    Line(points={{-100.0,-16.0},{-100.0,-100.0}}),
    Line(points={{100.0,-80.0},{100.0,-100.0}}),
    Polygon(origin={16.875,-50.0},
      fillColor={160,160,164},
      fillPattern=FillPattern.Solid,
      points={{-84.375,-10.0},{-79.375,10.0},{-69.375,10.0},{-64.375,-10.0},{-54.375,-10.0},{-49.375,10.0},{-39.375,10.0},{-34.375,-10.0},{-24.375,-10.0},{-19.375,10.0},{-9.375,10.0},{-4.375,-10.0},{5.625,-10.0},{10.625,10.0},{20.625,10.0},{25.625,-10.0},{35.625,-10.0},{40.625,10.0},{50.625,10.0},{55.625,-10.0},{65.625,-10.0},{70.625,10.0},{78.125,10.0},{78.125,-10.0}}),
    Polygon(origin={-20.0,-0.0},
      rotation=10.0,
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      points={{-5.0,45.0},{-10.0,10.0},{-45.0,5.0},{-45.0,-5.0},{-10.0,-10.0},{-5.0,-45.0},{5.0,-45.0},{10.0,-10.0},{45.0,-5.0},{45.0,5.0},{10.0,10.0},{5.0,45.0}}),
    Polygon(origin={-20.0,-0.0},
      rotation=55.0,
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      points={{-5.0,45.0},{-10.0,10.0},{-45.0,5.0},{-45.0,-5.0},{-10.0,-10.0},{-5.0,-45.0},{5.0,-45.0},{10.0,-10.0},{45.0,-5.0},{45.0,5.0},{10.0,10.0},{5.0,45.0}}),
    Ellipse(origin={-20.0,-0.0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      extent={{-30.0,-30.0},{30.0,30.0}}),
    Ellipse(origin={-20.0,-0.0},
      fillColor={128,128,128},
      fillPattern=FillPattern.Solid,
      extent={{-10.0,-10.0},{10.0,10.0}})}));
end RackPinion_Physical;
