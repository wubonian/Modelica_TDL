within TDL_v1.Example.EMT.Vehicle_Components;
model Chassis
  extends TDL_v1.Templates.Chassis.TwoAxleBase(
    final usingMultiBodyDriveline=false,
    final usingSteeringWheel=false,
    final usingChassisFrame=false,
    final usingDashboard=true);

  Wheel.Ideal_Wheel FR_W(radius=0.3)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Wheel.Ideal_Wheel FL_W(radius=0.3) annotation (Placement(
        transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Mechanics.Rotational.Components.Inertia frontRight_Wheel(J=
        0.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-90,70})));
  Modelica.Mechanics.Rotational.Components.Inertia frontLeft_Wheel(J=
        0.1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-90,-70})));
  Modelica.Mechanics.Rotational.Components.Inertia rearRight_Wheel(J=
        0.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={90,70})));
  Modelica.Mechanics.Rotational.Components.Inertia rearLeft_Wheel(J=0.1)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={90,-70})));
  Wheel.Ideal_Wheel RR_W(radius=0.3)
    annotation (Placement(transformation(extent={{80,40},{60,60}})));
  Wheel.Ideal_Wheel RL_W(radius=0.3)
    annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
  MechanicalActuator.Sensor_Actuator.VelocitySensor_kmh
    velocitySensor_kmh
    annotation (Placement(transformation(extent={{102,-10},{122,10}})));
  TDL.Vehicle.VehicleSimple vehicleSimple(Vehicle(m=1500))
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
equation
  connect(frontRight_Wheel.flange_a, wheelHub_2.flange) annotation (
      Line(
      points={{-90,80},{-90,100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(FR_W.flangeR, frontRight_Wheel.flange_b) annotation (Line(
      points={{-80,50},{-90,50},{-90,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(frontLeft_Wheel.flange_a, wheelHub_1.flange) annotation (Line(
      points={{-90,-80},{-90,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(frontLeft_Wheel.flange_b, FL_W.flangeR) annotation (Line(
      points={{-90,-60},{-90,-50},{-80,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rearRight_Wheel.flange_a, wheelHub_4.flange) annotation (Line(
      points={{90,80},{90,100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rearLeft_Wheel.flange_a, wheelHub_3.flange) annotation (Line(
      points={{90,-80},{90,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(RR_W.flangeR, rearRight_Wheel.flange_b) annotation (Line(
      points={{80,50},{90,50},{90,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(RL_W.flangeR, rearLeft_Wheel.flange_b) annotation (Line(
      points={{80,-50},{90,-50},{90,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(velocitySensor_kmh.flange_a, RR_W.flangeT) annotation (Line(
      points={{102,0},{60,0},{60,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(velocitySensor_kmh.kmh, dashboardInformation.Vehicle_Speed)
    annotation (Line(
      points={{122,0},{140,0},{140,-28},{-160,-28},{-160,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(vehicleSimple.flange, FR_W.flangeT) annotation (Line(
      points={{-19.6,0},{-60,0},{-60,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(vehicleSimple.flange, FL_W.flangeT) annotation (Line(
      points={{-19.6,0},{-60,0},{-60,-50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(vehicleSimple.flange, RR_W.flangeT) annotation (Line(
      points={{-19.6,0},{-20,0},{-20,50},{60,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(vehicleSimple.flange, RL_W.flangeT) annotation (Line(
      points={{-19.6,0},{-20,0},{-20,-50},{60,-50}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -100},{160,100}}), graphics));
end Chassis;
