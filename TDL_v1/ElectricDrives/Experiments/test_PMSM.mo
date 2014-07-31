within TDL_v1.ElectricDrives.Experiments;
model test_PMSM
  PMSM pMSM
    annotation (Placement(transformation(extent={{-20,-20},{40,20}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=336)
             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-52,-30})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.5)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Sources.Constant const(k=-30)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant const1(k=2000)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Constant const2(k=2)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
equation
  connect(constantVoltage.p, pMSM.pin_p) annotation (Line(
      points={{-52,-20},{-52,-6},{-19,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantVoltage.n, pMSM.pin_n) annotation (Line(
      points={{-52,-40},{-19,-40},{-19,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantVoltage.n, ground.p) annotation (Line(
      points={{-52,-40},{-50,-40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(inertia.flange_a, pMSM.flange_a) annotation (Line(
      points={{60,0},{40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pMSM.Torque_Require, const.y) annotation (Line(
      points={{-20,18},{-26,18},{-26,70},{-59,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, pMSM.Speed_Require) annotation (Line(
      points={{-59,30},{-40,30},{-40,6},{-20,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM.Direction, const2.y) annotation (Line(
      points={{-20,0},{-46,0},{-46,10},{-59,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, pMSM.Torque_Or_Speed) annotation (Line(
      points={{-59,10},{-40,10},{-40,12},{-20,12}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),        graphics));
end test_PMSM;
