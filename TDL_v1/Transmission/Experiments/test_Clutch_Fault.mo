within TDL_v1.Transmission.Experiments;
model test_Clutch_Fault

  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=9)
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(
      tau_constant=20)
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01)
    annotation (Placement(transformation(extent={{10,60},{30,80}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(extent={{70,60},{50,80}})));
  Modelica.Blocks.Sources.Constant const(k=-500)
    annotation (Placement(transformation(extent={{110,60},{90,80}})));
  Clutch.Clutch_Fault clutch_Fault(
    useNormalModel=false,
    parm_stiffness_gain_large=10,
    parm_stiffness_gain_small=10)
    annotation (Placement(transformation(extent={{-30,52},{-10,72}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(
                                                           J=1)
    annotation (Placement(transformation(extent={{-70,110},{-50,130}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(J=9)
    annotation (Placement(transformation(extent={{10,110},{30,130}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque1(
      tau_constant=20)
    annotation (Placement(transformation(extent={{-110,110},{-90,130}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(
                                                        m=0.01)
    annotation (Placement(transformation(extent={{10,140},{30,160}})));
  Modelica.Mechanics.Translational.Sources.Force force1
    annotation (Placement(transformation(extent={{70,140},{50,160}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=-500)
    annotation (Placement(transformation(extent={{110,140},{90,160}})));
  Clutch.Clutch clutch
    annotation (Placement(transformation(extent={{-28,132},{-8,152}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia4(
                                                           J=1)
    annotation (Placement(transformation(extent={{-70,-60},{-50,-40}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia5(J=9)
    annotation (Placement(transformation(extent={{10,-60},{30,-40}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque2(
      tau_constant=20)
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(
                                                        m=0.01)
    annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
  Modelica.Mechanics.Translational.Sources.Force force2
    annotation (Placement(transformation(extent={{70,-30},{50,-10}})));
  Modelica.Blocks.Sources.Constant const2(
                                         k=-500)
    annotation (Placement(transformation(extent={{110,-30},{90,-10}})));
  Clutch.Clutch_Fault clutch_Fault1(
    useNormalModel=false,
    parm_stiffness_gain_large=10,
    parm_stiffness_gain_small=10)
    annotation (Placement(transformation(extent={{-30,-38},{-10,-18}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia6(
                                                           J=1)
    annotation (Placement(transformation(extent={{-70,-140},{-50,-120}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia7(J=9)
    annotation (Placement(transformation(extent={{10,-140},{30,-120}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque3(
      tau_constant=20)
    annotation (Placement(transformation(extent={{-110,-140},{-90,-120}})));
  Modelica.Mechanics.Translational.Components.Mass mass3(
                                                        m=0.01)
    annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
  Modelica.Mechanics.Translational.Sources.Force force3
    annotation (Placement(transformation(extent={{70,-110},{50,-90}})));
  Modelica.Blocks.Sources.Constant const3(
                                         k=-500)
    annotation (Placement(transformation(extent={{110,-110},{90,-90}})));
  Clutch.Clutch_Fault clutch_Fault2(
    useNormalModel=false,
    parm_stiffness_gain_large=10,
    parm_stiffness_gain_small=10)
    annotation (Placement(transformation(extent={{-30,-118},{-10,-98}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia8(
                                                           J=1)
    annotation (Placement(transformation(extent={{-70,-220},{-50,-200}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia9(J=9)
    annotation (Placement(transformation(extent={{10,-220},{30,-200}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque4(
      tau_constant=20)
    annotation (Placement(transformation(extent={{-110,-220},{-90,-200}})));
  Modelica.Mechanics.Translational.Components.Mass mass4(
                                                        m=0.01)
    annotation (Placement(transformation(extent={{10,-190},{30,-170}})));
  Modelica.Mechanics.Translational.Sources.Force force4
    annotation (Placement(transformation(extent={{70,-190},{50,-170}})));
  Modelica.Blocks.Sources.Constant const4(
                                         k=-500)
    annotation (Placement(transformation(extent={{110,-190},{90,-170}})));
  Clutch.Clutch_Fault clutch_Fault3(
    useNormalModel=false,
    parm_stiffness_gain_large=10,
    parm_stiffness_gain_small=10)
    annotation (Placement(transformation(extent={{-30,-198},{-10,-178}})));
    model Fault_1
      extends TDL_v1.Templates.FaultMonitor.Base;
    end Fault_1;

    model Fault_2
      extends TDL_v1.Templates.FaultMonitor.Base;
    end Fault_2;

    model Fault_3
      extends TDL_v1.Templates.FaultMonitor.Base;
    end Fault_3;

    model Fault_4
      extends TDL_v1.Templates.FaultMonitor.Base;
    end Fault_4;
  Fault_1 fault_1_1
    annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  Fault_2 fault_2_1
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Fault_3 fault_3_1 annotation (Placement(transformation(extent={{-100,
            -100},{-80,-80}})));
  Fault_4 fault_4_1 annotation (Placement(transformation(extent={{-100,
            -180},{-80,-160}})));
equation
  connect(constantTorque.flange,inertia. flange_a) annotation (Line(
      points={{-90,40},{-70,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(force.flange,mass. flange_b) annotation (Line(
      points={{50,70},{30,70}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault.Actuator_Flange, mass.flange_a) annotation (Line(
      points={{-10,70},{10,70}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault.Transmission_Flange, inertia1.flange_a) annotation (Line(
      points={{-10,54},{0,54},{0,40},{10,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch_Fault.Engine_Flange, inertia.flange_b) annotation (Line(
      points={{-30,54},{-40,54},{-40,40},{-50,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const.y, force.f) annotation (Line(
      points={{89,70},{72,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(force1.flange, mass1.flange_b) annotation (Line(
      points={{50,150},{30,150}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(const1.y, force1.f) annotation (Line(
      points={{89,150},{72,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(constantTorque1.flange, inertia2.flange_a) annotation (Line(
      points={{-90,120},{-70,120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Actuator_Flange, mass1.flange_a) annotation (Line(
      points={{-8,150},{10,150}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch.Transmission_Flange, inertia3.flange_a) annotation (Line(
      points={{-8,134},{0,134},{0,120},{10,120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Engine_Flange, inertia2.flange_b) annotation (Line(
      points={{-28,134},{-40,134},{-40,120},{-50,120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constantTorque2.flange, inertia4.flange_a) annotation (Line(
      points={{-90,-50},{-70,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(force2.flange, mass2.flange_b) annotation (Line(
      points={{50,-20},{30,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault1.Actuator_Flange, mass2.flange_a) annotation (Line(
      points={{-10,-20},{10,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault1.Transmission_Flange, inertia5.flange_a) annotation (
      Line(
      points={{-10,-36},{0,-36},{0,-50},{10,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch_Fault1.Engine_Flange, inertia4.flange_b) annotation (Line(
      points={{-30,-36},{-40,-36},{-40,-50},{-50,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const2.y, force2.f) annotation (Line(
      points={{89,-20},{72,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(constantTorque3.flange, inertia6.flange_a) annotation (Line(
      points={{-90,-130},{-70,-130}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(force3.flange, mass3.flange_b) annotation (Line(
      points={{50,-100},{30,-100}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault2.Actuator_Flange, mass3.flange_a) annotation (Line(
      points={{-10,-100},{10,-100}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault2.Transmission_Flange, inertia7.flange_a) annotation (
      Line(
      points={{-10,-116},{0,-116},{0,-130},{10,-130}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch_Fault2.Engine_Flange, inertia6.flange_b) annotation (Line(
      points={{-30,-116},{-40,-116},{-40,-130},{-50,-130}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const3.y, force3.f) annotation (Line(
      points={{89,-100},{72,-100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(constantTorque4.flange, inertia8.flange_a) annotation (Line(
      points={{-90,-210},{-70,-210}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(force4.flange, mass4.flange_b) annotation (Line(
      points={{50,-180},{30,-180}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault3.Actuator_Flange, mass4.flange_a) annotation (Line(
      points={{-10,-180},{10,-180}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(clutch_Fault3.Transmission_Flange, inertia9.flange_a) annotation (
      Line(
      points={{-10,-196},{0,-196},{0,-210},{10,-210}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch_Fault3.Engine_Flange, inertia8.flange_b) annotation (Line(
      points={{-30,-196},{-40,-196},{-40,-210},{-50,-210}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const4.y, force4.f) annotation (Line(
      points={{89,-180},{72,-180}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fault_1_1.faultBus, clutch_Fault.faultBus) annotation (Line(
      points={{-80,80},{-20,80},{-20,72}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fault_2_1.faultBus, clutch_Fault1.faultBus) annotation (Line(
      points={{-80,0},{-20,0},{-20,-18}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fault_3_1.faultBus, clutch_Fault2.faultBus) annotation (Line(
      points={{-80,-90},{-20,-90},{-20,-98}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fault_4_1.faultBus, clutch_Fault3.faultBus) annotation (Line(
      points={{-80,-170},{-20,-170},{-20,-178}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -240},{140,180}}), graphics), Icon(coordinateSystem(extent={{-140,-240},
            {140,180}})));
end test_Clutch_Fault;
