within TDL_v1.Driver;
model CycleDriver2
  extends Modelica.Blocks.Interfaces.BlockIcon;
  parameter Real k=1 "Gain of PI controller";
  parameter Modelica.SIunits.Time T=1 "Time constant of PI controller";
  //parameter Real initialCond=0.1 "Initial output from PI controller";

public
  Modelica.Blocks.Interfaces.RealOutput acceleratorPedalPosition(unit="1")
    "Normalized accelerator pedal position (0=fully released ... 1=fully pressed)"
                                         annotation (Placement(transformation(
          extent={{100,-70},{120,-50}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput brakePedalPosition(unit="1")
    "Normalized brake pedal position (0=fully released ... 1=fully pressed)"
                                      annotation (Placement(transformation(
          extent={{100,50},{120,70}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vehicleSpeed
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}, rotation=
           0)));
  Modelica.Blocks.Interfaces.RealInput desiredVehicleSpeed
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}},
          rotation=0)));

  CoSimulation.Interface_dll_2 CycleDriver(
    in_num_ex=2,
    out_num_ex=2,
    samplePeriod=0.005)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
equation

  connect(CycleDriver.u[1], vehicleSpeed) annotation (Line(
      points={{-20,-1},{-50,-1},{-50,60},{-120,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CycleDriver.u[2], desiredVehicleSpeed) annotation (Line(
      points={{-20,1},{-50,1},{-50,-60},{-120,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CycleDriver.y[1], brakePedalPosition) annotation (Line(
      points={{20,-1},{50,-1},{50,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CycleDriver.y[2], acceleratorPedalPosition) annotation (Line(
      points={{20,1},{50,1},{50,-60},{110,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Line(points={{-80,-80},{-60,-80},{-12,14},{36,14},{70,-10}}, color={0,0,
              255}),
        Line(points={{-80,-80},{-60,-80},{-52,-72},{-40,-54},{-28,-6},{-18,16},
              {-10,20},{2,18},{19,14},{36,14},{57,6},{70,-8}}, color={255,0,0}),
        Text(
          extent={{-5,68},{86,51}},
          lineColor={0,0,0},
          textString="brake..."),
        Text(
          extent={{0,-52},{91,-69}},
          lineColor={0,0,0},
          textString="acc...")}), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics));
end CycleDriver2;
