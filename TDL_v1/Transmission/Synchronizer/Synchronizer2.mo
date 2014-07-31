within TDL_v1.Transmission.Synchronizer;
model Synchronizer2
  import SI = Modelica.SIunits;

  parameter SI.Inertia J_hub=0.001;
  parameter SI.Inertia J_gear=0.001;
  parameter SI.Mass m=0.01;
  parameter SI.Force f_max=1000;
  parameter StateSelect stateSelect=StateSelect.prefer;

  Modelica.Mechanics.Rotational.Interfaces.Flange_a Left_Gear
    annotation (Placement(transformation(extent={{-110,70},{-90,90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a Left_Axis
    annotation (Placement(transformation(extent={{-110,-90},{-90,-70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b Right_Gear
    annotation (Placement(transformation(extent={{90,70},{110,90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b Right_Axis
    annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
   TDL_v1.BasicComponents.Endstop.Translational.Translational_ElasticEndstop translational_Endstop(
    mode=2,
    gap=-0.0104,
    d=1e4,
    c=1e7,
    gap_L=-0.0104,
    gap_R=0.0104)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Mechanics.Rotational.Components.Inertia Left_Gear_Inertia(J=J_gear)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Mechanics.Rotational.Components.Inertia Right_Gear_Inertia(J=J_gear)
    annotation (Placement(transformation(extent={{80,20},{60,40}})));
  Modelica.Mechanics.Rotational.Components.Inertia Hub_Inertia(J=J_hub)
    annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));

  Sleeve sleeve(
    m=0.05,
    s_limit=0.005,
    f_max=3000)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Blocks.Math.Gain gain(k=1/f_max/sin(4.4381/180*3.14)) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-30,10})));
  Modelica.Blocks.Math.Gain gain1(k=1/f_max/sin(4.4381/180*3.14)) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,10})));
model Sleeve
  import SI = Modelica.SIunits;
  parameter SI.Position s_limit=0.05;
  parameter SI.Mass m;
  parameter SI.Force f_max=500;
  SI.Position s(stateSelect=StateSelect.always);
  SI.Velocity v(stateSelect=StateSelect.always);
  SI.Acceleration a;
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Blocks.Interfaces.RealOutput f_press_left
    annotation (Placement(transformation(extent={{-100,-10},{-120,10}})));
  Modelica.Blocks.Interfaces.RealOutput f_press_right
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  SI.Force f_obstacle;
  Real sa;
  // modes of synchronizer
  constant Integer Idle=0;
  constant Integer Synchro_Right=1;
  constant Integer Engaged_Right=2;
  constant Integer Synchro_Left=-1;
  constant Integer Engaged_Left=-2;
  Integer mode_syn(start=0);//(final min=Engaged_Left,final max=Engaged_Right,start=Idle,fixed=true);
  protected
  constant SI.Acceleration unitAcceleration=1;
  constant SI.Force unitForce=1;
  public
  Modelica.Blocks.Interfaces.BooleanInput left_locked annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-100})));
  Modelica.Blocks.Interfaces.BooleanInput right_locked annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-100})));
equation
 mode_syn=if pre(mode_syn)==Idle and s>=s_limit or pre(mode_syn)==Synchro_Right and not right_locked then Synchro_Right
 elseif
       pre(mode_syn)==Idle and s<=-s_limit or pre(mode_syn)==Synchro_Left and not left_locked then Synchro_Left
 elseif
       pre(mode_syn)==Synchro_Right and right_locked or pre(mode_syn)==Engaged_Right and s>=s_limit then Engaged_Right
 elseif
       pre(mode_syn)==Synchro_Left and left_locked or pre(mode_syn)==Engaged_Left and s<=-s_limit then Engaged_Left
 else
     Idle;
 s=flange_a.s;
 v=der(s);
 a=der(v);
 m*a=flange_a.f+f_obstacle;
 a=if mode_syn==Synchro_Left or mode_syn==Synchro_Right then 0 else sa*unitAcceleration;
 f_obstacle=if mode_syn==Synchro_Left or mode_syn==Synchro_Right then sa*unitAcceleration else 0;
 f_press_left=if mode_syn==Engaged_Left then f_max elseif mode_syn==Synchro_Left then f_obstacle else 0;
 f_press_right=if mode_syn==Engaged_Right then f_max elseif mode_syn==Synchro_Right then -f_obstacle else 0;
   when mode_syn==Synchro_Left or mode_syn==Synchro_Right then
     reinit(v,0);
     //reinit(s,if mode_syn==Synchro_Right then s_limit else -s_limit);
   end when;

   annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), uses(Modelica(version="3.2.1")));
end Sleeve;
  Modelica.Mechanics.Rotational.Components.Clutch Left_Friction(
    mue_pos=[0,0.3],
    peak=1,
    cgeo=0.022,
    fn_max=3000)
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Modelica.Mechanics.Rotational.Components.Clutch Right_Friction(
    mue_pos=[0,0.3],
    peak=1,
    cgeo=0.022,
    fn_max=3000)
    annotation (Placement(transformation(extent={{40,-50},{20,-30}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{0,80},{20,100}})));
  BasicComponents.Friction.Translational.Translational_ContinuousCoulombFriction
    translational_ContinuousCoulombFriction(
    parm_mue=1,
    parm_cgeo=1,
    parm_v_limit=0.005)
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={56,50})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    tableOnFile=true,
    tableName="resistance",
    fileName=
        "D:/Library_Update/TDL_Workspace/Cam/synchronizer_resistance.mat")
    annotation (Placement(transformation(extent={{30,80},{50,100}})));
equation
  sleeve.right_locked=abs(Right_Friction.w_relfric)<0.001;
  sleeve.left_locked=abs(Left_Friction.w_relfric)<0.001;
  connect(translational_Endstop.flange, flange_a) annotation (Line(
       points={{-20,60},{0,60},{0,100}},
       color={0,127,0},
       smooth=Smooth.None));
  connect(Left_Gear, Left_Gear_Inertia.flange_a) annotation (Line(
      points={{-100,80},{-80,80},{-80,30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Gear_Inertia.flange_a, Right_Gear) annotation (Line(
      points={{80,30},{80,80},{100,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Hub_Inertia.flange_a, Left_Axis) annotation (Line(
      points={{-10,-80},{-100,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sleeve.flange_a, flange_a) annotation (Line(
      points={{0,40},{0,100}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(gain.u, sleeve.f_press_left) annotation (Line(
      points={{-30,22},{-30,30},{-11,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sleeve.f_press_right, gain1.u) annotation (Line(
      points={{11,30},{30,30},{30,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Hub_Inertia.flange_b, Right_Axis) annotation (Line(
      points={{10,-80},{100,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Friction.flange_b, Hub_Inertia.flange_b) annotation (Line(
      points={{20,-40},{10,-40},{10,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Right_Friction.f_normalized, gain1.y) annotation (Line(
      points={{30,-29},{30,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Right_Friction.flange_a, Right_Gear_Inertia.flange_b) annotation (
      Line(
      points={{40,-40},{60,-40},{60,30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Friction.flange_a, Left_Gear_Inertia.flange_b) annotation (Line(
      points={{-40,-40},{-60,-40},{-60,30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Friction.flange_b, Hub_Inertia.flange_a) annotation (Line(
      points={{-20,-40},{-10,-40},{-10,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Left_Friction.f_normalized, gain.y) annotation (Line(
      points={{-30,-29},{-30,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fixed.flange, translational_ContinuousCoulombFriction.flange_b)
    annotation (Line(
      points={{56,50},{40,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(positionSensor.s, combiTable1D.u[1]) annotation (Line(
      points={{21,90},{28,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flange_a, positionSensor.flange) annotation (Line(
      points={{0,100},{0,90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(translational_ContinuousCoulombFriction.flange_a, sleeve.flange_a)
    annotation (Line(
      points={{20,50},{0,50},{0,40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(combiTable1D.y[1], translational_ContinuousCoulombFriction.f_input)
    annotation (Line(
      points={{51,90},{60,90},{60,70},{30,70},{30,60}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (uses(Modelica(version="3.2.1")), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Synchronizer2;
