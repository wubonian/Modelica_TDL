within TDL_v1.Vehicle;
model Vehicle_1D_Continuous
  import SI = Modelica.SIunits;
  parameter SI.Mass mass=1500 "Vehicle mass";
  parameter SI.Force a=150 "Static coefficient";
  parameter Real b(unit="kg/s")=1 "Speed dependant coefficient";
  parameter Real c(unit="kg/m")=0.1 "Speed squared coefficient";
  parameter SI.Velocity v_limit=0.005;
  SI.Force fDrag;
  SI.Force f;
  SI.Velocity v_relfric;
  SI.Acceleration a_relfric;
  Modelica.Mechanics.Translational.Interfaces.Flange_a chassis
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput slope_resistance
    annotation (Placement(transformation(extent={{110,-10},{90,10}})));
equation
  fDrag = a + b*abs(v_relfric) + c*v_relfric^2 + slope_resistance;

  f = tanh(v_relfric/v_limit)*fDrag;

  v_relfric=der(chassis.s);
  a_relfric=der(v_relfric);

  mass*a_relfric=chassis.f-f;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Vehicle_1D_Continuous;
