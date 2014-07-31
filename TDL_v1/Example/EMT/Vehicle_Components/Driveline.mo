within TDL_v1.Example.EMT.Vehicle_Components;
model Driveline
  import TDL_Version2 = TDL_v1;
  extends TDL_Version2.Templates.Drivelines.TwoAxleBase(
   final usingMultiBodyChassis=false, final usingMultiBodyTransmission=false, final usingMount=false);

  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(
      tau_constant=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,50})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque1(
      tau_constant=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={60,-50})));
  Modelica.Mechanics.Rotational.Components.IdealPlanetary idealPlanetary(ratio=
        1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,20})));
equation
  connect(constantTorque.flange, wheelHub_4.flange) annotation (Line(
      points={{60,60},{60,100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constantTorque1.flange, wheelHub_3.flange) annotation (Line(
      points={{60,-60},{60,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealPlanetary.ring, wheelHub_2.flange) annotation (Line(
      points={{-60,30},{-60,100},{-60,100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealPlanetary.sun, wheelHub_1.flange) annotation (Line(
      points={{-60,10},{-60,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealPlanetary.carrier, transmissionFlange.flange)
    annotation (Line(
      points={{-64,10},{-64,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Driveline;
