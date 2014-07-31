within TDL_v1.ElectricDrives.PMSMsystem.Examples.temp;
model test_interface_steptime
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.3) annotation(Placement(transformation(extent = {{26,10},{46,30}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{-20,10},{0,30}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{60,10},{80,30}})));
  CoSimulation.Interface_dll interface_dll(samplePeriod = 0.1) annotation(Placement(visible = true, transformation(origin = {-60,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(speedSensor.w,interface_dll.u[1]) annotation(Line(points={{81,20},
          {86,20},{86,0},{-80,0},{-80,18.4},{-70,18.4}},                                                                 color = {0,0,127}));
  connect(interface_dll.y[1],torque.tau) annotation(Line(points={{-50,
          19.3333},{-36,19.3333},{-36,20},{-22,20}},                                   color = {0,0,127}));
  connect(torque.flange,inertia.flange_a) annotation(Line(points = {{0,20},{26,20}}, color = {0,0,0}, smooth = Smooth.None));
  connect(inertia.flange_b,speedSensor.flange) annotation(Line(points = {{46,20},{60,20}}, color = {0,0,0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-006, Interval = 0.1));
end test_interface_steptime;
