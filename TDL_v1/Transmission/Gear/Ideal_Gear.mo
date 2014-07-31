within TDL_v1.Transmission.Gear;
model Ideal_Gear
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
  parameter Real i;
equation
  flange_a.tau*i=flange_b.tau;
  flange_a.phi=-i*flange_b.phi;
end Ideal_Gear;
