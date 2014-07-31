within TDL_v1.MechanicalActuator.DogClutch;
model DogClutch
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;
  parameter StateSelect stateSelect_T=StateSelect.prefer;
  parameter StateSelect stateSelect_R=StateSelect.prefer;
  parameter SI.Radius r;
  parameter SI.Position keci;
  parameter Integer N;
  parameter Integer N_contact;
  parameter SI.Angle alfa;
  parameter SI.Length gap;
  final parameter SI.Length b=2*pi*r/N/2;
  final parameter SI.Length l=gap+b/tan(alfa);
  parameter SI.TranslationalSpringConstant c;
  parameter SI.TranslationalDampingConstant d;
  parameter Real mue;
  parameter SI.Velocity v_limit;
  parameter Integer direction=1;
  parameter Boolean remove_friction=true;

  BasicComponents.Boundary.Internal_Layer_Middle.Internal_Layer_Low.Internal_Boundary
    Boundary_Up(table=if direction==1 then [0,10*b; gap,b + keci; l,keci; 10*l,keci] else [-10*l,keci;-l,keci;-gap,b + keci;0,10*b],
    boundary_type=1,
    c_contact=c,
    d_contact=d,
    parm_mue=mue,
    parm_v_limit=v_limit,remove_friction=remove_friction);
  BasicComponents.Boundary.Internal_Layer_Middle.Internal_Layer_Low.Internal_Boundary
    Boundary_Down(table=if direction==1 then [0,10*b; gap,b + keci; l,keci; 10*l,keci] else [-10*l,keci;-l,keci;-gap,b + keci;0,10*b],
    boundary_type=-1,
    c_contact=c,
    d_contact=d,
    parm_mue=mue,
    parm_v_limit=v_limit,remove_friction=remove_friction);
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_Ta
    annotation (Placement(transformation(extent={{-110,70},{-90,90}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_Tb
    annotation (Placement(transformation(extent={{90,70},{110,90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_Ra
    annotation (Placement(transformation(extent={{-110,-90},{-90,-70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_Rb
    annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
protected
  SI.Position s_rel(stateSelect=stateSelect_T);
  SI.Velocity vx_rel(stateSelect=stateSelect_T);
  SI.Angle phi_rel(stateSelect=stateSelect_R);
  SI.AngularVelocity w_rel(stateSelect=stateSelect_R);
  SI.Position y_rel;
  SI.Velocity vy_rel;
  Integer number;
equation
  s_rel=flange_Ta.s-flange_Tb.s;
  vx_rel=der(s_rel);
  phi_rel=flange_Ra.phi-flange_Rb.phi;
  w_rel=der(phi_rel);
  y_rel=phi_rel*r-number*2*b;
  vy_rel=w_rel*r;

  number=if phi_rel>0 then integer(floor((phi_rel*r+b)/2/b)) else integer(ceil((phi_rel*r-b)/2/b));

  Boundary_Up.x_input=s_rel;
  Boundary_Up.x_der_input=vx_rel;
  Boundary_Up.y_input=y_rel;
  Boundary_Up.y_der_input=vy_rel;
  Boundary_Down.x_input=s_rel;
  Boundary_Down.x_der_input=vx_rel;
  Boundary_Down.y_input=y_rel;
  Boundary_Down.y_der_input=vy_rel;

  flange_Ta.f=-flange_Tb.f;
  flange_Tb.f=N_contact*(Boundary_Up.f_x+Boundary_Down.f_x);
  flange_Ra.tau=-flange_Rb.tau;
  flange_Rb.tau=N_contact*r*(Boundary_Up.f_y+Boundary_Down.f_y);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(info="<html>
<p>This dog clutch model presents detailed physical behaviors, but needs more simulation time.</p>
</html>"));
end DogClutch;
