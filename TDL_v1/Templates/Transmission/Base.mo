within TDL_v1.Templates.Transmission;
model Base
  extends TDL_v1.Icons.Transmission;
  parameter Boolean usingMultiBodyEngine=false
    "=true if using MultiBody engine with a 1D transmission"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingMultiBodyDriveline=false
    "=true if using a MultiBody driveline with a 1D transmission"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean includeManualShiftConnector=false
    "Include the manual shift connection";
  parameter Boolean includeClutchPedal=false
    "Include the clutch pedal connection";
  parameter Boolean usingMultiBodyMotor=false
    "=true if using MultiBody motor with a 1D transmission"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingMotor=false;
  parameter Boolean usingMount=false;
  parameter Boolean usingClutchPedal=false;
  parameter Boolean usingManualShiftConnector=false;
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingDashboard=false;
  Components.MultiBodyEnd end_3(final includeBearingConnector=
        includeTransmissionBearing or usingMultiBodyEngine) if usingMotor
    annotation (Placement(transformation(
        origin={-100,-82},
        extent={{-8,-6},{8,6}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing motorFlange(
      final includeBearingConnector=includeTransmissionBearing or
        usingMultiBodyEngine) if usingMotor "Connection to the engine"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}},
          rotation=0)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing engineFlange(
      final includeBearingConnector=includeTransmissionBearing or
        usingMultiBodyEngine) "Connection to the engine"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
          rotation=0)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing drivelineFlange(
      final includeBearingConnector=includeDrivelineBearing or
        usingMultiBodyDriveline) "Connection to the driveline"
    annotation (Placement(transformation(extent={{90,-10},{110,10}},
          rotation=0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a transmissionMount if
    includeMount or usingMount "Transmission mount connection (optional)"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Components.MultiBodyEnd end_2(final includeBearingConnector=
        includeDrivelineBearing or usingMultiBodyDriveline)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
  Components.MultiBodyEnd end_1(final includeBearingConnector=
        includeTransmissionBearing or usingMultiBodyEngine)
    annotation (Placement(transformation(
        origin={-100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
  Modelica.Mechanics.Translational.Interfaces.Flange_b clutchPedal if
    includeClutchPedal or usingClutchPedal "Clutch pedal connection (optional)"
    annotation (Placement(transformation(extent={{-30,90},{-10,110}},
          rotation=0)));
  VehicleInterfaces.Interfaces.ShiftConnector shiftConnector if
    includeManualShiftConnector or usingManualShiftConnector
    "Manual shift selector connection (optional)"
    annotation (Placement(transformation(extent={{12,90},{32,110}},
          rotation=0)));
  Bus.MessageBus.MessageControlBus messageBus
    annotation (Placement(transformation(extent={{-70,90},{-50,110}})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus
    annotation (Placement(transformation(extent={{50,90},{70,110}})));
protected
  parameter Boolean includeMount=false
    "Include the transmission mount connection";
  parameter Boolean includeDrivelineBearing=false
    "Include the driveline bearing";
  parameter Boolean includeTransmissionBearing=false
    "Include the engine bearing";
  parameter Boolean includeMotorBearing=false
    "Include the motor bearing connection";
public
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
equation
  connect(end_1.flange, engineFlange) annotation (Line(
      points={{-100,19.3333},{-100,0}},
      color={135,135,135},
      thickness=0.5));
  connect(end_2.flange, drivelineFlange) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, motorFlange) annotation (Line(
      points={{-100,-79.3333},{-100,-60}},
      color={135,135,135},
      thickness=0.5));
   annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{-10,-86},{14,-110}},
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
    Documentation(info="<html>
</html>"));
end Base;
