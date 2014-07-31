within TDL_v1.Example.EMT.EMT;
model EMT_Fault
  extends Templates.Examples.EMT_Fault(
    redeclare Vehicle_Components.Engine engine,
    redeclare Vehicle_Components.Transmission_Fault transmission,
    redeclare Vehicle_Components.Driveline driveline,
    redeclare Vehicle_Components.Brakes brakes,
    redeclare Vehicle_Components.Chassis chassis,
    redeclare Vehicle_Components.Battery battery,
    redeclare Vehicle_Components.Motor_Fault motor,
    redeclare Controllers.MCU mCU,
    redeclare Vehicle_Components.DriverEnvironment driverEnvironment,
    redeclare Vehicle_Components.Driver base(combiTimeTable(fileName=
            "C:/Users/dell/Desktop/NEDC1.mat")),
    redeclare Vehicle_Components.Fault_Monitor faultTrigger);
equation
  connect(chassis.dashboardInformation, base.dashboardInformation)
    annotation (Line(
      points={{92,10},{80,10},{80,60},{-80,60},{-80,99},{-59,99}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-150,-100},{180,120}}), graphics));
end EMT_Fault;
