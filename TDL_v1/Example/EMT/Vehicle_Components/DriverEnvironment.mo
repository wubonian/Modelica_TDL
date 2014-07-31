within TDL_v1.Example.EMT.Vehicle_Components;
model DriverEnvironment
  extends TDL_v1.Templates.DriverEnvironment.DriverEnvironment(
    final includeDriverSeat=false,
    final includeSteeringWheel=false,
    final includeAcceleratorPedal=false,
    final includeBrakePedal=false,
    final includeClutchPedal=false,
    final includeManualShiftConnector=false);
  Controllers.HMI hMI annotation (Placement(transformation(
        extent={{-40,-25},{40,25}},
        rotation=90,
        origin={15,0})));
  Modelica.Blocks.Sources.Constant B_VCUReady(k=1) annotation (
      Placement(transformation(extent={{-100,-60},{-80,-40}})));
equation

  connect(hMI.messageBus, messageBus) annotation (Line(
      points={{40,-1.33227e-015},{70,-1.33227e-015},{70,0},{100,0}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.Acc_Pedal, Environment_Interface.Acc_Pedal) annotation (
      Line(
      points={{-10,28},{-80,28},{-80,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.BrakePedal, Environment_Interface.Brake_Pedal)
    annotation (Line(
      points={{-10,-4},{-80,-4},{-80,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.Gear, Environment_Interface.Gear) annotation (Line(
      points={{-10,-12},{-80,-12},{-80,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.RND, Environment_Interface.RND) annotation (Line(
      points={{-10,-20},{-80,-20},{-80,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.RegPedal, Environment_Interface.RegPedal) annotation (
      Line(
      points={{-10,-28},{-80,-28},{-80,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.B_ManualMode, Environment_Interface.B_ManualMode)
    annotation (Line(
      points={{-10,12},{-80,12},{-80,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.B_HEVRequest, Environment_Interface.B_HEVRequest)
    annotation (Line(
      points={{-10,20},{-80,20},{-80,0},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hMI.B_VCUReady, B_VCUReady.y) annotation (Line(
      points={{-10,4},{-20,4},{-20,-50},{-79,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end DriverEnvironment;
