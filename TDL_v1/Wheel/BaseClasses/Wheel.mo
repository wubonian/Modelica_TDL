within TDL_v1.Wheel.BaseClasses;
partial model Wheel "Base class for wheel"

  Modelica.Mechanics.Rotational.Interfaces.Flange_a hubFlange "Hub flange"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=
           0)));
  Modelica.Mechanics.Translational.Interfaces.Flange_b roadFlange "Road flange"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=
           0)));

end Wheel;
