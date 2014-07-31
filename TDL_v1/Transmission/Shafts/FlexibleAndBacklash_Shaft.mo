within TDL_v1.Transmission.Shafts;
model FlexibleAndBacklash_Shaft
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation
  connect(inertia.flange_b, elastoBacklash.flange_a) annotation (Line(
      points={{-40,0},{-8,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(elastoBacklash.flange_b, inertia1.flange_a) annotation (Line(
      points={{12,0},{40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia1.flange_b, flange_b) annotation (Line(
      points={{60,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_a, flange_a) annotation (Line(
      points={{-60,0},{-80,0},{-80,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (                                 Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end FlexibleAndBacklash_Shaft;
