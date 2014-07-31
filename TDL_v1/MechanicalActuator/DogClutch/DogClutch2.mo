within TDL_v1.MechanicalActuator.DogClutch;
model DogClutch2
                 // no gap between flanks of dogs is considered
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;

  parameter SI.Radius r;
  parameter Integer N;
  parameter Integer N_contact;
  parameter SI.Angle alfa;
  parameter SI.Length gap;
  parameter SI.Length b=(2*pi*r)/N/2;
  parameter SI.Length l=gap+b/tan(alfa);

  parameter SI.TranslationalSpringConstant c;
  parameter SI.TranslationalDampingConstant d;
  parameter Real mue;

  parameter SI.Velocity v_limit;

  parameter Integer direction=1;
  parameter Real engaged_c_gain=0.001;
  parameter Real engaged_d_gain=10;

  final parameter SI.TranslationalSpringConstant c_engaged=c*engaged_c_gain;
  final parameter SI.TranslationalDampingConstant d_engaged=d*engaged_d_gain;
//------------------------------------------------------------------------------
  constant Integer Right=1;
  constant Integer Left=-1;
//------------------------------------------------------------------------------
  Boolean engaged(start=false);
  Boolean synchro(start=false);
  Boolean free(start=true);
  Boolean contact_up(start=false);
  Boolean contact_down(start=false);

  Integer number;

  SI.Position s_rel_up;
  SI.Position s_rel_down;
  SI.Velocity v_rel_up;
  SI.Velocity v_rel_down;
  SI.Velocity v_friction_up;
  SI.Velocity v_friction_down;

  SI.Position x;
  SI.Position y;
  SI.Velocity v_x;
  SI.Velocity v_y;

  SI.Position y_rel;

  SI.Force f_contact_up;
  SI.Force f_contact_down;
  SI.Force f_friction_up;
  SI.Force f_friction_down;

  SI.Angle phi_L;//connector phi_L=input SI.Angle;//input SI.Angle phi_L;
  SI.Angle phi_R;//connector phi_R=input SI.Angle;//input SI.Angle phi_R;
  SI.Position s_L;//connector s_L=input SI.Position;//input SI.Position s_L;
  SI.Position s_R;//connector s_R=input SI.Position;//input SI.Position s_R;
  SI.Torque tau_L;//connector tau_L=output SI.Torque;//output SI.Torque tau_L;
  SI.Torque tau_R;//connector tau_R=output SI.Torque;//output SI.Torque tau_R;
  SI.Force f_L;//connector f_L=output SI.Force;//output SI.Force f_L;
  SI.Force f_R;//connector f_R=output SI.Force;//output SI.Force f_R;

  SI.Torque tau;

  final parameter Real sin_a=sin(alfa);
  final parameter Real cos_a=cos(alfa);

  SI.Force f_up_c;
  SI.Force f_up_d2;
  SI.Force f_up_d;
  SI.Force f_down_c;
  SI.Force f_down_d2;
  SI.Force f_down_d;

  Boolean synchronized(start=false);

  SI.Torque unit_tau=1;
  SI.AngularAcceleration unit_a=1;
  SI.AngularVelocity w_rel;
  SI.AngularAcceleration a_rel;
  Real sa;

//  SI.AngularVelocity w_L;
//  SI.AngularVelocity w_R;
//  SI.AngularAcceleration a_L;
//  SI.AngularAcceleration a_R;
//  SI.AngularVelocity w_rel;
//  SI.AngularAcceleration a_rel;
//  Real sa;
//
//  Boolean synchronized(start=false);
//  Boolean free(start=false);
//------------------------------------------------------------------------------
  Modelica.Mechanics.Translational.Interfaces.Flange_a ctrT_L
    annotation (Placement(transformation(extent={{-106,50},{-86,70}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b ctrT_R
    annotation (Placement(transformation(extent={{86,50},{106,70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a ctrR_L
    annotation (Placement(transformation(extent={{-106,-70},{-86,-50}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b ctrR_R
    annotation (Placement(transformation(extent={{86,-70},{106,-50}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor;
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1;
  Modelica.Mechanics.Translational.Sources.Force force;
  Modelica.Mechanics.Translational.Sources.Force force1;
  Modelica.Mechanics.Rotational.Sources.Torque torque;
  Modelica.Mechanics.Rotational.Sources.Torque torque1;
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor;
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1;
equation
  //w_rel=der(phi_L)-der(phi_R);
  //a_rel=der(w_rel);
  // a_rel=if synchronized then 0 else sa*unit_a;
  // wrapper
  //s_L=ctrT_L.s;
  //s_R=ctrT_R.s;
  //f_L=ctrT_L.f;
  //f_R=ctrT_R.f;
  //phi_L=ctrR_L.phi;
  //phi_R=ctrR_R.phi;
  //tau_L=ctrR_L.tau;
  //tau_R=ctrR_R.tau;

  //x=if direction==Right then s_L-s_R else s_R-s_L;  // x represents the x-axis value in the setting coordinate, be positive at synchro position
  //v_x=der(x);    // velocity for x
  //v_y=der(y_rel);        // velocity for y
  //y_rel=(phi_L-phi_R)*r;

//  w_rel=w_R-w_L;
//  a_rel=a_R-a_L;
//  a_rel=if synchronized then 0 else sa*unit_a;
//
//  synchronized=x>l+0.0005;
//  free=x<gap;
  s_L=positionSensor.s;//ctrT_L.s;
  s_R=positionSensor1.s;//ctrT_R.s;
  //connect(s_L,positionSensor.s);
  //connect(s_R,positionSensor1.s);
  //f_L=ctrT_L.f;
  //f_R=ctrT_R.f;
  phi_L=angleSensor.phi;//ctrR_L.phi;
  phi_R=angleSensor1.phi;//ctrR_R.phi;
  //phi_L=ctrR_L.phi;
  //phi_R=ctrR_R.phi;
  //connect(phi_L,angleSensor.phi);
  //connect(phi_R,angleSensor1.phi);
  //tau_L=ctrR_L.tau;
  //tau_R=ctrR_R.tau;
  w_rel=der(phi_L)-der(phi_R);
  a_rel=der(w_rel);

  x=if direction==Right then s_L-s_R else s_R-s_L;  // x represents the x-axis value in the setting coordinate, be positive at synchro position
  v_x=der(x);    // velocity for x
  y_rel=(phi_L-phi_R)*r;
  v_y=der(y_rel);        // velocity for y

  contact_up=s_rel_up*100000<0;
  contact_down=s_rel_down*100000<0;

  engaged=x>l;
  free=x<=0.9*gap;
  synchro=x>0.9*gap and x<=l;
  synchronized=engaged and (abs(a_rel)<0.01 and abs(w_rel)<0.01 or pre(synchronized));
  // the followings are used to calculate coordinate (x,y) in the setting coordinate system

  number=if free then 0 elseif engaged then pre(number) else (if y_rel>0 then integer(floor((y_rel+b)/2/b)) else integer(ceil((y_rel-b)/2/b)));

  if free then
    a_rel=sa*unit_a;
    //sa=a_rel/unit_a;
    y=y_rel-number*2*b;
    s_rel_up=1e-3;
    s_rel_down=1e-3;
    v_rel_up=0;
    v_rel_down=0;
    v_friction_up=0;
    v_friction_down=0;
    f_up_c=0;
    f_up_d2=0;
    f_up_d=0;
    f_down_c=0;
    f_down_d2=0;
    f_down_d=0;
    f_contact_up=0;
    f_contact_down=0;
    f_friction_up=0;
    f_friction_down=0;
    f_L=0;
    tau=0;
  elseif synchro then
    a_rel=sa*unit_a;
    //sa=a_rel/unit_a;
    y=y_rel-number*2*b;
    s_rel_up=sin_a*(l-x)-cos_a*y;
    s_rel_down=sin_a*(l-x)+cos_a*y;
    v_rel_up=-sin_a*v_x-cos_a*v_y;
    v_rel_down=-sin_a*v_x+cos_a*v_y;
    v_friction_up=0;
    v_friction_down=0;
    f_up_c=smooth(1,noEvent(if contact_up then -c*s_rel_up else 0));
    f_up_d=if contact_up then -d*v_rel_up else 0;
    f_up_d=smooth(0,noEvent(if contact_up then (if f_up_d2>f_up_c then f_up_c else f_up_d2) else 0));
    f_down_c=smooth(1,noEvent(if contact_down then -c*s_rel_down else 0));
    f_down_d2=if contact_down then -d*v_rel_down else 0;
    f_down_d=smooth(0,noEvent(if contact_down then (if f_down_d2>f_down_c then f_down_c else f_down_d2) else 0));
    f_contact_up=f_up_c+f_up_d;
    f_contact_down=f_down_c+f_down_d;
    f_friction_up=0;
    f_friction_down=0;
    f_L=if direction==Right then N_contact*(sin_a*(f_contact_up+f_contact_down)+cos_a*(f_friction_up+f_friction_down)) else -N_contact*(sin_a*(f_contact_up+f_contact_down)+cos_a*(f_friction_up+f_friction_down));
    tau=r*N_contact*(cos_a*(f_contact_up-f_contact_down)-sin_a*(f_friction_up-f_friction_down));
  else
    a_rel=sa*unit_a;//if synchronized then 0 else sa*unit_a;//if synchronized then 0 else sa*unit_a;//sa*unit_a;
    //sa=a_rel/unit_a;
    y=y_rel-number*2*b;
    s_rel_up=1e-3;
    s_rel_down=1e-3;
    v_rel_up=0;
    v_rel_down=0;
    v_friction_up=0;
    v_friction_down=0;
    f_up_c=0;
    f_up_d2=0;
    f_up_d=0;
    f_down_c=0;
    f_down_d2=0;
    f_down_d=0;
    f_contact_up=0;
    f_contact_down=0;
    f_friction_up=0;
    f_friction_down=0;
    f_L=0;
    tau=r*N_contact*(c_engaged*y+d_engaged*v_y);//if synchronized then sa*unit_tau else r*N_contact*(c/1000*y+d*v_y);////if synchronized then sa*unit_tau else r*N_contact*(c*y+d*v_y);//r*N_contact*(c*y+d*v_y);//if synchronized then sa*unit_tau else r*N_contact*(c*y+d*v_y);
  end if;

  f_R=-f_L;
  tau_L=tau;
  tau_R=-tau_L;
  //ctrR_L.tau=tau_L;
  //ctrR_R.tau=tau_R;
  force.f=-f_L;//ctrT_L.f=f_L;//force.f=f_L;//ctrT_L.f;
  force1.f=-f_R;//ctrT_R.f=f_R;//force1.f=f_R;//ctrT_R.f;
  torque.tau=-tau_L;//ctrR_L.tau=tau_L;//torque.tau=tau_L;//ctrR_L.tau;
  torque1.tau=-tau_R;//ctrR_R.tau=tau_R;//torque1.tau=tau_R;//ctrR_R.tau;
  //connect(f_L,force.f);
  //connect(f_R,force1.f);
  //connect(tau_L,torque.tau);
  //connect(tau_R,torque.tau);
  connect(ctrT_L, positionSensor.flange);
  connect(ctrT_R, positionSensor1.flange);
  connect(force.flange, ctrT_L);
  connect(force1.flange, ctrT_R);
/*algorithm 
  when engaged and (not pre(synchronized) and synchronized) then
    reinit(w_rel,0);
  end when;*/

//  number=if x<0.9*gap then 0 elseif x>1.05*l then pre(number) else (if y_rel>0 then integer(floor((y_rel+b)/2/b)) else integer(ceil((y_rel-b)/2/b)));
//  y=y_rel-number*2*b;    // y represents the y-axis value in the setting coordinate, range:[-b,b]

  // the followings are used to calculate variables for contact force and friction force
  // two limit boundaries are assumed for limit the (x,y) distribution in the plane
//  s_rel_up=if synchro then sin_a*(l-x)-cos_a*y else 1e-3;//if x>0.9*gap then (if not engaged then sin_a*(l-x)-cos_a*y else -y) else 0;    // negative when contact
//  s_rel_down=if synchro then sin_a*(l-x)+cos_a*y else 1e-3;//if x>0.9*gap then (if not engaged then sin_a*(l-x)+cos_a*y else y) else 0;    // negative when contact

//  v_rel_up=if synchro then -sin_a*v_x-cos_a*v_y else 0;//if x>0.9*gap then (if not engaged then -sin_a*v_x-cos_a*v_y else -v_y) else 0;    // negative when contact
//  v_rel_down=if synchro then -sin_a*v_x+cos_a*v_y else 0;//if x>0.9*gap then (if not engaged then -sin_a*v_x+cos_a*v_y else v_y) else 0;    // negative when contact

//  v_friction_up=0;//if x>0.9*gap then (if not engaged then v_x*cos_a-v_y*sin_a else v_x) else 0;    // positive when coming towards engage
//  v_friction_down=0;//if x>0.9*gap then (if not engaged then v_x*cos_a+v_y*sin_a else v_x) else 0;    // positive when coming towards engage

//  contact_up=s_rel_up<0;      // reach upper boundary
//  contact_down=s_rel_down<0;  // reach lower boundary

//  f_up_c=smooth(1,noEvent(if contact_up then -c*s_rel_up else 0));
//  f_up_d2=if contact_up then -d*v_rel_up else 0;
//  f_up_d=smooth(0,noEvent(if contact_up then (if f_up_d2>f_up_c then f_up_c else f_up_d2) else 0));

//  f_down_c=smooth(1,noEvent(if contact_down then -c*s_rel_down else 0));
//  f_down_d2=if contact_down then -d*v_rel_down else 0;
//  f_down_d=smooth(0,noEvent(if contact_down then (if f_down_d2>f_down_c then f_down_c else f_down_d2) else 0));

//  f_contact_up=f_up_c+f_up_d;//if contact_up then -c*s_rel_up-d*v_rel_up else 0;    // the contact force will be positive when contact
//  f_contact_down=f_down_c+f_down_d;//if contact_down then -c*s_rel_down-d*v_rel_down else 0;
//  f_friction_up=0;//f_contact_up*mue*tanh(v_friction_up/v_limit);        // the friction force is positive when coming towards engage direction
//  f_friction_down=0;//f_contact_down*mue*tanh(v_friction_down/v_limit);

//  f_L=if engaged or free then 0 else (if direction==Right then N_contact*(sin_a*(f_contact_up+f_contact_down)+cos_a*(f_friction_up+f_friction_down)) else -N_contact*(sin_a*(f_contact_up+f_contact_down)+cos_a*(f_friction_up+f_friction_down)));
                               //(if direction==Right then N_contact*(f_friction_up+f_friction_down) else -N_contact*(f_friction_up+f_friction_down))
//  f_R=-f_L;
//  tau=if synchronized then sa*unit_tau else (if engaged then r*N_contact*(c*y+d*v_y) elseif free then 0 else r*N_contact*(cos_a*(f_contact_up-f_contact_down)-sin_a*(f_friction_up-f_friction_down))); //r*N_contact*(f_contact_up-f_contact_down);
//  tau_L=tau;//if synchronized then sa*unit_tau else tau;
//  tau_R=-tau_L;      // don't forget to multiply N_contact and r

  connect(torque.flange, ctrR_L);
  connect(torque1.flange, ctrR_R);
  connect(ctrR_L, angleSensor.flange);
  connect(angleSensor1.flange, ctrR_R);
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end DogClutch2;
