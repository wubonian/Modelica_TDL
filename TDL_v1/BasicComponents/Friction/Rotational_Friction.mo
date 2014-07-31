within TDL_v1.BasicComponents.Friction;
model Rotational_Friction
  extends Modelica.Mechanics.Rotational.Icons.Clutch;
  parameter Friction.Types.Mode_R mode_select = Friction.Types.Mode_R.ContinuousCoulomb;
  parameter Real parm_mue = 0.2 annotation(Dialog(enable = mode <> 5));
  parameter Real parm_cgeo = 1;
  parameter Modelica.SIunits.AngularVelocity parm_w_limit = 0.01 annotation(Dialog(enable = mode == 1 or mode == 3));
  parameter Real parm_speed_small = 0.001 annotation(Dialog(enable = mode == 2 or mode == 4 or mode == 5));
  parameter Real parm_k = 1 annotation(Dialog(enable = mode <> 1 and mode <> 6));
  parameter Real parm_k_prop = 0.05 annotation(Dialog(enable = mode == 3 or mode == 4));
  parameter Real parm_k_Stribeck = 2 annotation(Dialog(enable = mode == 3 or mode == 4));
  parameter Real parm_keci0 = 100000.0 annotation(Dialog(enable = mode == 6));
  parameter Real parm_keci1 = 300 annotation(Dialog(enable = mode == 6));
  parameter Real parm_keci2 = 0.4 annotation(Dialog(enable = mode == 6));
  parameter Real parm_ws = 0.2 annotation(Dialog(enable = mode == 6));
  parameter Real parm_peak = 1 annotation(Dialog(enable = mode == 6));
  parameter Real parm_mue_pos[:,2] = [0,0.2] annotation(Dialog(enable = mode == 5));
  Rotational.Rotational_ContinuousCoulombFriction friction_1(parm_mue = parm_mue, parm_cgeo = parm_cgeo, parm_w_limit = parm_w_limit) if mode == 1 annotation(Placement(transformation(extent = {{-10,50},{10,70}})));
  Rotational.Rotational_DiscreteCoulombFriction friction_2(parm_mue = parm_mue, parm_cgeo = parm_cgeo, parm_k = parm_k, speed_small = parm_speed_small) if mode == 2 annotation(Placement(transformation(extent = {{-10,20},{10,40}})));
  Rotational.Rotational_ContinuousComplexFriction friction_3(parm_mue = parm_mue, parm_cgeo = parm_cgeo, parm_k = parm_k, parm_k_prop = parm_k_prop, parm_k_Stribeck = parm_k_Stribeck, parm_w_limit = parm_w_limit) if mode == 3 annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
  Rotational.Rotational_DiscreteComplexFriction_1 friction_4(parm_mue = parm_mue, parm_cgeo = parm_cgeo, parm_k = parm_k, parm_k_prop = parm_k_prop, parm_k_Stribeck = parm_k_Stribeck, speed_small = parm_speed_small) if mode == 4 annotation(Placement(transformation(extent = {{-10,-42},{10,-22}})));
  Rotational.Rotational_ContinuousTransientFriction friction_6(parm_keci0 = parm_keci0, parm_keci1 = parm_keci1, parm_keci2 = parm_keci2, parm_mue = parm_mue, parm_cgeo = parm_cgeo, peak = parm_peak, ws = parm_ws) if mode == 6 annotation(Placement(transformation(extent = {{-10,-100},{10,-80}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput f_input annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {0,100})));
  Rotational.Rotational_DiscreteComplexFriction_2 rotational_DiscreteComplexFriction_2_1(parm_cgeo = parm_cgeo, parm_k = parm_k, speed_small = parm_speed_small, mue_pos = parm_mue_pos) if mode == 5 annotation(Placement(transformation(extent = {{-10,-70},{10,-50}})));
protected
  parameter Integer mode=if mode_select==Friction.Types.Mode_R.ContinuousCoulomb then 1
 elseif
       mode_select==Friction.Types.Mode_R.DiscreteCoulomb then 2
 elseif
       mode_select==Friction.Types.Mode_R.ContinuousComplex then 3
 elseif
       mode_select==Friction.Types.Mode_R.DiscreteComplex_1 then 4
 elseif
       mode_select==Friction.Types.Mode_R.DiscreteComplex_2 then 5 else 6;

equation
  connect(f_input,friction_1.f_input) annotation(Line(points = {{0,100},{0,70}}, color = {0,0,127}, smooth = Smooth.None));
  connect(f_input,friction_2.f_input) annotation(Line(points = {{0,100},{0,78},{14,78},{14,48},{0,48},{0,40}}, color = {0,0,127}, smooth = Smooth.None));
  connect(f_input,friction_3.f_input) annotation(Line(points = {{0,100},{0,78},{14,78},{14,18},{0,18},{0,10}}, color = {0,0,127}, smooth = Smooth.None));
  connect(f_input,friction_4.f_input) annotation(Line(points = {{0,100},{0,78},{14,78},{14,-12},{0,-12},{0,-22}}, color = {0,0,127}, smooth = Smooth.None));
  connect(f_input,friction_6.f_input) annotation(Line(points = {{0,100},{0,78},{14,78},{14,-74},{0,-74},{0,-80}}, color = {0,0,127}, smooth = Smooth.None));
  connect(flange_a,friction_3.flange_a) annotation(Line(points = {{-100,0},{-10,0}}, color = {0,0,0}, smooth = Smooth.None));
  connect(friction_3.flange_b,flange_b) annotation(Line(points = {{10,0},{100,0}}, color = {0,0,0}, smooth = Smooth.None));
  connect(friction_2.flange_a,flange_a) annotation(Line(points = {{-10,30},{-40,30},{-40,0},{-100,0}}, color = {0,0,0}, smooth = Smooth.None));
  connect(friction_1.flange_a,flange_a) annotation(Line(points = {{-10,60},{-40,60},{-40,0},{-100,0}}, color = {0,0,0}, smooth = Smooth.None));
  connect(friction_4.flange_a,flange_a) annotation(Line(points = {{-10,-32},{-40,-32},{-40,0},{-100,0}}, color = {0,0,0}, smooth = Smooth.None));
  connect(flange_a,friction_6.flange_a) annotation(Line(points = {{-100,0},{-40,0},{-40,-90},{-10,-90}}, color = {0,0,0}, smooth = Smooth.None));
  connect(flange_b,friction_2.flange_b) annotation(Line(points = {{100,0},{56,0},{56,30},{10,30}}, color = {0,0,0}, smooth = Smooth.None));
  connect(flange_b,friction_1.flange_b) annotation(Line(points = {{100,0},{56,0},{56,60},{10,60}}, color = {0,0,0}, smooth = Smooth.None));
  connect(flange_b,friction_4.flange_b) annotation(Line(points = {{100,0},{56,0},{56,-32},{10,-32}}, color = {0,0,0}, smooth = Smooth.None));
  connect(flange_b,friction_6.flange_b) annotation(Line(points = {{100,0},{56,0},{56,-90},{10,-90}}, color = {0,0,0}, smooth = Smooth.None));
  connect(rotational_DiscreteComplexFriction_2_1.f_input,f_input) annotation(Line(points = {{0,-50},{0,-46},{14,-46},{14,78},{0,78},{0,100}}, color = {0,0,127}, smooth = Smooth.None));
  connect(rotational_DiscreteComplexFriction_2_1.flange_b,flange_b) annotation(Line(points = {{10,-60},{56,-60},{56,0},{100,0}}, color = {0,0,0}, smooth = Smooth.None));
  connect(rotational_DiscreteComplexFriction_2_1.flange_a,flange_a) annotation(Line(points = {{-10,-60},{-40,-60},{-40,0},{-100,0}}, color = {0,0,0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end Rotational_Friction;
