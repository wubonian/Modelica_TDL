within TDL_v1.Templates.ElectricDrives;
model Base
  extends TDL_v1.Icons.ElectricMotor;
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing shaft_b(
      includeBearingConnector=includeBearing or usingMultiBodySystem)
    "Mechanical shaft" annotation (Placement(transformation(extent={{90,-10},
            {110,10}}, rotation=0)));
  Components.MultiBodyEnd end_1(includeBearingConnector=
        includeBearing or usingMultiBodySystem)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
  Bus.MessageBus.MessageControlBus messageBus annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,100})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a transmissionMount if
    includeMount or usingMount "Transmission mount connection (optional)"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  parameter Boolean usingMultiBodySystem=false
    "=true if connecting to a MultiBody system with a 1D model"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingMount=false;
  parameter Boolean usingDashboard=false;
protected
  parameter Boolean includeBearing=false "Include bearing connector";
  parameter Boolean includeMount=false;
public
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));

  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-110,70},{-90,90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{-110,-90},{-90,-70}})));
equation
  connect(end_1.flange, shaft_b) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics={
        Rectangle(
          extent={{-10,-86},{14,-110}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
                       Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}),
                            graphics),
    Documentation(info="<html>
</html>"),
    Diagram(Rectangle(extent=[92, 28; 108, 16], style(
          color=45,
          rgbcolor={255,128,0},
          pattern=3))),
    Icon);
end Base;
