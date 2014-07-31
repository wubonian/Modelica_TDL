within TDL_v1.MechanicalActuator.Cam;
model Ideal_Cam2
  extends
    BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D_normal_der;
  import SI = Modelica.SIunits;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_cam
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_follower
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  parameter Real parm_slope=0.0005;
  //Real power;
  Real power1;
  Real power2;
  parameter SI.TranslationalSpringConstant c=1e7;
  parameter SI.TranslationalDampingConstant d=1e3;
//protected
  SI.AngularVelocity w;
  SI.Velocity v;
  Real gain(start=1);
  SI.Torque tau;
  SI.Force f;
  //Real sa;
equation
  flange_cam.tau=tau;
  flange_follower.f=f;
  w=der(flange_cam.phi);
  v=der(flange_follower.s);
  u=flange_cam.phi;
  u_der=noEvent(if w>=0 then 0.001 else -0.001);
  gain=y_der/u_der;
  f=-c*(y-flange_follower.s)-d*(w*gain-v);
  tau=-gain*f;
  power1=f*v;
  power2=tau*w;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Ideal_Cam2;
