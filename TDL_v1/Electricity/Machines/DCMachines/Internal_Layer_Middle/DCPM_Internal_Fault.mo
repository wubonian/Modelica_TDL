within TDL_v1.Electricity.Machines.DCMachines.Internal_Layer_Middle;
partial model DCPM_Internal_Fault
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;
  import Modelica.Electrical.Machines.Losses;
  extends Modelica.Electrical.Machines.Icons.TransientMachine;
  //------------------------Normal Parameters-----------------------------------
  parameter SI.Temperature T_normal=293.15 "Normal working temperature";
  parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
                                                                                      alpha20a=0;
  parameter SI.Voltage VaNominal=12;
  parameter SI.Current IaNominal=17.9632;
  parameter SI.AngularVelocity wNominal=2500/60*2*pi;
  parameter SI.Temperature TaNominal=T_normal;
  final parameter SI.Voltage ViNominal=VaNominal-Modelica.Electrical.Machines.Thermal.convertResistance(R_normal,T_normal,alpha20a,TaNominal)*IaNominal
                                - Modelica.Electrical.Machines.Losses.DCMachines.brushVoltageDrop(brushParameters, IaNominal);

  parameter SI.Resistance R_normal=0.3474 "Normal armature resistance" annotation(Dialog(tab="Normal Parameters"));
  parameter SI.Inductance L_normal=0.0015 "Normal armature inductance" annotation(Dialog(tab="Normal Parameters"));
  parameter SI.Inertia J_rotor=1e-4 annotation(Dialog(tab="Normal Parameters"));
  parameter SI.Inertia J_stator=1e-2 annotation(Dialog(tab="Normal Parameters",enable=useSupport));
  parameter Real turnsRatio=0.022 "motor constant" annotation(Dialog(tab="Normal Parameters"));
  //turnsRatio = ViNominal/(wNominal*psi_eNominal)=ViNominal/(wNominal*Le*IeNominal)
  parameter SI.Inductance Le=1 "Field excitation inductance" annotation(Dialog(tab="Normal Parameters"));
  parameter SI.Current IeNominal=1 "Equivalent excitation current" annotation(Dialog(tab="Normal Parameters"));
  parameter Boolean useSupport=false annotation(Dialog(tab="Normal Parameters"));
  parameter Boolean useThermalPort=false annotation(Dialog(tab="Normal Parameters"));
  //------------------------Loss Parameters-------------------------------------
  // U just need to specify the corresponding Power_Loss in core, friction, brush, strayload respectively
  parameter Boolean loss_on=false "choose to specify loss parameters" annotation(Dialog(tab="Loss Parameters"));
  parameter Losses.FrictionParameters frictionParameters(PRef=0,final wRef=wNominal,final power_w=2) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  parameter Losses.BrushParameters brushParameters(V=0,ILinear=0.01*IaNominal) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  parameter Losses.StrayLoadParameters strayLoadParameters(PRef=0,final IRef=IaNominal,final wRef=wNominal,final power_w=1) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  parameter Losses.CoreParameters coreParameters(final m=1,PRef=0,final VRef=ViNominal,final wRef=wNominal) annotation(Dialog(tab="Loss Parameters",enable=loss_on));
  //------------------------Interfaces------------------------------------------
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_ap
    annotation (Placement(transformation(extent={{50,86},{70,106}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_an
    annotation (Placement(transformation(extent={{-70,86},{-50,106}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  //------------------------Normal Components-----------------------------------
  Modelica.Mechanics.Rotational.Components.Inertia inertiaRotor(J=J_rotor)
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Modelica.Electrical.Machines.BasicMachines.Components.AirGapDC airGapDC(
    quasiStationary=false,
    turnsRatio=turnsRatio,
    Le=Le)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,-20})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent ie(I=IeNominal)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Electrical.Analog.Basic.Ground eGround annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-40,-60})));
  TDL_v1.Electricity.BasicComponents.Resistor r_armature(
    useHeatPort=true,
    R=R_normal,
    T_ref=T_normal,
    alpha=alpha20a)
    annotation (Placement(transformation(extent={{50,30},{30,50}})));
  TDL_v1.Electricity.BasicComponents.Inductor l_armature(L=L_normal,
      quasiStationary=false) "induction of armature"
    annotation (Placement(transformation(extent={{20,30},{0,50}})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Ron=0,
      Goff=0)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={80,70})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch(Ron=0,
      Goff=0)
    annotation (Placement(transformation(extent={{10,70},{-10,90}})));

   //------------------------Loss Components-------------------------------------
  Modelica.Electrical.Machines.Losses.Friction friction(useHeatPort=true,
      frictionParameters=frictionParameters)
    annotation (Placement(transformation(extent={{78,-80},{98,-60}})));
  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush(useHeatPort=true,
      brushParameters=brushParameters)
    annotation (Placement(transformation(extent={{-26,30},{-46,50}})));
  Modelica.Electrical.Machines.Losses.DCMachines.StrayLoad strayLoad(
      useHeatPort=true, strayLoadParameters=strayLoadParameters)
    annotation (Placement(transformation(extent={{80,30},{60,50}})));
  Modelica.Electrical.Machines.Losses.DCMachines.Core core(useHeatPort=true,
      coreParameters=coreParameters,
    w=airGapDC.w)
    annotation (Placement(transformation(extent={{8,62},{-12,82}})));
  //------------------------Fault Components------------------------------------
  TDL_v1.BasicComponents.Friction.Rotational.Rotational_ContinuousCoulombFriction
    bearingFaultInjection(
    parm_mue=1,
    parm_cgeo=1,
    parm_w_limit=1e-4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-70})));

  //------------------------Thermal Interface Components------------------------
  Modelica.Electrical.Machines.Thermal.DCMachines.ThermalAmbientDCPM
    thermalAmbient(Ta=T_normal, Tpm=T_normal) if
                      not useThermalPort annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-90,-110})));

  Modelica.Electrical.Machines.Interfaces.DCMachines.ThermalPortDCPM
    thermalPort if useThermalPort
    annotation (Placement(transformation(extent={{-60,-140},{-40,-120}})));
  //------------------------Support Interface Components------------------------
  Modelica.Mechanics.Rotational.Components.Fixed fixed if not useSupport
    annotation (Placement(transformation(extent={{40,-140},{60,-120}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertiaStator(J=J_stator) if
                                                                    useSupport
    annotation (Placement(transformation(extent={{80,-130},{60,-110}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a support if useSupport
    annotation (Placement(transformation(extent={{86,-130},{106,-110}})));

  //------------------------Internal Default parameters-------------------------

  //------------------------Internal Interfaces---------------------------------
protected
  Modelica.Mechanics.Rotational.Interfaces.Support internalSupport
    annotation (Placement(transformation(extent={{40,-130},{60,-110}})));
  Modelica.Electrical.Machines.Interfaces.DCMachines.ThermalPortDCPM
    internalThermalPort
    annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));

equation
  connect(inertiaRotor.flange_b, flange) annotation (Line(
      points={{80,-20},{88,-20},{88,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(friction.flange, inertiaRotor.flange_b) annotation (Line(
      points={{88,-60},{88,-20},{80,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(airGapDC.flange, inertiaRotor.flange_a) annotation (Line(
      points={{0,-20},{60,-20}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(ie.n, airGapDC.pin_ep) annotation (Line(
      points={{0,-60},{0,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ie.p, airGapDC.pin_en) annotation (Line(
      points={{-20,-60},{-20,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(eGround.p, ie.p) annotation (Line(
      points={{-30,-60},{-20,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(r_armature.p, strayLoad.n) annotation (Line(
      points={{50,40},{60,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(l_armature.p, r_armature.n) annotation (Line(
      points={{20,40},{30,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(l_armature.n, airGapDC.pin_ap) annotation (Line(
      points={{0,40},{0,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(strayLoad.flange, flange) annotation (Line(
      points={{70,50},{88,50},{88,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(core.p, r_armature.n) annotation (Line(
      points={{8,72},{26,72},{26,40},{30,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(core.n, brush.p) annotation (Line(
      points={{-12,72},{-26,72},{-26,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(brush.p, airGapDC.pin_an) annotation (Line(
      points={{-26,40},{-20,40},{-20,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(brush.n, pin_an) annotation (Line(
      points={{-46,40},{-60,40},{-60,96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bearingFaultInjection.flange_a, inertiaRotor.flange_b) annotation (
      Line(
      points={{40,-60},{40,-46},{88,-46},{88,-20},{80,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(internalThermalPort, thermalPort) annotation (Line(
      points={{-50,-110},{-50,-130}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
      points={{-80,-110},{-50,-110}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(internalThermalPort.heatPortFriction, friction.heatPort) annotation (
      Line(
      points={{-50,-110},{78,-110},{78,-80}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(brush.heatPort, internalThermalPort.heatPortBrush) annotation (Line(
      points={{-26,30},{-26,14},{20,14},{20,-110},{-50,-110}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(strayLoad.heatPort, internalThermalPort.heatPortStrayLoad)
    annotation (Line(
      points={{80,30},{80,14},{20,14},{20,-110},{-50,-110}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(core.heatPort, internalThermalPort.heatPortCore) annotation (Line(
      points={{8,62},{20,62},{20,-110},{-50,-110}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(r_armature.heatPort, internalThermalPort.heatPortArmature)
    annotation (Line(
      points={{40,30},{40,14},{20,14},{20,-110},{-50,-110}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(inertiaStator.flange_b, internalSupport) annotation (Line(
      points={{60,-120},{50,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(internalSupport, fixed.flange) annotation (Line(
      points={{50,-120},{50,-130}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(friction.support, internalSupport) annotation (Line(
      points={{88,-80},{88,-94},{50,-94},{50,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertiaStator.flange_a, support) annotation (Line(
      points={{80,-120},{96,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bearingFaultInjection.flange_b, internalSupport) annotation (Line(
      points={{40,-80},{40,-94},{50,-94},{50,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(strayLoad.support, internalSupport) annotation (Line(
      points={{70,30},{70,4},{50,4},{50,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(airGapDC.support, internalSupport) annotation (Line(
      points={{-20,-20},{-50,-20},{-50,-94},{50,-94},{50,-120}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(idealOpeningSwitch.n, strayLoad.p) annotation (Line(
      points={{80,60},{80,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealOpeningSwitch.p, pin_ap) annotation (Line(
      points={{80,80},{60,80},{60,96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch.p, pin_ap) annotation (Line(
      points={{10,80},{60,80},{60,96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(idealClosingSwitch.n, pin_an) annotation (Line(
      points={{-10,80},{-60,80},{-60,96}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,100}}), graphics),Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-140},{100,100}}),
                                              graphics={Line(points={{-40,70},{-60,
              70},{-60,106}},
            color={0,0,255}), Line(points={{40,70},{60,70},{60,106}},
            color={0,0,255}),Rectangle(
          extent={{-130,10},{-100,-10}},
          lineColor={0,0,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid), Rectangle(
          extent={{-100,10},{-70,-10}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)}));
end DCPM_Internal_Fault;
