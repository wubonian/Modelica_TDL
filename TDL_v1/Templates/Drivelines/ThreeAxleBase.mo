within TDL_v1.Templates.Drivelines;
model ThreeAxleBase

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
        usingMultiBodyChassis) "Second axle left wheel"
    annotation (Placement(transformation(
        origin={50,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
      final includeBearingConnector=includeWheelBearings or
        usingMultiBodyChassis) "Second axle right wheel"
    annotation (Placement(transformation(
        origin={50,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
      includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Third axle left wheel"
    annotation (Placement(transformation(
        origin={160,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
      includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Third axle right wheel"
    annotation (Placement(transformation(
        origin={160,100},
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
    annotation (Placement(transformation(extent={{22,-108},{34,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_4(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{22,92},{34,108}},
          rotation=0)));
  Components.MultiBodyEnd end_5(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{132,-108},{144,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_6(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{132,92},{144,108}},
          rotation=0)));
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
  Bus.MessageBus.MessageControlBus messageBus annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,70})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={200,70})));
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
    annotation (Placement(transformation(extent={{195,-5},{205,5}})));
equation
  connect(end_0.flange, transmissionFlange) annotation (Line(
      points={{-100,20},{-100,0}},
      color={135,135,135},
      thickness=0.5));
  connect(end_5.flange, wheelHub_5) annotation (Line(
      points={{140,-100},{160,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_6.flange, wheelHub_6) annotation (Line(
      points={{140,100},{160,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{30,100},{50,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, wheelHub_3) annotation (Line(
      points={{30,-100},{50,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-80,-100},{-60,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_2.flange, wheelHub_2) annotation (Line(
      points={{-80,100},{-60,100}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{200,100}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-89,108},{-75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-89,-92},{-75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{21,-92},{35,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{21,107},{35,91}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{131,-92},{145,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{131,108},{145,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,
            100}})));
end ThreeAxleBase;
