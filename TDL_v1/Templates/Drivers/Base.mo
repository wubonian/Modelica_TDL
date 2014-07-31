within TDL_v1.Templates.Drivers;
model Base
  extends TDL_v1.Icons.Driver;
  Bus.MessageBus.DriverInterface Environment_Interface annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,0})));
  parameter Boolean usingDashboard=false;
  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),        graphics));
end Base;
