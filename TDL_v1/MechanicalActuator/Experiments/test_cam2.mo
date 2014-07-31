within TDL_v1.MechanicalActuator.Experiments;
model test_cam2

  MechanicalActuator.Cam.Ideal_Cam2 ideal_Cam(
    tableOnFile=true,
    tableName="select_12",
    fileName="D:/Library_Update/TDL_Workspace/Cam/cam.mat")
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=1)
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(
      tau_constant=10)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(mass.flange_b, ideal_Cam.flange_follower) annotation (Line(
      points={{40,0},{20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(inertia.flange_a, ideal_Cam.flange_cam) annotation (Line(
      points={{-20,0},{0,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constantTorque.flange, inertia.flange_b) annotation (Line(
      points={{-60,0},{-40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}), graphics));
end test_cam2;
