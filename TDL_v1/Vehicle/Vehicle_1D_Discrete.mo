within TDL_v1.Vehicle;
model Vehicle_1D_Discrete
  import SI = Modelica.SIunits;
  extends Modelica.Mechanics.Translational.Interfaces.PartialFriction;
  parameter SI.Mass mass=1500 "Vehicle mass";
  parameter SI.Force a=150 "Static coefficient";
  parameter Real b(unit="kg/s")=1 "Speed dependant coefficient";
  parameter Real c(unit="kg/m")=0.1 "Speed squared coefficient";
  SI.Force fDrag;
  SI.Force f;
  Modelica.Mechanics.Translational.Interfaces.Flange_a chassis
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput slope_resistance
    annotation (Placement(transformation(extent={{110,-10},{90,10}})));
equation
  fDrag = a + b*abs(v_relfric) + c*v_relfric^2 + slope_resistance;

  f = if locked then sa*unitForce else
     (if startForward then          fDrag else
      if startBackward then        -fDrag else
      if pre(mode) == Forward then  fDrag else
                                   -fDrag);
  f0 = fDrag;
  f0_max = fDrag;
  free = false;

  v_relfric=der(chassis.s);
  a_relfric=der(v_relfric);

  mass*a_relfric=chassis.f-f;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Vehicle_1D_Discrete;
