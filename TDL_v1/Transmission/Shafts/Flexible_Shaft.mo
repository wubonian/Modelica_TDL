within TDL_v1.Transmission.Shafts;
model Flexible_Shaft
  parameter Integer n_ds(min=0) = 3
    "Discretization of shaft (number of spring-damper elements)";
  Modelica.Mechanics.Rotational.Components.Inertia
    inertia[n_ds + 1] annotation (Placement(
        transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper
    springDamper[n_ds] annotation (Placement(
        transformation(extent={{20,-10},{40,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a
    flange_a annotation (Placement(transformation(
          extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b
    flange_b annotation (Placement(transformation(
          extent={{90,-10},{110,10}})));
equation
  for i in 1:n_ds loop
    connect(springDamper[i].flange_a, inertia[i].flange_b)
      annotation (Line(points={{20,0},{-20,0}}, color={0,0,0}));
    connect(springDamper[i].flange_b, inertia[i + 1].flange_a) annotation (
        Line(points={{40,0},{50,0},{50,20},{-60,20},{-60,0},{-40,0}}, color={0,
            0,0}));
  end for;
  connect(inertia[n_ds + 1].flange_b, flange_b) annotation (Line(points={{-20,
          0},{0,0},{0,-20},{68,-20},{68,0},{100,0}}, color={0,0,0}));

  connect(flange_a, inertia[1].flange_a)
    annotation (Line(
      points={{-100,0},{-40,0}},
      color={0,0,0},
      smooth=Smooth.None));
   annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Flexible_Shaft;
