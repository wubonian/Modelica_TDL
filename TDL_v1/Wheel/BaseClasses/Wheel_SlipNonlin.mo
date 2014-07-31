within TDL_v1.Wheel.BaseClasses;
partial model Wheel_SlipNonlin
  "Base class for wheel model with nonlinear slip (without force calculation)"
  import SI = Modelica.SIunits;
  extends BaseClasses.Wheel_Slip;

protected
  SI.Force Fz;
public
  Modelica.Mechanics.Translational.Interfaces.Flange_b carrierFlange
    annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
equation
  Fz = carrierFlange.f;
  annotation (Documentation(info="<html>
<p>This class is based on a class for a nonlinear tire slip calculation.
Additionally to that base class, the vertical tire load force&nbsp;<code>Fz</code>
is defined here. It depends either on the force from the 1D connector <code>carrierFlange</code> which 
should be connected to the vehicle body or - 
if the connector is not connected from the outside - on the predefined constant wheel load
mass <code>load_z</code>.
Compared to <a href=\"Modelica://PowerTrain.Chassis.Wheels.BaseClasses.Wheel_Slip\">wheel slip base class</a> the vertical tire force is nonlinear and depends on chassis load. 
</p>
</html>"));
end Wheel_SlipNonlin;
