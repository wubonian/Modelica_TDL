within TDL_v1.Transmission.Experiments;
model test_Clutch
  TDL_v1.Transmission.Clutch.Clutch clutch(diaphragm_spring(fileName_large_edge
        ="D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat",
        fileName_small_edge=
          "D:/Library_Update/TDL_Workspace/Clutch/diaphragm_spring.mat"))
    annotation (Placement(transformation(extent={{0,-2},{20,18}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=9)
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(
      tau_constant=20)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01)
    annotation (Placement(transformation(extent={{40,10},{60,30}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Blocks.Sources.Constant const(k=-500)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
equation
  connect(inertia.flange_b, clutch.Engine_Flange) annotation (Line(
      points={{-20,-10},{-16,-10},{-16,0},{0,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(clutch.Transmission_Flange, inertia1.flange_a) annotation (Line(
      points={{20,0},{30,0},{30,-10},{40,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constantTorque.flange, inertia.flange_a) annotation (Line(
      points={{-60,-10},{-40,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(mass.flange_a, clutch.Actuator_Flange) annotation (Line(
      points={{40,20},{30,20},{30,16},{20,16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(force.flange, mass.flange_b) annotation (Line(
      points={{20,50},{76,50},{76,20},{60,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(const.y, force.f) annotation (Line(
      points={{-19,50},{-2,50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (                                 Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end test_Clutch;
