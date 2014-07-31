within TDL_v1.Wheel;
model LinearSlip "Tire model with linear force characteristics"
  extends BaseClasses.Wheel_Slip;
  import SI = Modelica.SIunits;
  parameter SI.Force stiffness=2000 "Slip stiffness (fDrive = stiffness*slip)";
equation
  fDrive = slip*stiffness;

  annotation (Documentation(info="<html>
<p>
A simple tire model where longitudinal force depends linearly on slip according to:
</p>
<pre>
   fDrive = slip * stiffness;
</pre>
<p>
The longitudinal force is applied on the 1D road connector.
</p>
</html>"));
end LinearSlip;
