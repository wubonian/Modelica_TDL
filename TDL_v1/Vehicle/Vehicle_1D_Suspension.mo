within TDL_v1.Vehicle;
model Vehicle_1D_Suspension
  import SI = Modelica.SIunits;
  extends Modelica.Mechanics.Translational.Interfaces.PartialFriction;
  parameter SI.Length wheelbase=2.5 "Wheelbase"
    annotation (Dialog(group="Geometry"));
  parameter SI.Length heightCoG=0.6 "Height of the centre of gravity"
                                      annotation (Dialog(group="Geometry"));

  parameter SI.Mass massFrontAxle=900
    "Mass on front axle (includes sprung and unsprung mass)"
    annotation (Dialog(group="Mass and Inertia"));
  parameter SI.Mass massRearAxle=600
    "Mass on rear axle (includes sprung and unsprung mass)"
    annotation (Dialog(group="Mass and Inertia"));
  parameter SI.Mass unSprungMass=90 "Unsprung mass per wheel"
    annotation (Dialog(group="Mass and Inertia"));
  parameter SI.Inertia pitchInertia=2500 "Body pitch inertia"
    annotation (Dialog(group="Mass and Inertia"));

  parameter SI.TranslationalSpringConstant wheelRateFront=10000
    "Suspension effective wheel rate for front axle"
    annotation (Dialog(group="Suspension"));
  parameter SI.TranslationalDampingConstant wheelDampingFront=634
    "Suspension effective damping rate for front axle"
    annotation (Dialog(group="Suspension"));
  parameter SI.TranslationalSpringConstant wheelRateRear=8000
    "Suspension effective wheel rate for rear axle"
    annotation (Dialog(group="Suspension"));
  parameter SI.TranslationalDampingConstant wheelDampingRear=634
    "Suspension effective damping rate for rear axle"
    annotation (Dialog(group="Suspension"));
  parameter SI.Force a=150 "Static coefficient";
  parameter Real b(unit="kg/s")=1 "Speed dependant coefficient";
  parameter Real c(unit="kg/m")=0.1 "Speed squared coefficient";

  final parameter SI.Mass mass=massFrontAxle + massRearAxle "Vehicle mass";
  final parameter SI.Distance frontAxle2CoG=wheelbase - ((massFrontAxle - 2*unSprungMass)*wheelbase)/(mass - 4*unSprungMass)
    "Distance from front axle to CoG";
  final parameter SI.Distance rearAxle2CoG=wheelbase - frontAxle2CoG
    "Distance from rear axle to CoG";
  final parameter SI.Distance frontSpringLength=((massFrontAxle - 2*unSprungMass)*Modelica.Constants.g_n)/(2*wheelRateFront) + heightCoG
    "Used to calculate front suspension force";
  final parameter SI.Distance rearSpringLength=((massRearAxle - 2*unSprungMass)*Modelica.Constants.g_n)/(2*wheelRateRear) + heightCoG
    "Used to calculate rear suspension force";

  Modelica.Mechanics.Translational.Interfaces.Flange_a chassis
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput slope_resistance
    annotation (Placement(transformation(extent={{110,-10},{90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a frontAxle_right
    annotation (Placement(transformation(extent={{-86,86},{-66,106}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a frontAxle_left
    annotation (Placement(transformation(extent={{-86,-106},{-66,-86}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a rearAxle_right
    annotation (Placement(transformation(extent={{66,86},{86,106}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a rearAxle_left
    annotation (Placement(transformation(extent={{66,-106},{86,-86}})));
protected
  SI.Length height_f "Height of CoG above front axle";
  SI.Length height_r "Height of CoG above rear axle";
  SI.Length height_cog "Height of CoG";
  SI.Angle pitch(start=0) "Angle of pitch of body";
  SI.Force F_front "Force acting vertically on front axle due to sprung mass";
  SI.Force F_rear "Force acting vertically on rear axle due to sprung mass";

  SI.Velocity v_z "Vertical velocity of body";
  SI.Acceleration a_z "Vertical acceleration of body";
  SI.AngularVelocity pitchrate "Pitch rate of body";

  SI.Force fDrag;
  SI.Force f;
equation
  v_z=der(height_cog);
  a_z=der(v_z);
  pitchrate=der(pitch);
  v_relfric=der(chassis.s);
  a_relfric=der(v_relfric);

  height_f = height_cog + sin(pitch)*frontAxle2CoG;
  height_r = height_cog - sin(pitch)*rearAxle2CoG;

  F_front = 2*wheelRateFront*(frontSpringLength - height_f) - 2*wheelDampingFront*der(height_f);
  F_rear = 2*wheelRateRear*(rearSpringLength - height_r) - 2*wheelDampingRear*der(height_r);

  (mass-4*unSprungMass)*a_z=F_front+F_rear-(mass-4*unSprungMass)*Modelica.Constants.g_n;
  pitchInertia*der(pitchrate) = frontAxle2CoG*cos(pitch)*F_front - rearAxle2CoG*cos(pitch)*F_rear + (chassis.f  - f)*height_cog;
  mass*a_relfric=chassis.f-f;

  rearAxle_left.f = -(F_rear + 2*unSprungMass*Modelica.Constants.g_n)/2;
  rearAxle_right.f = -(F_rear + 2*unSprungMass*Modelica.Constants.g_n)/2;
  frontAxle_left.f = -(F_front + 2*unSprungMass*Modelica.Constants.g_n)/2;
  frontAxle_right.f = -(F_front + 2*unSprungMass*Modelica.Constants.g_n)/2;

  fDrag = a + b*abs(v_relfric) + c*v_relfric^2 + slope_resistance;
  f = if locked then sa*unitForce else
     (if startForward then          fDrag else
      if startBackward then        -fDrag else
      if pre(mode) == Forward then  fDrag else
                                   -fDrag);
  f0 = fDrag;
  f0_max = fDrag;
  free = false;

initial equation
  height_cog = heightCoG;
  v_z = 0;
  pitch=0;
  pitchrate = 0;
end Vehicle_1D_Suspension;
