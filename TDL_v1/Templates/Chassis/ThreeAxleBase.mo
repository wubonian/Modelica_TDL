within TDL_v1.Templates.Chassis;
model ThreeAxleBase

  Modelica.Mechanics.MultiBody.Interfaces.Frame_b chassisFrame if
    includeChassisFrame or usingChassisFrame
    "Chassis reference frame (optional)"
    annotation (Placement(transformation(extent={{-176,-86},{-144,-54}},
          rotation=0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a steeringWheel if
    includeSteeringWheel or usingSteeringWheel
    "Steering wheel connection (optional)"
    annotation (Placement(transformation(extent={{-10,90},{10,110}},
          rotation=0)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
      final includeBearingConnector=includeWheelBearings) "Front left wheel"
    annotation (Placement(transformation(
        origin={-90,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
      final includeBearingConnector=includeWheelBearings) "Front right wheel"
    annotation (Placement(transformation(
        origin={-90,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
      final includeBearingConnector=includeWheelBearings)
    "Second axle left wheel"
    annotation (Placement(transformation(
        origin={90,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
      final includeBearingConnector=includeWheelBearings)
    "Second axle right wheel"
    annotation (Placement(transformation(
        origin={90,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
      final includeBearingConnector=includeWheelBearings)
    "Third axle left wheel"
    annotation (Placement(transformation(
        origin={250,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
      final includeBearingConnector=includeWheelBearings)
    "Third axle right wheel"
    annotation (Placement(transformation(
        origin={250,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Components.MultiBodyEnd end_2(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-118,92},{-106,108}},
          rotation=0)));
  Components.MultiBodyEnd end_4(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{62,92},{74,108}},
          rotation=0)));
  Components.MultiBodyEnd end_1(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-118,-108},{-106,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_3(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{62,-108},{74,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_5(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{223,92},{235,108}},
          rotation=0)));
  Components.MultiBodyEnd end_6(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{223,-108},{235,-92}},
          rotation=0)));
  Bus.MessageBus.MessageControlBus messageBus annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-160,70})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={320,70})));
  parameter Boolean usingMultiBodyDriveline=false
    "=true if using a MultiBody driveline with a 1D chassis"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingSteeringWheel=false;
  parameter Boolean usingChassisFrame=false;
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingDashboard=false;
protected
  parameter Boolean includeWheelBearings=false
    "Include wheel bearing connectors";
  parameter Boolean includeChassisFrame=false "Include the chassis frame";
  parameter Boolean includeSteeringWheel=false
    "Include the steering wheel connection";

public
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{-165,-5},{-155,5}})));
equation
  connect(end_2.flange, wheelHub_2) annotation (Line(
      points={{-110,100},{-90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{70,100},{90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-110,-100},{-90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, wheelHub_3) annotation (Line(
      points={{70,-100},{90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_6.flange, wheelHub_5) annotation (Line(
      points={{231,-100},{250,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_5.flange, wheelHub_6) annotation (Line(
      points={{231,100},{250,100}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{320,100}},
        grid={1,1},
        initialScale=0.1), graphics={
        Rectangle(
          extent={{-119,108},{-105,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{61,108},{75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-119,-92},{-105,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{61,-92},{75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{222,108},{236,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{222,-92},{236,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{320,100}},
        grid={1,1},
        initialScale=0.1), graphics),
    Documentation(info="<html>
</html>"));
end ThreeAxleBase;
