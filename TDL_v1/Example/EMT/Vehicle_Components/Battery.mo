within TDL_v1.Example.EMT.Vehicle_Components;
model Battery
  extends TDL_v1.Templates.EnergyStorage.Base;

  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{90,70},{110,90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=
        336) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={40,0})));
  Controllers.BMS bMS annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,50})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{0,40},{-20,60}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{30,-100},{50,-80}})));
equation
  connect(constantVoltage.p, pin_p) annotation (Line(
      points={{40,20},{40,80},{100,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantVoltage.n, pin_n) annotation (Line(
      points={{40,-20},{40,-80},{100,-80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bMS.messageBus, messageBus) annotation (Line(
      points={{-60,50},{-80,50},{-80,100}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(const.y, bMS.SOC) annotation (Line(
      points={{-21,50},{-40,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(constantVoltage.n, ground.p) annotation (Line(
      points={{40,-20},{40,-80}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Battery;
