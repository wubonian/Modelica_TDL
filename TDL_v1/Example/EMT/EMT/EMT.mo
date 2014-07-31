within TDL_v1.Example.EMT.EMT;
model EMT
  extends Templates.Examples.EMT(
    redeclare Vehicle_Components.Driver driver(combiTimeTable(fileName=
            "C:/Users/dell/Desktop/NEDC1.mat")),
    redeclare Vehicle_Components.DriverEnvironment driverEnvironment,
    redeclare Vehicle_Components.Engine engine,
    redeclare Vehicle_Components.Battery battery,
    redeclare Vehicle_Components.Motor motor,
    redeclare Vehicle_Components.Transmission transmission,
    redeclare Vehicle_Components.Driveline driveline,
    redeclare Vehicle_Components.Brakes brakes,
    redeclare Vehicle_Components.Chassis chassis,
    redeclare Controllers.MCU mCU);
equation
  connect(chassis.dashboardInformation, driver.dashboardInformation)
    annotation (Line(
      points={{80,-10},{68,-10},{68,40},{-80,40},{-80,79},{-59,79}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-150,-100},{160,100}}), graphics));
end EMT;
