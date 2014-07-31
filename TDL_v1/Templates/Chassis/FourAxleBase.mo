within TDL_v1.Templates.Chassis;
model FourAxleBase

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
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_7(
      final includeBearingConnector=includeWheelBearings)
    "Fourth axle left wheel"
    annotation (Placement(transformation(
        origin={410,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_8(
      final includeBearingConnector=includeWheelBearings)
    "Fourth axle right wheel"
    annotation (Placement(transformation(
        origin={410,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Components.MultiBodyEnd end_2(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-117,92},{-105,108}},
          rotation=0)));
  Components.MultiBodyEnd end_1(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-117,-108},{-105,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_4(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{63,92},{75,108}},
          rotation=0)));
  Components.MultiBodyEnd end_3(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{63,-108},{75,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_5(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{224,92},{236,108}},
          rotation=0)));
  Components.MultiBodyEnd end_6(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{224,-108},{236,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_7(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{382,92},{394,108}},
          rotation=0)));
  Components.MultiBodyEnd end_8(includeBearingConnector=
        includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{382,-108},{394,-92}},
          rotation=0)));
  Bus.MessageBus.MessageControlBus messagelBus annotation (Placement(
        transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={-160,70})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=-90,
        origin={480,69})));
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
      points={{-109,100},{-90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-109,-100},{-90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{71,100},{90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, wheelHub_3) annotation (Line(
      points={{71,-100},{90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_6.flange, wheelHub_5) annotation (Line(
      points={{232,-100},{250,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_5.flange, wheelHub_6) annotation (Line(
      points={{232,100},{250,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_7.flange, wheelHub_8) annotation (Line(
      points={{390,100},{410,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_8.flange, wheelHub_7) annotation (Line(
      points={{390,-100},{401,-100},{401,-100},{410,-100}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{480,100}},
        grid={1,1},
        initialScale=0.1), graphics={
        Rectangle(
          extent={{-118,108},{-104,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-118,-92},{-104,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{62,108},{76,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{62,-92},{76,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{223,108},{237,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{223,-92},{237,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{381,108},{395,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{381,-92},{395,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{480,100}},
        grid={1,1},
        initialScale=0.1), graphics),
    Documentation(info="<html>
</html>"));
end FourAxleBase;
