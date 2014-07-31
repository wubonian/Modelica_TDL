within TDL_v1.BasicComponents.Boundary.Internal_Layer_Middle.Internal_Layer_Low;
model Internal_Boundary
  import SI = Modelica.SIunits;
  extends
    BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D_normal_der;
  Contact contact;
  Friction friction;
  parameter Integer boundary_type=1;
  parameter Modelica.SIunits.TranslationalSpringConstant c_contact;
  parameter Modelica.SIunits.TranslationalDampingConstant d_contact;
  parameter Real parm_mue = 0.2;
  final parameter Real parm_cgeo = 1;
  parameter Modelica.SIunits.Velocity parm_v_limit = 0.001;
  parameter Boolean remove_friction=false;
  Modelica.Blocks.Interfaces.RealInput x_input
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Blocks.Interfaces.RealInput y_input
    annotation (Placement(transformation(extent={{-110,-30},{-90,-10}})));
  Modelica.Blocks.Interfaces.RealOutput f_x
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealOutput f_y
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Blocks.Interfaces.RealInput x_der_input
    annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
  Modelica.Blocks.Interfaces.RealInput y_der_input
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Real gain;

protected
  SI.Angle alfa;
  SI.Position y_inter;
  SI.Velocity vy_inter;
  SI.Force f_friction;
  model Contact
    extends
      BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDiscreteContact;
  end Contact;

  model Friction
    extends
      BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low.Internal_ContinuousCoulombFriction;
  end Friction;
equation
  contact.c = c_contact;
  contact.d = d_contact;
  friction.mue = parm_mue;
  friction.cgeo = parm_cgeo;
  friction.speed_limit = parm_v_limit;

  u=x_input;
  u_der=if x_der_input>0 then 0.0001 else -0.0001;
  gain=y_der/u_der;
  y_inter=if boundary_type==1 then y_input else -y_input;
  vy_inter=if boundary_type==1 then y_der_input else -y_der_input;

  alfa=atan(abs(gain));
  contact.distance_rel=cos(alfa)*(y-y_inter);
  contact.speed_rel=if gain<0 then -sin(alfa)*x_der_input-cos(alfa)*vy_inter else sin(alfa)*x_der_input-cos(alfa)*vy_inter;
  friction.speed_rel=if gain<0 then cos(alfa)*x_der_input-sin(alfa)*vy_inter else cos(alfa)*x_der_input+sin(alfa)*vy_inter;

  f_friction=if remove_friction then 0 else friction.friction;

  f_x=smooth(1,noEvent(if gain<0 then -sin(alfa)*contact.react-cos(alfa)*f_friction else sin(alfa)*contact.react-cos(alfa)*f_friction));
  f_y=smooth(1,noEvent(if gain<0 then sign(boundary_type)*(-cos(alfa)*contact.react+sin(alfa)*f_friction) else sign(boundary_type)*(-cos(alfa)*contact.react-sin(alfa)*f_friction)));
algorithm
  friction.f_pressure:=contact.react;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Internal_Boundary;
