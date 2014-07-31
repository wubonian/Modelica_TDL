within TDL_v1.Templates.Accessories;
model Base

  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing engineFlange(
      final includeBearingConnector=includeAccessoriesBearing or
        usingMultiBodyEngine) "Source of drive torque"
    annotation (Placement(transformation(extent={{90,-10},{110,10}},
          rotation=0)));
  Components.MultiBodyEnd end_2(final includeBearingConnector=
        includeAccessoriesBearing or usingMultiBodyEngine)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
  TDL_v1.Bus.MessageBus.MessageControlBus messageBus if usingMessageBus
    "Control signal bus" annotation (Placement(transformation(
        origin={-60,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus or includeFaultBus
    annotation (Placement(transformation(extent={{50,90},{70,110}})));
  parameter Boolean usingMessageBus=true;
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingDashboard=false;
  parameter Boolean usingMultiBodyEngine=false
    "=true if using a MultiBody engine with a 1D accessories model"
    annotation (Dialog(tab="Advanced"));
protected
  parameter Boolean includeAccessoriesBearing=false
    "Include the engine bearing";
  parameter Boolean includeFaultBus=false;
public
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
equation
  connect(end_2.flange, engineFlange) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{92,28},{108,16}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
                       Documentation(info="<html>
</html>"));
end Base;
