within TDL_v1.Electricity.Experiments;
model experiment_DCPM_Fault

  Machines.DCMachines.DCPM_Fault dCPM_Fault(useNormalModel=false, debugLocal=false)
    annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  model FaultTrigger
    extends TDL_v1.Templates.FaultMonitor.Base;
  end FaultTrigger;
  FaultTrigger faultTrigger
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-30,-20})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(extent={{10,-30},{-10,-10}})));
equation
  connect(faultTrigger.faultBus, dCPM_Fault.faultBus) annotation (Line(
      points={{-60,-40},{0,-40},{0,-60}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(ground.p, signalVoltage.n) annotation (Line(
      points={{-20,-20},{-10,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(signalVoltage.p, dCPM_Fault.pin_ap) annotation (Line(
      points={{10,-20},{10,-60.3333},{6,-60.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(signalVoltage.n, dCPM_Fault.pin_an) annotation (Line(
      points={{-10,-20},{-10,-60},{-6,-60},{-6,-60.3333}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}}), graphics));
end experiment_DCPM_Fault;
