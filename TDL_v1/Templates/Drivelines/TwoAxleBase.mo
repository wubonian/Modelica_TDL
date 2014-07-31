within TDL_v1.Templates.Drivelines;
model TwoAxleBase
  extends TDL_v1.Icons.Driveline;
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing
    transmissionFlange(final includeBearingConnector=
        includeTransmissionBearing or usingMultiBodyTransmission)
    "Connection to the Transmission output shaft"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
          rotation=0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a drivelineMount if
    includeMount or usingMount "Driveline mount connection (optional)"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Components.MultiBodyEnd end_0(final includeBearingConnector=
        includeTransmissionBearing or usingMultiBodyTransmission)
    annotation (Placement(transformation(
        origin={-100,22},
        extent={{-6,-8},{6,8}},
        rotation=270)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
      final includeBearingConnector=includeWheelBearings or
        usingMultiBodyChassis) "Front left wheel"
    annotation (Placement(transformation(
        origin={-60,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
      final includeBearingConnector=includeWheelBearings or
        usingMultiBodyChassis) "Front right wheel"
    annotation (Placement(transformation(
        origin={-60,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
      final includeBearingConnector=includeWheelBearings or
        usingMultiBodyChassis) "Rear left wheel"
    annotation (Placement(transformation(
        origin={60,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
      final includeBearingConnector=includeWheelBearings or
        usingMultiBodyChassis) "Rear right wheel"
    annotation (Placement(transformation(
        origin={60,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Components.MultiBodyEnd end_1(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_2(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{-88,92},{-76,108}},
          rotation=0)));
  Components.MultiBodyEnd end_3(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{32,-108},{44,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_4(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{32,92},{44,108}},
          rotation=0)));
  Bus.MessageBus.MessageControlBus messageBus annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,70})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,70})));

  parameter Boolean usingMultiBodyChassis=false
    "=true if using a MultiBody chassis with a 1D driveline"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingMultiBodyTransmission=false
    "=true if using a MultiBody transmission with a 1D driveline"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingMount=false;
  parameter Boolean usingDashboard=false;
protected
  parameter Boolean includeWheelBearings=false
    "Include wheel bearing connectors";
  parameter Boolean includeMount=false "Include the driveline mount";
  parameter Boolean includeTransmissionBearing=false
    "Include the transmission bearing";
public
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{95,-5},{105,5}})));
equation
  connect(end_0.flange, transmissionFlange) annotation (Line(
      points={{-100,20},{-100,0}},
      color={135,135,135},
      thickness=0.5));
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-80,-100},{-60,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{40,100},{60,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, wheelHub_3) annotation (Line(
      points={{40,-100},{60,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_2.flange, wheelHub_2) annotation (Line(
      points={{-80,100},{-60,100}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-89,108},{-75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,108},{45,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-89,-92},{-75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,-92},{45,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
</html>"));
end TwoAxleBase;
