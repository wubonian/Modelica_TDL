within TDL_v1.Templates.DriverEnvironment;
model DriverEnvironment
  extends TDL_v1.Icons.DriverEnvironment;

  parameter Boolean includeDriverSeat=false
    "Include the drivers seat connection to the body";
  parameter Boolean includeSteeringWheel=false
    "Include the steering wheel connection";
  parameter Boolean includeAcceleratorPedal=false
    "Include the accelerator pedal connection";
  parameter Boolean includeBrakePedal=false
    "Include the brake pedal connection";
  parameter Boolean includeClutchPedal=false
    "Include the clutch pedal connection";
  parameter Boolean includeManualShiftConnector=false
    "Include the manual shift connection";
  parameter Boolean usingDashboard=false;
  Bus.MessageBus.DriverInterface Environment_Interface annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,0})));
  Bus.MessageBus.MessageControlBus messageBus annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,0})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a chassisFrame if
    includeDriverSeat "Chassis reference frame (optional)"
    annotation (Placement(transformation(
        origin={80,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a steeringWheel if
    includeSteeringWheel "Steering wheel connection (optional)"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}},
          rotation=0)));
  Modelica.Mechanics.Translational.Interfaces.Flange_a acceleratorPedal if
    includeAcceleratorPedal "Accelerator pedal connection (optional)"
    annotation (Placement(transformation(extent={{-90,-90},{-70,-110}},
          rotation=0)));
  Modelica.Mechanics.Translational.Interfaces.Flange_a brakePedal if
    includeBrakePedal "Brake pedal connection (optional)"
    annotation (Placement(transformation(extent={{30,-90},{50,-110}},
          rotation=0)));
  Modelica.Mechanics.Translational.Interfaces.Flange_a clutchPedal if
    includeClutchPedal "Clutch pedal connection (optional)"
    annotation (Placement(transformation(extent={{-50,-90},{-30,-110}},
          rotation=0)));
  VehicleInterfaces.Interfaces.ShiftConnector shiftConnector if
    includeManualShiftConnector
    "Manual transmission shift connection (optional)"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}},
          rotation=0)));

  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end DriverEnvironment;
