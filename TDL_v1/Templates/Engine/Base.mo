within TDL_v1.Templates.Engine;
model Base
  extends TDL_v1.Icons.Engine;
  parameter Boolean usingMultiBodyAccessories=false
    "=true if using MultiBody accessories with a 1D engine"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingMultiBodyTransmission=false
    "=true if using a MultiBody transmission with a 1D engine"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingDashboard=false;
  parameter Boolean usingAccessories=true;
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingAcceleratorPedal=false;
  parameter Boolean usingMount=false;

  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing accessoryFlange(
      final includeBearingConnector=includeAccessoriesBearing or
        usingMultiBodyAccessories) if usingAccessories
    "Connection for the engine accessories"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
          rotation=0)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing
    transmissionFlange(final includeBearingConnector=
        includeTransmissionBearing or usingMultiBodyTransmission)
    "Connection to the transmission" annotation (Placement(transformation(
          extent={{90,-10},{110,10}}, rotation=0)));
  Bus.MessageBus.MessageControlBus messageBus
    annotation (Placement(transformation(extent={{-70,90},{-50,110}})));
  Bus.FaultBus.FaultBus faultBus if includeFaultBus or usingFaultBus
    annotation (Placement(transformation(extent={{50,90},{70,110}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a engineMount if
    includeMount or usingMount "Engine mount connection (optional)"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Modelica.Mechanics.Translational.Interfaces.Flange_a acceleratorPedal if
    includeAcceleratorPedal or usingAcceleratorPedal
    "Accelerator pedal connection (optional)"
    annotation (Placement(transformation(extent={{-10,110},{10,90}},
          rotation=0)));
  Components.MultiBodyEnd end_2(final includeBearingConnector=
        includeTransmissionBearing or usingMultiBodyTransmission)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
  Components.MultiBodyEnd end_1(final includeBearingConnector=
        includeAccessoriesBearing or usingMultiBodyAccessories) if usingAccessories
    annotation (Placement(transformation(
        origin={-100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
protected
  parameter Boolean includeAcceleratorPedal=false
    "Include the accelerator pedal connection";
  parameter Boolean includeMount=false "Include the engine mount connection";
  parameter Boolean includeTransmissionBearing=false
    "Include the transmission bearing";
  parameter Boolean includeAccessoriesBearing=false
    "Include the accessories bearing";
  parameter Boolean includeFaultBus=false;
public
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
equation
  connect(end_2.flange, transmissionFlange) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));
  connect(end_1.flange, accessoryFlange) annotation (Line(
      points={{-100,19.3333},{-100,0}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={
        Rectangle(
          extent={{-12,-88},{12,-112}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{92,28},{108,16}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-108,28},{-92,16}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
         graphics),
    Documentation(info="<html>
</html>"));
end Base;
