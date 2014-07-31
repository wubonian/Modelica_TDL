within TDL_v1.Templates.Examples;
model EMT

  replaceable TDL_v1.Templates.Transmission.Base transmission(usingMotor=true)
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  replaceable TDL_v1.Templates.Engine.Base engine(usingAccessories=false)
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  replaceable TDL_v1.Templates.ElectricDrives.Base motor
    annotation (Placement(transformation(extent={{-74,-60},{-54,-40}})));
  replaceable TDL_v1.Templates.EnergyStorage.Base battery
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
  replaceable TDL_v1.Templates.Drivelines.TwoAxleBase driveline
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  replaceable TDL_v1.Templates.Brakes.TwoAxleBase brakes
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  replaceable TDL_v1.Templates.Chassis.TwoAxleBase chassis
    annotation (Placement(transformation(extent={{80,-20},{112,0}})));
  Bus.MessageBus.MessageControlBus messageBus annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = -90, origin = {-140,30})));
  replaceable TDL_v1.Templates.Controllers.Base mCU annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={130,30})));
  replaceable TDL_v1.Templates.Drivers.Base driver
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  replaceable TDL_v1.Templates.DriverEnvironment.DriverEnvironment driverEnvironment
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
equation
  connect(engine.transmissionFlange,transmission.engineFlange) annotation(Line(points = {{-80,-10},{-40,-10}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(motor.shaft_b,transmission.motorFlange) annotation(Line(points = {{-54,-50},{-50,-50},{-50,-16},{-40,-16}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(battery.pin_p,motor.pin_p) annotation(Line(points = {{-100,-42},{-74,-42}}, color = {0,0,255}, smooth = Smooth.None));
  connect(battery.pin_n,motor.pin_n) annotation(Line(points = {{-100,-58},{-74,-58}}, color = {0,0,255}, smooth = Smooth.None));
  connect(transmission.drivelineFlange,driveline.transmissionFlange) annotation(Line(points = {{-20,-10},{0,-10}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(driveline.wheelHub_2,brakes.wheelHub_2) annotation(Line(points = {{4,0},{4,10},{44,10},{44,0}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(chassis.wheelHub_2,driveline.wheelHub_2) annotation(Line(points = {{87,0},{88,0},{88,10},{4,10},{4,0}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(driveline.wheelHub_1,brakes.wheelHub_1) annotation(Line(points = {{4,-20},{4,-28},{44,-28},{44,-20}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(chassis.wheelHub_1,driveline.wheelHub_1) annotation(Line(points = {{87,-20},{88,-20},{88,-28},{4,-28},{4,-20}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(driveline.wheelHub_4,brakes.wheelHub_4) annotation(Line(points = {{16,0},{16,16},{56,16},{56,0}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(driveline.wheelHub_4,chassis.wheelHub_4) annotation(Line(points = {{16,0},{16,16},{105,16},{105,0}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(driveline.wheelHub_3,brakes.wheelHub_3) annotation(Line(points = {{16,-20},{16,-34},{56,-34},{56,-20}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(driveline.wheelHub_3,chassis.wheelHub_3) annotation(Line(points = {{16,-20},{16,-34},{105,-34},{105,-20}}, color = {135,135,135}, thickness = 0.5, smooth = Smooth.None));
  connect(messageBus,battery.messageBus) annotation(Line(points = {{-140,30},{-118,30},{-118,-40}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6,3},{-6,3}}));
  connect(messageBus,engine.messageBus) annotation(Line(points = {{-140,30},{-96,30},{-96,0}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6,3},{-6,3}}));
  connect(messageBus,motor.messageBus) annotation(Line(points = {{-140,30},{-72,30},{-72,-40}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6,3},{-6,3}}));
  connect(messageBus,transmission.messageBus) annotation(Line(points = {{-140,30},{-36,30},{-36,0}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6,3},{-6,3}}));
  connect(messageBus,driveline.messageBus) annotation(Line(points = {{-140,30},{-10,30},{-10,-3},{0,-3}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6,3},{-6,3}}));
  connect(messageBus,brakes.messageBus) annotation(Line(points = {{-140,30},{34,30},{34,-4},{40,-4}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6,3},{-6,3}}));
  connect(messageBus,chassis.messageBus) annotation(Line(points = {{-140,30},{72,30},{72,-2},{80,-2}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6,3},{-6,3}}));
  connect(mCU.messageBus,messageBus) annotation(Line(points = {{120,30},{-140,30}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%second", index = 1, extent = {{6,3},{6,3}}));
  connect(driver.Environment_Interface,driverEnvironment.Environment_Interface) annotation(Line(points = {{-40,70},{-20,70}}, color = {85,85,255}, thickness = 0.5, smooth = Smooth.None));
  connect(driverEnvironment.messageBus,messageBus) annotation(Line(points = {{0,70},{20,70},{20,30},{-140,30}}, color = {255,204,51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%second", index = 1, extent = {{6,3},{6,3}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-150,
            -100},{160,100}}),                                                                        graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-150,-100},{160,100}})));
end EMT;
