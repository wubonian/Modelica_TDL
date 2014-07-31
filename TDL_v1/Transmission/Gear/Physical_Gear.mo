within TDL_v1.Transmission.Gear;
model Physical_Gear
  import SI = Modelica.SIunits;
  parameter Real i;
  final parameter SI.Radius r_a=1;
  final parameter SI.Radius r_b=r_a*i;
  parameter SI.TranslationalSpringConstant c=1e7;
  parameter SI.TranslationalDampingConstant d=1e4;
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
  SI.Position s_rel;
  SI.Velocity v_rel;
equation
  s_rel=flange_a.phi*r_a+flange_b.phi*r_b;
  v_rel=der(s_rel);
  flange_a.tau=(c*s_rel+d*v_rel)*r_a;
  flange_b.tau=flange_a.tau*i;
end Physical_Gear;
