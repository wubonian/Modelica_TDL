within TDL_v1.Example.EMT.Vehicle_Components;
model Driver
  import TDL_Version2 = TDL_v1;
  extends TDL_Version2.Templates.Drivers.Base(final usingDashboard=true);
  Modelica.Blocks.Sources.Constant B_HEVRequest(k=0)
    annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Modelica.Blocks.Sources.Constant B_ManualMode(k=0)
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Sources.Constant Gear(k=1)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Blocks.Sources.Step RND(height = 1, offset = 1, startTime = 2) annotation(Placement(transformation(extent={{20,-100},
            {40,-80}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    fileName="D:/Library_Update/TDL_Assemble/PHEV/NEDC1.mat",
    tableName="NEDC1") annotation (Placement(transformation(extent={{
            -100,-22},{-80,-2}})));
  Modelica.Blocks.Sources.Constant Reg_Pedal(k=0)
    annotation (Placement(transformation(extent={{100,60},{80,80}})));
  TDL_Version2.Driver.CycleDriver cycleDriver
    annotation (Placement(transformation(extent={{-40,-20},{0,20}})));
  Modelica.Blocks.Math.Gain gain(k=100)
    annotation (Placement(transformation(extent={{20,2},{40,22}})));
  Modelica.Blocks.Math.Gain gain1(k=100)
    annotation (Placement(transformation(extent={{20,-22},{40,-2}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(extent={{-40,-80},{-20,-60}})));
equation

  connect(B_HEVRequest.y, Environment_Interface.B_HEVRequest)
    annotation (Line(
      points={{41,90},{60,90},{60,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(B_ManualMode.y, Environment_Interface.B_ManualMode)
    annotation (Line(
      points={{41,50},{60,50},{60,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(Gear.y, Environment_Interface.Gear) annotation (Line(
      points={{41,-50},{60,-50},{60,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(RND.y, Environment_Interface.RND) annotation (Line(
      points={{41,-90},{60,-90},{60,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(Reg_Pedal.y, Environment_Interface.RegPedal) annotation (Line(
      points={{79,70},{60,70},{60,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(cycleDriver.desiredVehicleSpeed, combiTimeTable.y[1])
    annotation (Line(
      points={{-44,-12},{-79,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, cycleDriver.brakePedalPosition) annotation (Line(
      points={{18,12},{2,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.u, cycleDriver.acceleratorPedalPosition) annotation (
      Line(
      points={{18,-12},{2,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, Environment_Interface.Brake_Pedal) annotation (Line(
      points={{41,12},{60,12},{60,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(gain1.y, Environment_Interface.Acc_Pedal) annotation (Line(
      points={{41,-12},{60,-12},{60,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(booleanConstant.y, cycleDriver.reset) annotation (Line(
      points={{-39,-50},{-32,-50},{-32,-24},{-32,-24}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(const.y, cycleDriver.resetValue) annotation (Line(
      points={{-19,-70},{-8,-70},{-8,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cycleDriver.vehicleSpeed, dashboardInformation.Vehicle_Speed)
    annotation (Line(
      points={{-44,12},{-90,12},{-90,90}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end Driver;
