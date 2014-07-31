within TDL_v1.BasicComponents.Endstop.Translational;
model Translational_RigidEndstop
  import SI = Modelica.SIunits;
  extends
    Endstop.Internal_Layer_Middle.Internal_Layer_Low.Internal_ElasticEndstop(
   redeclare parameter SI.Position gap,redeclare parameter SI.Position gap_L,redeclare parameter
      SI.Position                                                                                            gap_R,
  redeclare parameter SI.TranslationalSpringConstant c,redeclare parameter
      SI.TranslationalDampingConstant d,redeclare SI.Position distance,redeclare
      SI.Velocity speed,redeclare SI.Force react);
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialOneFlangeAndSupport;
equation
  distance=flange.s-internalSupport.s;
  speed=der(distance);
  flange.f=react;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=0.5)}));
end Translational_RigidEndstop;
