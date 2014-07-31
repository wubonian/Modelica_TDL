within TDL_v1.BasicComponents.Endstop.Rotational;
model Rotational_ElasticEndstop
  import SI = Modelica.SIunits;
  extends
    Endstop.Internal_Layer_Middle.Internal_Layer_Low.Internal_ElasticEndstop(
   redeclare parameter SI.Angle gap,redeclare parameter SI.Angle gap_L,redeclare parameter SI.Angle gap_R,
  redeclare parameter SI.RotationalSpringConstant c,redeclare parameter
      SI.RotationalDampingConstant d,redeclare SI.Angle distance,redeclare
      SI.AngularVelocity speed,redeclare SI.Torque react);

  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  distance=flange_a.phi-flange_b.phi;
  speed=der(distance);
  flange_a.tau=react;
  flange_b.tau=-react;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end Rotational_ElasticEndstop;
