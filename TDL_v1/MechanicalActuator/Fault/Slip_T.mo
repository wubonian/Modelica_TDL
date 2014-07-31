within TDL_v1.MechanicalActuator.Fault;
model Slip_T
  extends TDL_v1.Fault.FaultTemplate(final FaultNumber=1, DTCNumber={1});
  extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;
  parameter Real parm_slip_ratio(final min=0,final max=1)=0;
  parameter Modelica.SIunits.Force f_max=1000;
  BasicComponents.Friction.Translational.Translational_ContinuousCoulombFriction
    friction(
    parm_mue=1,
    parm_cgeo=1,
    parm_v_limit=0.01)
             annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  friction.f_input=if DTC[1].DTC_Active then (1-parm_slip_ratio)*f_max else f_max;
  connect(flange_a, friction.flange_a) annotation (Line(
      points={{-100,0},{-10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(friction.flange_b, flange_b) annotation (Line(
      points={{10,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Slip_T;
