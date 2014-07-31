within TDL_v1.Transmission.Gear;
model Ideal_CVT
extends
    Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;

  Modelica.SIunits.Angle phi_a "Angle between left shaft flange and support";
  Modelica.SIunits.Angle phi_b "Angle between right shaft flange and support";

  Modelica.Blocks.Interfaces.RealInput gearRatio
    "Actual gear ratio. Should be never zero during continuous integration."
    annotation (Placement(transformation(extent={{-140,60},{-100,100}},
          rotation=0)));
protected
  Real ratio "Gear ratio actually used (is never zero)";
  constant Real eps=1.e-10;
initial equation
  phi_a = ratio*phi_b;
equation
  phi_a = flange_a.phi - phi_support;
  phi_b = flange_b.phi - phi_support;

  /* Analysis of a singular situation:
 
     gearRatio may change smoothly between forward and backward gear and
     then passes zero, i.e., gearRatio=0 can occur. Depending on the connection
     structure, the equations are either resolved for flange_b.tau or for
     flange_a.tau. In the latter case, a division by zero will occur when gearRatio=0:
 
          flange_a.tau = flange_b.tau / gearRatio
 
     This case is uninteresting, because in such a case the clutch attached to
     IdealCVT will be anyway released and therefore the torques are zero.
 
     To avoid the division by zero, one might use the guard:
 
          ratio = if noEvent(abs(gearRatio) > eps) then gearRatio else eps;
 
     However, this equation needs to be differentiated, since 
    
          der(phi_a) = ratio*der(phi_b)
 
     and the acceleration needs to be computed, which means that der(ratio) is
     needed. A Modelica tool might print a warning in this case, because
     differentiating an if-clause usually results in a dirac impulse. 
     Mathematically, this is really the case above, because the if-clause is
     discontinuous. This error should not be relevant and shall therefore
     be neglected. This can be formulated with the smooth(..) operator:
 
         ratio = smooth(100, if noEvent(abs(gearRatio) > eps) then gearRatio else eps);
 
     In some special cases, "gearRatio" can be a constant, say 1. The symbolic 
     transformation algorithms may then transform the above equation to
 
         ratio = smooth(100, 1);
 
     Dymola has the bug, that the second argument to smooth cannot be an Integer,
     contrary to the specification. If it is an Integer an error occurs.
     To avoid this error in Dymola, gearRatio is multiplied with a number that is
     nearly one. This gives a negliable error. 
 
     The above analysis results in the following equation:
  */
  ratio = smooth(100, noEvent(if abs(gearRatio) > eps then (1.0 + Modelica.Constants.eps)
    *gearRatio else eps));
  /*
  ratio = smooth(100, noEvent(if abs(gearRatio) > eps then gearRatio else eps));
  */
  der(phi_a) = ratio*der(phi_b);
  0 = ratio*flange_a.tau + flange_b.tau;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Line(points={{-100,0},{-70,0},{-70,-40},{-30,-40}}, color={0,0,0}),
        Line(points={{20,60},{70,60},{70,0},{100,0}}, color={0,0,0}),
        Rectangle(
          extent={{-32,-10},{32,-70}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={180,180,207}),
        Rectangle(
          extent={{-22,98},{22,18}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={230,230,255}),
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          lineColor={0,0,255}),
        Line(
          points={{-60,-50},{-40,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-50,-50},{-50,-80},{0,-80},{0,-100}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{40,50},{60,50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{50,50},{50,-80},{0,-80}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{40,70},{60,70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-60,-30},{-40,-30}},
          color={0,0,0},
          smooth=Smooth.None),
        Polygon(
          points={{-30,-8},{-30,-10},{-10,-30},{10,-30},{30,-10},{30,-8},{-30,
              -8}},
          fillPattern=FillPattern.HorizontalCylinder,
          smooth=Smooth.None,
          fillColor={255,255,255},
          pattern=LinePattern.None),
        Polygon(
          points={{-30,-72},{-30,-70},{-10,-50},{10,-50},{30,-70},{30,-72},{-30,
              -72}},
          fillPattern=FillPattern.HorizontalCylinder,
          smooth=Smooth.None,
          fillColor={255,255,255},
          pattern=LinePattern.None),
        Polygon(
          points={{-20,100},{-20,98},{-2,72},{2,72},{20,98},{20,100},{-20,100}},
          fillPattern=FillPattern.HorizontalCylinder,
          smooth=Smooth.None,
          fillColor={255,255,255},
          pattern=LinePattern.None),
        Polygon(
          points={{-20,16},{-20,18},{-2,44},{2,44},{20,18},{20,16},{-20,16}},
          fillPattern=FillPattern.HorizontalCylinder,
          smooth=Smooth.None,
          fillColor={255,255,255},
          pattern=LinePattern.None),
        Rectangle(
          extent={{-12,88},{12,-54}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,128,255})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end Ideal_CVT;
