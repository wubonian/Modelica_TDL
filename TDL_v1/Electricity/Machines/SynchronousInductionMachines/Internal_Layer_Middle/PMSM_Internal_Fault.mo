within TDL_v1.Electricity.Machines.SynchronousInductionMachines.Internal_Layer_Middle;
partial model PMSM_Internal_Fault
  // fault generator component is replaceable
  extends Modelica.Electrical.Machines.Icons.TransientMachine;
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;
  //-----------------------general parameters-----------------------------------
  final parameter Integer m=3 "Number of phases";
  parameter Integer p=4 "Number of pole pairs (Integer)";
  parameter SI.Inertia J_rotor=0.011 "Rotor's moment of inertia";
  parameter SI.Inertia J_stator=0.1 "Stator's moment of inertia" annotation(Dialog(enable=useSupport));
  parameter Boolean useSupport=false;
  parameter Boolean useThermalPort=false;
  parameter SI.Frequency fsNominal=50;
  //-----------------------normal parameters------------------------------------
  parameter Modelica.SIunits.Resistance Rs=8.25e-3
    "Stator resistance per phase at TRef"
     annotation(Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Temperature TsRef=293.15
    "Reference temperature of stator resistance"
     annotation(Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
                                                                                alpha20s=0
    "Temperature coefficient of stator resistance at 20 degC"
     annotation(Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lmd=3.42e-4
    "Stator main field inductance in d-axis"
     annotation(Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lmq=7.1e-4
    "Stator main field inductance in q-axis"
     annotation(Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lszero=0
    "Stator zero sequence inductance"
     annotation(Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lssigma=0 "Stator stray inductance"
     annotation(Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.MagneticFlux psi_Normal=0.0703
    "Normal flux of permanent magnet"
     annotation(Dialog(tab="Nominal resistances and inductances"));

  //-----------------------damper cage parameters-------------------------------
  parameter Boolean useDamperCage=false "Enable / disable damper cage"
    annotation(Evaluate=true, Dialog(tab="Nominal resistances and inductances", group = "DamperCage"));
  parameter Modelica.SIunits.Inductance Lrsigmad=0
    "Damper stray inductance in d-axis"
    annotation(Dialog(tab="Nominal resistances and inductances", group = "DamperCage", enable = useDamperCage));
  parameter Modelica.SIunits.Inductance Lrsigmaq=0
    "Damper stray inductance in q-axis"
    annotation(Dialog(tab="Nominal resistances and inductances", group = "DamperCage", enable = useDamperCage));
  parameter Modelica.SIunits.Resistance Rrd=0.05
    "Damper resistance in d-axis at TRef"
    annotation(Dialog(tab="Nominal resistances and inductances", group = "DamperCage", enable = useDamperCage));
  parameter Modelica.SIunits.Resistance Rrq=0.05
    "Damper resistance in q-axis at TRef"
    annotation(Dialog(tab="Nominal resistances and inductances", group = "DamperCage", enable = useDamperCage));
  parameter Modelica.SIunits.Temperature TrRef=293.15
    "Reference temperature of damper resistances in d- and q-axis"
    annotation(Dialog(tab="Nominal resistances and inductances", group = "DamperCage", enable = useDamperCage));
  parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
                                                                                alpha20r=0
    "Temperature coefficient of damper resistances in d- and q-axis"
    annotation(Dialog(tab="Nominal resistances and inductances", group = "DamperCage", enable = useDamperCage));
  //-----------------------loss parameters--------------------------------------
  parameter Boolean loss_on=false annotation(Dialog(tab="Loss Parameters"));
  parameter Modelica.Electrical.Machines.Losses.FrictionParameters frictionParameters(PRef=0,final wRef=2*pi*fsNominal/p,final power_w=2) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  parameter Modelica.Electrical.Machines.Losses.StrayLoadParameters strayLoadParameters(PRef=0,IRef=100,final wRef=2*pi*fsNominal/p,final power_w=1) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  parameter Modelica.Electrical.Machines.Losses.CoreParameters statorCoreParameters(final m=3,PRef=0,VRef=100,final wRef=2*pi*fsNominal/p) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  parameter Modelica.Electrical.Machines.Losses.PermanentMagnetLossParameters permanentMagnetLossParameters(PRef=0,final c=0,IRef=100,final power_I=2,final wRef=2*pi*fsNominal/p,final power_w=1) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  //-----------------------mechanical Components--------------------------------
  Modelica.Mechanics.Rotational.Components.Inertia inertiaRotor(J=J_rotor)
    annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed if not useSupport
    annotation (Placement(transformation(extent={{30,-104},{50,-84}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertiaStator(J=J_stator) if useSupport
    annotation (Placement(transformation(extent={{78,-90},{58,-70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a support if useSupport
    annotation (Placement(transformation(extent={{86,-90},{106,-70}})));
  //-----------------------electrical Components--------------------------------
  TDL_v1.Electricity.BasicComponents.ThreePhaseConnection threePhaseConnection
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_sp
    annotation (Placement(transformation(extent={{50,88},{70,108}})));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_sn
    annotation (Placement(transformation(extent={{-70,86},{-50,106}})));
  Modelica.Electrical.MultiPhase.Basic.Resistor rs(useHeatPort=true, m=m,
    R=fill(Rs, m),
    T_ref=fill(TsRef, m),
    alpha=fill(alpha20s, m))
    annotation (Placement(transformation(extent={{40,60},{20,80}})));
  Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasorS(
     turnsRatio=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-30,60})));
  Modelica.Electrical.Analog.Basic.Inductor lszero(L=Lszero)
    annotation (Placement(transformation(extent={{-30,30},{-50,50}})));    // zero sequence inductance
  Modelica.Electrical.Machines.BasicMachines.Components.AirGapR airGapR(
    Lmd=Lmd,
    Lmq=Lmq,
    m=m,
    p=p)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={2,0})));
  Modelica.Electrical.Machines.BasicMachines.Components.DamperCage damperCage(
      useHeatPort=true,
    Lrsigmad=Lrsigmad,
    Lrsigmaq=Lrsigmaq,
    Rrd=Rrd,
    Rrq=Rrq,
    T_ref=TrRef,
    alpha=alpha20r) if useDamperCage
    annotation (Placement(transformation(extent={{0,-60},{-20,-40}})));
  TDL_v1.BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction
    rotational_Continuous_Friction_Tanh(parm_mue=1, parm_w_limit=1e-4)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={70,-50})));
  Modelica.Electrical.Machines.Thermal.SynchronousInductionMachines.ThermalAmbientSMPM
    thermalAmbient(useDamperCage=useDamperCage,
    m=m,
    useTemperatureInputs=false,
    Ts=TsRef,
    Tpm=TrRef,
    Tr=TrRef) if not useThermalPort     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,-74})));
  Modelica.Electrical.Machines.Interfaces.InductionMachines.ThermalPortSMPM thermalPort(
      useDamperCage=useDamperCage, m=m) if useThermalPort
    annotation (Placement(transformation(extent={{-50,-104},{-30,-84}})));
  TDL_v1.Electricity.BasicComponents.PermanentMagnet permanentMagnetFaultInjection(
    m=m,
    permanentMagnetLossParameters=permanentMagnetLossParameters,
    useHeatPort=true,
    is=plug_sp.pin.i)
    annotation (Placement(transformation(extent={{20,-42},{40,-22}})));
  //-----------------------loss Components--------------------------------------
  Modelica.Electrical.Machines.Losses.Friction friction(useHeatPort=true,
      frictionParameters=frictionParameters)
    annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Modelica.Electrical.Machines.Losses.InductionMachines.StrayLoad strayLoad(
      useHeatPort=true,
    m=m,
    strayLoadParameters=strayLoadParameters)
    annotation (Placement(transformation(extent={{70,60},{50,80}})));
  Modelica.Electrical.Machines.BasicMachines.Components.Inductor lssigma(L=fill(
        Lssigma, 2))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,30})));  // magnetic leakage
  Modelica.Electrical.Machines.Losses.InductionMachines.Core statorCore(
      useHeatPort=true, w=statorCoreParameters.wRef,
    turnsRatio=1,
    coreParameters=statorCoreParameters)
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  //-----------------------fault Components-------------------------------------

  //-----------------------internal Components----------------------------------
protected
  parameter SI.Current Ie_Normal=psi_Normal/Lmd;
  Modelica.Mechanics.Rotational.Interfaces.Support internalSupport
    annotation (Placement(transformation(extent={{30,-90},{50,-70}})));
  Modelica.Electrical.Machines.Interfaces.InductionMachines.ThermalPortSMPM internalThermalPort(
      useDamperCage=useDamperCage, m=m)
    annotation (Placement(transformation(extent={{-50,-84},{-30,-64}})));
equation
  connect(inertiaStator.flange_a, support) annotation (Line(
      points={{78,-80},{96,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertiaRotor.flange_a, flange) annotation (Line(
      points={{60,0},{96,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(plug_sp, plug_sp) annotation (Line(
      points={{60,98},{60,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(plug_sp, strayLoad.plug_p) annotation (Line(
      points={{60,98},{60,86},{80,86},{80,70},{70,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(rs.plug_p, strayLoad.plug_n) annotation (Line(
      points={{40,70},{50,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(threePhaseConnection.positivePlug, rs.plug_n) annotation (Line(
      points={{9.6,70},{20,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(spacePhasorS.plug_p, threePhaseConnection.negativePlug) annotation (
      Line(
      points={{-20,70},{-9.6,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(spacePhasorS.plug_n, plug_sn) annotation (Line(
      points={{-40,70},{-60,70},{-60,96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lszero.p, spacePhasorS.zero) annotation (Line(
      points={{-30,40},{-30,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lszero.n, spacePhasorS.ground) annotation (Line(
      points={{-50,40},{-50,50},{-40,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(spacePhasorS.spacePhasor, lssigma.spacePhasor_a) annotation (Line(
      points={{-20,50},{0,50},{0,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(statorCore.spacePhasor, spacePhasorS.spacePhasor) annotation (Line(
      points={{20,50},{-20,50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lssigma.spacePhasor_b, airGapR.spacePhasor_s) annotation (Line(
      points={{0,20},{12,20},{12,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(airGapR.flange, inertiaRotor.flange_b) annotation (Line(
      points={{12,0},{40,0}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
      points={{-60,-74},{-40,-74}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(internalThermalPort, thermalPort) annotation (Line(
      points={{-40,-74},{-40,-94}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(damperCage.heatPort, internalThermalPort.heatPortRotorWinding)
    annotation (Line(
      points={{-10,-60},{-10,-74},{-40,-74}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(friction.heatPort, internalThermalPort.heatPortFriction) annotation (
      Line(
      points={{80,-40},{80,-74},{-40,-74}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(statorCore.heatPort, internalThermalPort.heatPortStatorCore)
    annotation (Line(
      points={{20,40},{20,-74},{-40,-74}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(rs.heatPort, internalThermalPort.heatPortStatorWinding) annotation (
      Line(
      points={{30,60},{40,60},{40,-74},{-40,-74}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(strayLoad.heatPort, internalThermalPort.heatPortStrayLoad)
    annotation (Line(
      points={{70,60},{70,46},{60,46},{60,-74},{-40,-74}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(damperCage.spacePhasor_r, airGapR.spacePhasor_r) annotation (Line(
      points={{0,-40},{0,-22},{12,-22},{12,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(friction.support, internalSupport) annotation (Line(
      points={{90,-40},{90,-66},{40,-66},{40,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rotational_Continuous_Friction_Tanh.flange_b, internalSupport)
    annotation (Line(
      points={{70,-60},{70,-66},{40,-66},{40,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(strayLoad.support, internalSupport) annotation (Line(
      points={{60,60},{80,60},{80,-66},{40,-66},{40,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(airGapR.support, internalSupport) annotation (Line(
      points={{-8,0},{-20,0},{-20,-80},{40,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(internalSupport, fixed.flange) annotation (Line(
      points={{40,-80},{40,-94}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(internalSupport, inertiaStator.flange_b) annotation (Line(
      points={{40,-80},{58,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rotational_Continuous_Friction_Tanh.flange_a, inertiaRotor.flange_a)
    annotation (Line(
      points={{70,-40},{70,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(friction.flange, inertiaRotor.flange_a) annotation (Line(
      points={{90,-20},{90,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(strayLoad.flange, inertiaRotor.flange_a) annotation (Line(
      points={{60,80},{80,80},{80,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(permanentMagnetFaultInjection.spacePhasor_r, airGapR.spacePhasor_r)
    annotation (Line(
      points={{21,-22},{12,-22},{12,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(permanentMagnetFaultInjection.flange, inertiaRotor.flange_a)
    annotation (Line(
      points={{30,-22},{60,-22},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(permanentMagnetFaultInjection.support, internalSupport) annotation (
      Line(
      points={{30,-42},{30,-80},{40,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(permanentMagnetFaultInjection.heatPort, internalThermalPort.heatPortPermanentMagnet)
    annotation (Line(
      points={{20,-42},{20,-74},{-40,-74}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{-130,10},{-100,-10}},
          lineColor={0,0,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,10},{-70,-10}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(extent={{-134,34},{-66,-34}}, lineColor={0,0,255}),Line(points={{-50,100},{-20,100},{-20,70}}, color={0,0,255}),
                Line(points={{50,100},{20,100},{20,70}}, color={0,0,255})}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
                    graphics));
end PMSM_Internal_Fault;
