within TDL_v1.MechanicalActuator.Cam.Interfaces;
partial model Partial_Cam_Ideal
  // The limitation of this model is:
  // 1. It can't simulate the inner dynamic behavior of cam, so no loss is generated, and power flows through this element without loss
  // 2. The curve of cam must be represented as a analytical function, it can't be implemented in an look-up way. This is caused by
  //    Modelica can't get a derivation from value calculated by look-up table.
  // 3. Periodic curve hasn't been implemented because Modelica can't get a deriavation of expression containing mod(), floor() and so on.
  //    Have not found a alternative solution
  import Modelica.Constants.pi;
  import SI = Modelica.SIunits;
//  parameter Boolean periodic;
  parameter SI.Angle delta_phi=0.001;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_cam
    annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_follower
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
protected
  Real gain;    // the physical meaning is the slope gain k with respect to phi
  SI.Angle phi;
  SI.AngularVelocity w;
  SI.Position s;
  SI.Velocity v;
  Real input_P;  // input power
  Real output_P;  // output power
  // as this model is based on the conservation of energy, input_P and output_P are defined to check whether this rule has been obeyed
  SI.Angle phi_1;  // current phi with the range limitation from 0->2*pi
  SI.Angle phi_2;  // a delta_phi delay of phi with the range limitation from 0->2*pi
  Real s_delay;  // s calculated from a delay of phi;
equation
  // wrapper
  phi=flange_cam.phi;
  s=flange_follower.s;
  w=der(phi);
  v=gain*w;
  // dynamic equation
  flange_cam.tau=noEvent(if abs(gain)<0.001 then 0 else -gain*flange_follower.f);
  // inner computation
  phi_1=phi;//if periodic then phi-num_circle_1*2*pi else phi;
  phi_2=phi+delta_phi;//if periodic then phi+delta_phi-num_circle_2*2*pi else phi+delta_phi;
  gain=(s_delay-s)/delta_phi;
  // verification
  input_P=flange_cam.tau*w;
  output_P=-flange_follower.f*v;
  // need modify: update to the using curve function corresponding to phiend Partial_Cam_Ideal;

  //s=sin(phi_1);
  //s_delay=sin(phi_2);
end Partial_Cam_Ideal;
