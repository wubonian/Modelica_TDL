within TDL_v1.MechanicalActuator.Fault;
model Stuck_R
  extends TDL_v1.Fault.FaultTemplate(final FaultNumber=1, DTCNumber={1});
  parameter Modelica.SIunits.Force parm_stuck_force=1000;
  BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction
    friction(
    parm_mue=1,
    parm_cgeo=1,
    parm_w_limit=0.001)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  friction.f_input=if DTC[1].DTC_Active then parm_stuck_force else 0;
  connect(flange_a, friction.flange_a) annotation (Line(
      points={{-100,0},{-10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_b, friction.flange_b) annotation (Line(
      points={{100,0},{10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Stuck_R;
