within TDL_v1.Transmission.Synchronizer;
model Synchronizer3
  "no idlewheel inertia is modelled, hub inertia and mass of sleeve are modelled"
  import Modelica.Constants.pi;
  import SI = Modelica.SIunits;
  parameter Boolean Select_Right=true;
  parameter Boolean Select_Left=true;
  parameter Boolean Select_Right_Shaft=true;
  parameter Boolean Select_Left_Shaft=true;
  //------------------------------------------------------------------------------------------------------------------------------------------
  // basic parameter setting for synchronizer
  //parameter Integer direction;
  parameter Integer N=27;
  parameter Integer N_contact_ring=18;  // the real contact number of friction ring tooth
  parameter Integer N_contact_idlewheel=21;  // the real contact number of ideal wheel tooth
  parameter SI.Radius r_tooth=0.028;
  //parameter SI.Length keci_tooth;  // rotational gap between tooth in unit m
  parameter SI.Length gap_ring=0.003;  // tooth tip axial gap between sleeve and ring
  parameter SI.Length gap_idlewheel=0.00612;  // tooth tip axial gap between sleeve and idle wheel
  parameter SI.Angle alfa_tooth=56/180*pi;  // tooth angle ,unit: rad
  parameter SI.Angle alfa_friction_cone=4.4381/180*pi;  // friction cone angle, unit:rad
  parameter Real friction_mue=0.3;  // friction coefficient
  parameter Real friction_mue_failure=10;
  parameter SI.Radius r_friction=0.022;
  parameter Integer N_friction=1;  // number of friction face
  parameter SI.AngularVelocity friction_w_limit=1e-4;  // needed by tanh function in friction model
  parameter SI.Angle rotational_range=7/180*pi;  // rotational range for gap between sleeve and friction ring
  parameter SI.Inertia J_ring=5e-4;  // Inertia for friction ring
  //------------------------------------------------------------------------------------------------------------------------------------------
  parameter SI.TranslationalSpringConstant c_dogclutch_ring=1e7;
  parameter SI.TranslationalDampingConstant d_dogclutch_ring=1e4;
  parameter SI.TranslationalSpringConstant c_dogclutch_gear=1e8;
  parameter SI.TranslationalDampingConstant d_dogclutch_gear=1e3;
  parameter Real ring_engaged_c_gain=0.001;
  parameter Real ring_engaged_d_gain=10;
  parameter Real gear_engaged_c_gain=0.001;
  parameter Real gear_engaged_d_gain=10;
  parameter SI.TranslationalSpringConstant c_endstop=1e9;
  parameter SI.TranslationalDampingConstant d_endstop=1e5;
  parameter SI.Mass m_sleeve=0.05;
  parameter SI.Inertia J_hub_sleeve=3.51e-4;
  parameter SI.Length gap_endstop=0.0104;
  parameter Real mue_dogclutch=0;
  parameter SI.Velocity v_limit_dogclutch=1e-5;

  parameter SI.RotationalSpringConstant c_rotational_backlash=1e9;
  parameter SI.RotationalDampingConstant d_rotational_backlash=1e5;
  //------------------------------------------------------------------------------------------------------------------------------------------
  parameter SI.Length self_lock_l1=0.001;
  parameter SI.Length self_lock_l2=0.004;
  parameter SI.TranslationalSpringConstant self_lock_c=3.3e4;
  parameter SI.TranslationalDampingConstant self_lock_d=100;
  parameter SI.Force self_lock_fn=10;
  parameter Real self_lock_mue=0.2;
  //------------------------------------------------------------------------------------------------------------------------------------------
  Modelica.Mechanics.Translational.Components.ElastoGap endstop_right(
    c=c_endstop,
    d=d_endstop,
    s_rel0=-gap_endstop) if
                       Select_Right
    annotation (Placement(transformation(extent={{100,26},{120,46}})));
  Modelica.Mechanics.Translational.Components.Fixed right if Select_Right annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={136,36})));
  Modelica.Mechanics.Translational.Components.ElastoGap endstop_left(
    c=c_endstop,
    d=d_endstop,
    s_rel0=-gap_endstop) if
                       Select_Left
    annotation (Placement(transformation(extent={{-120,26},{-100,46}})));
  Modelica.Mechanics.Translational.Components.Fixed left if Select_Left annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-136,36})));
  Modelica.Mechanics.Translational.Components.Mass sleeve(m=m_sleeve)
                                                                  annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,74})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-10,86},{10,106}})));
  Modelica.Mechanics.Rotational.Components.Inertia hub_sleeve(J=J_hub_sleeve)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a Left_Gear if      Select_Left
    annotation (Placement(transformation(extent={{-166,50},{-146,70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a Left_Axis if Select_Left_Shaft
    annotation (Placement(transformation(extent={{-168,-70},{-148,-50}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b Right_Gear if      Select_Right
    annotation (Placement(transformation(extent={{146,50},{166,70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b Right_Axis if Select_Right_Shaft
    annotation (Placement(transformation(extent={{146,-70},{166,-50}})));
  Synchronizer_Half Left_Half(
    direction=-1,
    N=N,
    N_contact_ring=N_contact_ring,
    N_contact_idlewheel=N_contact_idlewheel,
    r_tooth=r_tooth,
    gap_ring=gap_ring,
    gap_idlewheel=gap_idlewheel,
    alfa_tooth=alfa_tooth,
    alfa_friction_cone=alfa_friction_cone,
    friction_mue=friction_mue,
    r_friction=r_friction,
    N_friction=N_friction,
    friction_w_limit=friction_w_limit,
    rotational_range=rotational_range,
    J_ring=J_ring,
    mue_dogclutch=mue_dogclutch,
    v_limit_dogclutch=v_limit_dogclutch,
    c_rotational_backlash=c_rotational_backlash,
    d_rotational_backlash=d_rotational_backlash,
    k=-1/sin(alfa_friction_cone),
    friction_mue_failure=friction_mue_failure,
    c_dogclutch_ring=c_dogclutch_ring,
    d_dogclutch_ring=d_dogclutch_ring,
    c_dogclutch_gear=c_dogclutch_gear,
    d_dogclutch_gear=d_dogclutch_gear,
    ring_engaged_c_gain=ring_engaged_c_gain,
    ring_engaged_d_gain=ring_engaged_d_gain,
    gear_engaged_c_gain=gear_engaged_c_gain,
    gear_engaged_d_gain=gear_engaged_d_gain) if Select_Left
    annotation (Placement(transformation(extent={{-36,0},{-78,40}})));
  Synchronizer_Half Right_Half(
    direction=1,
    N=N,
    N_contact_ring=N_contact_ring,
    N_contact_idlewheel=N_contact_idlewheel,
    r_tooth=r_tooth,
    gap_ring=gap_ring,
    gap_idlewheel=gap_idlewheel,
    alfa_tooth=alfa_tooth,
    alfa_friction_cone=alfa_friction_cone,
    friction_mue=friction_mue,
    r_friction=r_friction,
    N_friction=N_friction,
    friction_w_limit=friction_w_limit,
    rotational_range=rotational_range,
    J_ring=J_ring,
    mue_dogclutch=mue_dogclutch,
    v_limit_dogclutch=v_limit_dogclutch,
    c_rotational_backlash=c_rotational_backlash,
    d_rotational_backlash=d_rotational_backlash,
    friction_mue_failure=friction_mue_failure,
    c_dogclutch_ring=c_dogclutch_ring,
    d_dogclutch_ring=d_dogclutch_ring,
    c_dogclutch_gear=c_dogclutch_gear,
    d_dogclutch_gear=d_dogclutch_gear,
    ring_engaged_c_gain=ring_engaged_c_gain,
    ring_engaged_d_gain=ring_engaged_d_gain,
    gear_engaged_c_gain=gear_engaged_c_gain,
    gear_engaged_d_gain=gear_engaged_d_gain) if Select_Right
    annotation (Placement(transformation(extent={{40,0},{80,40}})));
  Self_Lock self_Lock(
    l1=self_lock_l1,
    l2=self_lock_l2,
    c=self_lock_c,
    d=self_lock_d,
    mue=self_lock_mue,
    f_n=self_lock_fn) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,10})));
model Synchronizer_Half
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;
  //------------------------------------------------------------------------------------------------------------------------------------------
  // basic parameter setting for synchronizer
  parameter Integer direction;
  parameter Integer N;
  parameter Integer N_contact_ring;  // the real contact number of friction ring tooth
  parameter Integer N_contact_idlewheel;  // the real contact number of ideal wheel tooth
  parameter SI.Radius r_tooth;
  //parameter SI.Length keci_tooth;  // rotational gap between tooth in unit m
  parameter SI.Length gap_ring;  // tooth tip axial gap between sleeve and ring
  parameter SI.Length gap_idlewheel;  // tooth tip axial gap between sleeve and idle wheel
  parameter SI.Angle alfa_tooth;  // tooth angle ,unit: rad
  parameter SI.Angle alfa_friction_cone;  // friction cone angle, unit:rad
  parameter Real friction_mue;  // friction coefficient
  parameter Real friction_mue_failure;
  parameter SI.Radius r_friction;
  parameter Integer N_friction;  // number of friction face
  parameter SI.AngularVelocity friction_w_limit;  // needed by tanh function in friction model
  parameter SI.Angle rotational_range;  // rotational range for gap between sleeve and friction ring
  parameter SI.Inertia J_ring;  // Inertia for friction ring
  //------------------------------------------------------------------------------------------------------------------------------------------
  // dynamic setting for synchronizer
  /*parameter SI.TranslationalSpringConstant c_syn_ring=1000000;
  parameter SI.TranslationalDampingConstant d_syn_ring=3500;
  parameter SI.TranslationalSpringConstant c_eng_ring=1000000;
  parameter SI.TranslationalDampingConstant d_eng_ring=3500;

  parameter SI.TranslationalSpringConstant c_syn_idlewheel=1000000;
  parameter SI.TranslationalDampingConstant d_syn_idlewheel=3500;
  parameter SI.TranslationalSpringConstant c_eng_idlewheel=3500;
  parameter SI.TranslationalDampingConstant d_eng_idlewheel=3500;*/
  parameter SI.TranslationalSpringConstant c_dogclutch_ring;
  parameter SI.TranslationalDampingConstant d_dogclutch_ring;
  parameter SI.TranslationalSpringConstant c_dogclutch_gear;
  parameter SI.TranslationalDampingConstant d_dogclutch_gear;
  parameter Real ring_engaged_c_gain=0.001;
  parameter Real ring_engaged_d_gain=10;
  parameter Real gear_engaged_c_gain=0.001;
  parameter Real gear_engaged_d_gain=10;
  parameter Real mue_dogclutch;
  parameter SI.Velocity v_limit_dogclutch;

  parameter SI.RotationalSpringConstant c_rotational_backlash=1e8;
  parameter SI.RotationalDampingConstant d_rotational_backlash=2e4;
  //------------------------------------------------------------------------------------------------------------------------------------------
  // derived parameter
  parameter Real k=1/sin(alfa_friction_cone);  // parameter for gain model
  parameter Real friction_cgeo=r_friction*N_friction;
  final parameter Real k_1=if direction==1 then 1 else -1;
  //------------------------------------------------------------------------------------------------------------------------------------------
  Modelica.Mechanics.Rotational.Interfaces.Flange_a ctrRS
    annotation (Placement(transformation(extent={{-126,-10},{-106,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a ctrRH
    annotation (Placement(transformation(extent={{-126,-90},{-106,-70}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a ctrTS
    annotation (Placement(transformation(extent={{-126,70},{-106,90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b ctrRI
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Modelica.Mechanics.Translational.Components.Fixed ring_endstop
                                                           annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,52})));
  Modelica.Mechanics.Rotational.Components.Inertia ring(w(start=0), J=J_ring)
    annotation (Placement(transformation(extent={{-20,-90},{0,-70}})));
  Modelica.Blocks.Math.Gain pressure_gain(k=k)                annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,-46})));
  Modelica.Mechanics.Translational.Components.Fixed idlewheel_endstop
                                                           annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,30})));

  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor
    annotation (Placement(transformation(extent={{48,42},{68,62}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b Endstop_Port
    annotation (Placement(transformation(extent={{86,70},{106,90}})));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(
    c=c_rotational_backlash,
    d=d_rotational_backlash,
    b=rotational_range)
    annotation (Placement(transformation(extent={{-100,-90},{-80,-70}})));
  TDL_v1.MechanicalActuator.DogClutch.DogClutch2 ring_contact(
      direction=direction,
      N=N,
      N_contact=N_contact_ring,
      alfa=alfa_tooth,
      mue=mue_dogclutch,
      gap=gap_ring,
      r=r_tooth,
      v_limit=v_limit_dogclutch,
      c=c_dogclutch_ring,
      d=d_dogclutch_ring,
      engaged_c_gain=ring_engaged_c_gain,
      engaged_d_gain=ring_engaged_d_gain)
      annotation (Placement(transformation(extent={{-80,20},{-60,60}})));
  TDL_v1.MechanicalActuator.DogClutch.DogClutch2 gear_contact(
      direction=direction,
      N=N,
      N_contact=N_contact_idlewheel,
      mue=mue_dogclutch,
      v_limit=v_limit_dogclutch,
      gap=gap_idlewheel,
      r=r_tooth,
      alfa=alfa_tooth,
      c=c_dogclutch_gear,
      d=d_dogclutch_gear,
      engaged_c_gain=gear_engaged_c_gain,
      engaged_d_gain=gear_engaged_d_gain)
      annotation (Placement(transformation(extent={{0,0},{20,40}})));
  Modelica.Blocks.Interfaces.RealInput lock_force annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,100})));
  Synchronizer_Component synchronizer_Component
    annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={50,-16})));

model Synchronizer_Component
  Modelica.SIunits.Angle phi_rel;
  Modelica.SIunits.AngularVelocity w_rel;
  Modelica.SIunits.AngularAcceleration a_rel(start=0);
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
          rotation=0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}},
          rotation=0)));

equation
  phi_rel = flange_a.phi - flange_b.phi;
  w_rel = der(phi_rel);
  a_rel = der(w_rel);
  flange_b.tau = 0;
  flange_a.tau = 0.1*tanh(w_rel*1000);
end Synchronizer_Component;

    BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction
      rotational_ContinuousCoulombFriction(
      parm_mue=friction_mue,
      parm_cgeo=friction_cgeo,
      parm_w_limit=friction_w_limit)
      annotation (Placement(transformation(extent={{40,-90},{60,-70}})));
equation
  connect(forceSensor.flange_b, ring_endstop.flange)
                                               annotation (Line(
      points={{68,52},{90,52}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Endstop_Port, ctrTS) annotation (Line(
      points={{96,80},{-10,80},{-10,80},{-116,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ctrRH, elastoBacklash.flange_a) annotation (Line(
      points={{-116,-80},{-100,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(elastoBacklash.flange_b, ring.flange_a) annotation (Line(
      points={{-80,-80},{-20,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ring_contact.ctrT_R, forceSensor.flange_a) annotation (Line(
      points={{-60.4,52},{48,52}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ring_contact.ctrT_L, ctrTS) annotation (Line(
      points={{-79.6,52},{-100,52},{-100,80},{-116,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(ring_contact.ctrR_L, ctrRS) annotation (Line(
      points={{-79.6,28},{-100,28},{-100,0},{-116,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ring_contact.ctrR_R, ring.flange_b) annotation (Line(
      points={{-60.4,28},{-40,28},{-40,-60},{20,-60},{20,-80},{0,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gear_contact.ctrT_R, idlewheel_endstop.flange) annotation (Line(
      points={{19.6,32},{56,32},{56,30},{90,30}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(gear_contact.ctrT_L, ctrTS) annotation (Line(
      points={{0.4,32},{-20,32},{-20,80},{-116,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(gear_contact.ctrR_L, ctrRS) annotation (Line(
      points={{0.4,8},{-58,8},{-58,0},{-116,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gear_contact.ctrR_R, ctrRI) annotation (Line(
      points={{19.6,8},{58,8},{58,0},{96,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(add.y, pressure_gain.u) annotation (Line(
      points={{50,-22.6},{50,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lock_force, add.u2) annotation (Line(
      points={{0,100},{0,44},{36,44},{36,0},{46.4,0},{46.4,-8.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor.f, add.u1) annotation (Line(
      points={{50,41},{50,26},{53.6,26},{53.6,-8.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(synchronizer_Component.flange_a, ring.flange_b) annotation (Line(
      points={{40,-110},{20,-110},{20,-80},{0,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer_Component.flange_b, ctrRI) annotation (Line(
      points={{60,-110},{78,-110},{78,0},{96,0}},
      color={0,0,0},
      smooth=Smooth.None));
    connect(rotational_ContinuousCoulombFriction.flange_b, ctrRI)
      annotation (Line(
        points={{60,-80},{78,-80},{78,0},{96,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotational_ContinuousCoulombFriction.flange_a, ring.flange_b)
      annotation (Line(
        points={{40,-80},{22,-80},{22,-80},{0,-80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotational_ContinuousCoulombFriction.f_input, pressure_gain.y)
      annotation (Line(
        points={{50,-70},{50,-57},{50,-57}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (                                 Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-120,-120},{100,100}}), graphics),
    Icon(coordinateSystem(extent={{-120,-120},{100,100}}, preserveAspectRatio=false)));
end Synchronizer_Half;

model Self_Lock
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;
  parameter SI.Length l1;
  parameter SI.Length l2;
  parameter SI.TranslationalSpringConstant c;
  parameter SI.TranslationalDampingConstant d;
  parameter Real mue;
  parameter SI.Force f_n;
  final parameter SI.Force f_resistance=f_n*mue;
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  protected
  SI.Position s;
  SI.Velocity v;
  SI.Force f;
  public
  Modelica.Mechanics.Translational.Sensors.PositionSensor psnSensor
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(extent={{-60,-40},{-80,-20}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  s= psnSensor.s;
  v= speedSensor.v;
  f= if s>=-l1/2 and s<=l1/2 then 0 elseif s>l1/2 and s<l2/2 or s<-l1/2 and s>-l2/2 then c*s+d*v else f_resistance*tanh(v/1e-3);
  force.f= -f;
  connect(psnSensor.flange, flange) annotation (Line(
      points={{-80,30},{-88,30},{-88,0},{-96,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(force.flange, flange) annotation (Line(
      points={{-80,-30},{-88,-30},{-88,0},{-96,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(flange, speedSensor.flange) annotation (Line(
      points={{-96,0},{-80,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (uses(Modelica(version="3.2.1")), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Self_Lock;

  Modelica.Blocks.Sources.RealExpression Left_Fault(y=0)
    annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  Modelica.Blocks.Sources.RealExpression Right_Fault(y=0)
    annotation (Placement(transformation(extent={{100,70},{80,90}})));
equation
  connect(endstop_right.flange_b, right.flange) annotation (Line(
      points={{120,36},{136,36}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(endstop_left.flange_a, left.flange) annotation (Line(
      points={{-120,36},{-136,36}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Axis, hub_sleeve.flange_a) annotation (Line(
      points={{-158,-60},{-100,-60},{-100,-30},{-10,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Axis, hub_sleeve.flange_b) annotation (Line(
      points={{156,-60},{100,-60},{100,-30},{10,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Half.Endstop_Port, endstop_left.flange_b) annotation (Line(
      points={{-77.2364,36.3636},{-90,36.3636},{-90,36},{-100,36}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Half.ctrRS, hub_sleeve.flange_a) annotation (Line(
      points={{-36.7636,21.8182},{-18,21.8182},{-18,-30},{-10,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Half.ctrRH, hub_sleeve.flange_a) annotation (Line(
      points={{-36.7636,7.27273},{-24,7.27273},{-24,-30},{-10,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Half.ctrRI, Left_Gear) annotation (Line(
      points={{-77.2364,21.8182},{-88,21.8182},{-88,60},{-156,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Half.ctrRS, hub_sleeve.flange_b) annotation (Line(
      points={{40.7273,21.8182},{20,21.8182},{20,-30},{10,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Half.ctrRH, hub_sleeve.flange_b) annotation (Line(
      points={{40.7273,7.27273},{26,7.27273},{26,-30},{10,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Half.Endstop_Port, endstop_right.flange_a) annotation (Line(
      points={{79.2727,36.3636},{90,36.3636},{90,36},{100,36}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Right_Half.ctrRI, Right_Gear) annotation (Line(
      points={{79.2727,21.8182},{90,21.8182},{90,60},{156,60}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(flange_a, sleeve.flange_a) annotation (Line(
      points={{0,96},{0,84},{1.77636e-015,84}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Half.ctrTS, sleeve.flange_b) annotation (Line(
      points={{-36.7636,36.3636},{0,36.3636},{0,64}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(sleeve.flange_b, Right_Half.ctrTS) annotation (Line(
      points={{0,64},{0,36.3636},{40.7273,36.3636}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(sleeve.flange_b, self_Lock.flange) annotation (Line(
      points={{0,64},{0,19.6}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Left_Fault.y, Left_Half.lock_force) annotation (Line(
      points={{-79,80},{-58.9091,80},{-58.9091,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Right_Fault.y, Right_Half.lock_force) annotation (Line(
      points={{79,80},{61.8182,80},{61.8182,40}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -100},{160,100}}),
                        graphics),
    Icon(coordinateSystem(extent={{-160,-100},{160,100}})));
end Synchronizer3;
