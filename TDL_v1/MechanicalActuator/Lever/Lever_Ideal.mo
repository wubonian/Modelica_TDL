within TDL_v1.MechanicalActuator.Lever;
model Lever_Ideal
  parameter Real length_a=0.1535;
  parameter Real length_b=0.0624;
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  flange_a.f*length_a=flange_b.f*length_b;
  flange_a.s/length_a=-flange_b.s/length_b;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Lever_Ideal;
