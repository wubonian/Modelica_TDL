within TDL_v1.Transmission.Example;
model EMT2

  Modelica.Mechanics.Rotational.Components.Inertia input_shaft(J=0.001)
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia output_shaft(J=0.02)
    annotation (Placement(transformation(extent={{-140,-88},{-120,-68}})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear8(i=4.3215) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-146,-100})));
  Modelica.Mechanics.Rotational.Components.Inertia reducer_shaft(J=1.8)
    annotation (Placement(transformation(extent={{-180,-130},{-160,-110}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_engine
    annotation (Placement(transformation(extent={{-210,-10},{-190,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_wheel
    annotation (Placement(transformation(extent={{-210,-130},{-190,-110}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_motor
    annotation (Placement(transformation(extent={{228,86},{248,106}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_clutch
    annotation (Placement(transformation(extent={{-150,106},{-130,126}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_syn_1_2
    annotation (Placement(transformation(extent={{-60,106},{-40,126}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_syn_3_4
    annotation (Placement(transformation(extent={{20,106},{40,126}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_syn_si_5
    annotation (Placement(transformation(extent={{100,106},{120,126}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_syn_so
    annotation (Placement(transformation(extent={{180,106},{200,126}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.001)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,-46})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=0.001)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-28,-48})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J=0.001)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={46,-20})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(J=0.001)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={92,-18})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia4(J=0.001)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={196,12})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia5(J=0.001)
    annotation (Placement(transformation(extent={{114,2},{134,22}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia6(J=0.001)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={126,58})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_1(i=2.9375) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-90,-20})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_2(i=1.95) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,-20})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_3(i=1.3214) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={46,-56})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_4(i=0.9697) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={92,-56})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_5(i=0.7895) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={210,-50})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_6(i=1.3369) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={210,30})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_7(i=1.5455) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,40})));
  TDL_v1.Transmission.Gear.Physical_Gear idealGear2_8(i=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,78})));
  Clutch.Clutch clutch(diaphragm_spring(fileName_large_edge=
          "D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat",
        fileName_small_edge=
          "D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat"))
    annotation (Placement(transformation(extent={{-180,-2},{-160,18}})));
  Synchronizer.Synchronizer2 synchronizer(f_max=3000)
    annotation (Placement(transformation(extent={{-68,-80},{-32,-60}})));
  Synchronizer.Synchronizer2 synchronizer1(f_max=3000)
    annotation (Placement(transformation(extent={{50,-2},{86,18}})));
  Synchronizer.Synchronizer2 synchronizer2(f_max=3000)
    annotation (Placement(transformation(extent={{142,-6},{178,14}})));
  Synchronizer.Synchronizer2 synchronizer3(f_max=3000)
    annotation (Placement(transformation(extent={{152,40},{188,60}})));
equation
  connect(flange_wheel, reducer_shaft.flange_a) annotation (Line(
      points={{-200,-120},{-180,-120}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(idealGear2_1.flange_b, inertia.flange_a) annotation (Line(
      points={{-90,-30},{-90,-36},{-70,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(input_shaft.flange_b, idealGear2_1.flange_a) annotation (Line(
      points={{-120,0},{-90,0},{-90,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia1.flange_a, idealGear2_2.flange_b) annotation (Line(
      points={{-28,-38},{-10,-38},{-10,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear2_2.flange_a, input_shaft.flange_b) annotation (Line(
      points={{-10,-10},{-10,0},{-120,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia2.flange_b, idealGear2_3.flange_a) annotation (Line(
      points={{46,-30},{46,-46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia3.flange_b, idealGear2_4.flange_a) annotation (Line(
      points={{92,-28},{92,-46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear2_7.flange_b, inertia5.flange_a) annotation (Line(
      points={{100,30},{100,12},{114,12}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear2_7.flange_a, inertia6.flange_a) annotation (Line(
      points={{100,50},{100,58},{116,58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear2_8.flange_b, idealGear2_7.flange_a) annotation (Line(
      points={{100,68},{100,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear2_8.flange_a, flange_motor) annotation (Line(
      points={{100,88},{100,96},{238,96}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear2_6.flange_b, inertia4.flange_b) annotation (Line(
      points={{210,20},{210,12},{206,12}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia4.flange_b, idealGear2_5.flange_a) annotation (Line(
      points={{206,12},{210,12},{210,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(output_shaft.flange_a, idealGear8.flange_a) annotation (Line(
      points={{-140,-78},{-146,-78},{-146,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(reducer_shaft.flange_b, idealGear8.flange_b) annotation (Line(
      points={{-160,-120},{-146,-120},{-146,-110}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Engine_Flange, flange_engine) annotation (Line(
      points={{-180,0},{-200,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Transmission_Flange, input_shaft.flange_a) annotation (
      Line(
      points={{-160,0},{-140,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Actuator_Flange, flange_clutch) annotation (Line(
      points={{-160,16},{-140,16},{-140,116}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(synchronizer.Right_Gear, inertia1.flange_b) annotation (Line(
      points={{-32,-62},{-28,-62},{-28,-58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Left_Gear, inertia.flange_b) annotation (Line(
      points={{-68,-62},{-70,-62},{-70,-56}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(output_shaft.flange_b, synchronizer.Left_Axis) annotation (Line(
      points={{-120,-78},{-68,-78}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Right_Axis, idealGear2_3.flange_b) annotation (Line(
      points={{-32,-78},{46,-78},{46,-66}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Right_Axis, idealGear2_4.flange_b) annotation (Line(
      points={{-32,-78},{92,-78},{92,-66}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.Right_Axis, idealGear2_5.flange_b) annotation (Line(
      points={{-32,-78},{210,-78},{210,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer.flange_a, flange_syn_1_2) annotation (Line(
      points={{-50,-60},{-50,116}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(synchronizer1.Left_Axis, input_shaft.flange_b) annotation (Line(
      points={{50,0},{-120,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer1.Left_Gear, inertia2.flange_a) annotation (Line(
      points={{50,16},{46,16},{46,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer1.Right_Gear, inertia3.flange_a) annotation (Line(
      points={{86,16},{92,16},{92,-8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer1.flange_a, flange_syn_3_4) annotation (Line(
      points={{68,18},{68,40},{30,40},{30,116}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(inertia5.flange_b, synchronizer2.Left_Gear) annotation (Line(
      points={{134,12},{142,12}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2.Right_Gear, inertia4.flange_a) annotation (Line(
      points={{178,12},{186,12}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2.Left_Axis, synchronizer1.Right_Axis) annotation (Line(
      points={{142,-4},{114,-4},{114,0},{86,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer2.flange_a, flange_syn_si_5) annotation (Line(
      points={{160,14},{160,26},{140,26},{140,116},{110,116}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(synchronizer3.Right_Axis, idealGear2_6.flange_a) annotation (Line(
      points={{188,42},{210,42},{210,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer3.Left_Gear, inertia6.flange_b) annotation (Line(
      points={{152,58},{136,58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(synchronizer3.flange_a, flange_syn_so) annotation (Line(
      points={{170,60},{170,116},{190,116}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (
    uses(Modelica(version="3.2.1")),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-140},{
            240,120}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-140},{240,
            120}})));
end EMT2;
