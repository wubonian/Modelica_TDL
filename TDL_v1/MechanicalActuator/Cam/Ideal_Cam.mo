within TDL_v1.MechanicalActuator.Cam;
model Ideal_Cam
  extends
    BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D_der;
  import SI = Modelica.SIunits;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_cam
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_follower
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  parameter Real parm_slope=0.0005;
  Real power;
protected
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
  v=gain*w;
  tau=noEvent(if abs(gain)<0.001 then 0 else gain*f);
  //sa=y_der/u_der;
  //gain=smooth(1,noEvent(if sa>parm_slope or sa<-parm_slope then sa elseif sa<=parm_slope and sa>=0 then parm_slope else -parm_slope));
  //tau=-gain*f;
  //v=gain*w;
  power=tau*w;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Ideal_Cam;
