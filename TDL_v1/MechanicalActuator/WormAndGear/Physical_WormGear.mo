within TDL_v1.MechanicalActuator.WormAndGear;
model Physical_WormGear
  import SI = Modelica.SIunits;
  parameter Real i;
  parameter SI.Radius r_worm;
  parameter SI.Radius r_gear;
  parameter SI.Angle theta_pressure;
  final parameter SI.Angle theta_helical=atan(r_gear/r_worm/i);
  parameter SI.TranslationalSpringConstant c;
  parameter SI.TranslationalDampingConstant d;
  parameter Real mue;
  parameter SI.Velocity v_limit;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_worm
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_gear
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
protected
  SI.Position s_rel_n;
  SI.Velocity v_rel_n;
  SI.Velocity v_rel_f;
  SI.Force f_f;
  SI.Force f_n;
equation
  s_rel_n=flange_worm.phi*r_worm*sin(theta_helical)-flange_gear.phi*r_gear*cos(theta_helical);
  v_rel_n=der(s_rel_n);
  v_rel_f=der(flange_worm.phi)*r_worm*cos(theta_helical)+der(flange_gear.phi)*r_gear*sin(theta_helical);
  f_n=c*s_rel_n+d*v_rel_n;
  f_f=abs(f_n)*mue*tanh(2*v_rel_f/v_limit);
  flange_worm.tau=(f_f*cos(theta_helical)+f_n*cos(theta_pressure)*sin(theta_helical))*r_worm;
  flange_gear.tau=(f_f*sin(theta_helical)-f_n*cos(theta_pressure)*cos(theta_helical))*r_gear;

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Physical_WormGear;
