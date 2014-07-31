within TDL_v1.Templates.Brakes;
model TwoAxleBase
  extends TDL_v1.Icons.Brakes;
  Modelica.Mechanics.Translational.Interfaces.Flange_a brakePedal if
    includeBrakePedal or usingBrakePedal "Brake pedal connection (optional)"
    annotation (Placement(transformation(extent={{-10,110},{10,90}},
          rotation=0)));
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
  Components.MultiBodyEnd end_2(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{-88,92},{-76,108}},
          rotation=0)));
  Components.MultiBodyEnd end_4(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{32,92},{44,108}},
          rotation=0)));
  Components.MultiBodyEnd end_3(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{32,-108},{44,-92}},
          rotation=0)));
  Components.MultiBodyEnd end_1(final includeBearingConnector=
        includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
          rotation=0)));
  Bus.MessageBus.MessageControlBus messageBus annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,60})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,60})));
  parameter Boolean usingMultiBodyChassis=false
    "=true if using a MultiBody chassis with a 1D driveline"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingBrakePedal=false;
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingDashboard=false;
protected
  parameter Boolean includeBrakePedal=false
    "Include the brake pedal connection";
  parameter Boolean includeWheelBearings=false
    "Include the wheel bearing connectors";
public
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(end_2.flange, wheelHub_2) annotation (Line(
      points={{-80,100},{-60,100}},
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
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-80,-100},{-60,-100}},
      color={135,135,135},
      thickness=0.5));
  annotation (Documentation(info="<html>
</html>"),
       Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),        graphics={
        Rectangle(
          extent={{-89,108},{-75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,108},{45,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,-92},{45,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-89,-92},{-75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}));
end TwoAxleBase;
