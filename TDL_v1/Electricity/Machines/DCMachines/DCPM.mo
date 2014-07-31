within TDL_v1.Electricity.Machines.DCMachines;
model DCPM
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
    annotation (Placement(transformation(extent={{50,106},{70,126}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_an
    annotation (Placement(transformation(extent={{-70,106},{-50,126}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  //------------------------Normal Components-----------------------------------
  Modelica.Mechanics.Rotational.Components.Inertia inertiaRotor(J=J_rotor)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Electrical.Machines.BasicMachines.Components.AirGapDC airGapDC(
    quasiStationary=false,
    turnsRatio=turnsRatio,
    Le=Le)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,0})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent ie(I=IeNominal)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Electrical.Analog.Basic.Ground eGround annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-40,-40})));
  Modelica.Electrical.Analog.Basic.Resistor r_armature(useHeatPort=true, R=R_normal,
    T_ref=T_normal,
    alpha=alpha20a)
    annotation (Placement(transformation(extent={{50,50},{30,70}})));
  Modelica.Electrical.Machines.BasicMachines.Components.InductorDC l_armature(L=L_normal, quasiStationary=false)
    "induction of armature"
    annotation (Placement(transformation(extent={{20,50},{0,70}})));

   //------------------------Loss Components-------------------------------------
  Modelica.Electrical.Machines.Losses.Friction friction(useHeatPort=true,
      frictionParameters=frictionParameters)
    annotation (Placement(transformation(extent={{78,-60},{98,-40}})));
  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush(useHeatPort=true,
      brushParameters=brushParameters)
    annotation (Placement(transformation(extent={{-26,50},{-46,70}})));
  Modelica.Electrical.Machines.Losses.DCMachines.StrayLoad strayLoad(
      useHeatPort=true, strayLoadParameters=strayLoadParameters)
    annotation (Placement(transformation(extent={{80,50},{60,70}})));
  Modelica.Electrical.Machines.Losses.DCMachines.Core core(useHeatPort=true,
      coreParameters=coreParameters,
    w=airGapDC.w)
    annotation (Placement(transformation(extent={{8,82},{-12,102}})));

  //------------------------Thermal Interface Components------------------------
  Modelica.Electrical.Machines.Thermal.DCMachines.ThermalAmbientDCPM
    thermalAmbient(Ta=T_normal, Tpm=T_normal) if
                      not useThermalPort annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-90,-90})));

  Modelica.Electrical.Machines.Interfaces.DCMachines.ThermalPortDCPM
    thermalPort if useThermalPort
    annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  //------------------------Support Interface Components------------------------
  Modelica.Mechanics.Rotational.Components.Fixed fixed if not useSupport
    annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertiaStator(J=J_stator) if
                                                                    useSupport
    annotation (Placement(transformation(extent={{80,-110},{60,-90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a support if useSupport
    annotation (Placement(transformation(extent={{86,-110},{106,-90}})));

  //------------------------Internal Default parameters-------------------------

  //------------------------Internal Interfaces---------------------------------
protected
  Modelica.Mechanics.Rotational.Interfaces.Support internalSupport
    annotation (Placement(transformation(extent={{40,-110},{60,-90}})));
  Modelica.Electrical.Machines.Interfaces.DCMachines.ThermalPortDCPM
    internalThermalPort
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));

equation
  connect(inertiaRotor.flange_b, flange) annotation (Line(
      points={{80,0},{96,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(friction.flange, inertiaRotor.flange_b) annotation (Line(
      points={{88,-40},{88,0},{80,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(airGapDC.flange, inertiaRotor.flange_a) annotation (Line(
      points={{0,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(ie.n, airGapDC.pin_ep) annotation (Line(
      points={{0,-40},{0,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ie.p, airGapDC.pin_en) annotation (Line(
      points={{-20,-40},{-20,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(eGround.p, ie.p) annotation (Line(
      points={{-30,-40},{-20,-40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(r_armature.p, strayLoad.n) annotation (Line(
      points={{50,60},{60,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(l_armature.p, r_armature.n) annotation (Line(
      points={{20,60},{30,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(l_armature.n, airGapDC.pin_ap) annotation (Line(
      points={{0,60},{0,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(strayLoad.flange, flange) annotation (Line(
      points={{70,70},{88,70},{88,0},{96,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(core.p, r_armature.n) annotation (Line(
      points={{8,92},{26,92},{26,60},{30,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(core.n, brush.p) annotation (Line(
      points={{-12,92},{-26,92},{-26,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(brush.p, airGapDC.pin_an) annotation (Line(
      points={{-26,60},{-20,60},{-20,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(brush.n, pin_an) annotation (Line(
      points={{-46,60},{-60,60},{-60,116}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(internalThermalPort, thermalPort) annotation (Line(
      points={{-50,-90},{-50,-110}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
      points={{-80,-90},{-50,-90}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(internalThermalPort.heatPortFriction, friction.heatPort) annotation (
      Line(
      points={{-50,-90},{78,-90},{78,-60}},
      color={199,0,0},
      smooth=Smooth.None));
  connect(brush.heatPort, internalThermalPort.heatPortBrush) annotation (Line(
      points={{-26,50},{-26,34},{20,34},{20,-90},{-50,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(strayLoad.heatPort, internalThermalPort.heatPortStrayLoad)
    annotation (Line(
      points={{80,50},{80,34},{20,34},{20,-90},{-50,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(core.heatPort, internalThermalPort.heatPortCore) annotation (Line(
      points={{8,82},{20,82},{20,-90},{-50,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(r_armature.heatPort, internalThermalPort.heatPortArmature)
    annotation (Line(
      points={{40,50},{40,34},{20,34},{20,-90},{-50,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(inertiaStator.flange_b, internalSupport) annotation (Line(
      points={{60,-100},{50,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(internalSupport, fixed.flange) annotation (Line(
      points={{50,-100},{50,-110}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(friction.support, internalSupport) annotation (Line(
      points={{88,-60},{88,-74},{50,-74},{50,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertiaStator.flange_a, support) annotation (Line(
      points={{80,-100},{96,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(strayLoad.support, internalSupport) annotation (Line(
      points={{70,50},{70,24},{50,24},{50,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(airGapDC.support, internalSupport) annotation (Line(
      points={{-20,1.77636e-015},{-50,1.77636e-015},{-50,-74},{50,-74},{50,-100}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(pin_ap, strayLoad.p) annotation (Line(
      points={{60,116},{60,100},{80,100},{80,60}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -120},{100,120}}), graphics),Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-120},{100,120}}),
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
end DCPM;
