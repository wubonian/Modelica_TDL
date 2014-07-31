within TDL_v1.ElectricDrives.PMSMsystem.system;
model PMSMControl_comsim

  Modelica.Blocks.Interfaces.RealInput Torque_require
    annotation (Placement(transformation(extent={{-570,70},{-530,110}})));
  Modelica.Blocks.Interfaces.RealInput targetSpd
    annotation (Placement(transformation(extent={{-570,-96},{-530,-56}})));
  Modelica.Blocks.Interfaces.RealInput Trq_or_Spd
    annotation (Placement(transformation(extent={{-572,-12},{-532,28}})));
  Modelica.Blocks.Interfaces.RealInput F_or_R annotation (Placement(
        transformation(extent={{-570,-180},{-530,-140}})));
  Modelica.Blocks.Interfaces.RealInput theta_m annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-118,146})));
  Modelica.Blocks.Interfaces.RealInput ia annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-40,-208})));
  Modelica.Blocks.Interfaces.RealInput ib annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-220,-208})));
  Modelica.Blocks.Interfaces.RealInput ic annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-420,-206})));
  Modelica.Blocks.Interfaces.RealOutput ua
    annotation (Placement(transformation(extent={{100,66},{128,94}})));
  Modelica.Blocks.Interfaces.RealOutput ub
    annotation (Placement(transformation(extent={{100,-34},{132,-2}})));
  Modelica.Blocks.Interfaces.RealOutput uc
    annotation (Placement(transformation(extent={{100,-136},{134,-102}})));
  Modelica.Blocks.Interfaces.RealInput spd annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-340,148})));
  TDL_v1.CoSimulation.Interface_dll MCU(
    dll_name_ex="MCU_win32.dll",
    init_name_ex="MCU_initialize",
    step_name_ex="MCU_step",
    ter_name_ex="MCU_terminate",
    in_name_ex="MCU_U",
    out_name_ex="MCU_Y",
    in_num_ex=9,
    out_num_ex=3,
    samplePeriod=0.0001)
    annotation (Placement(transformation(extent={{-284,-78},{-172,34}})));
equation
  connect(ia, MCU.u[1]) annotation (Line(
      points={{-40,-208},{-38,-208},{-38,-92},{-318,-92},{-318,-18},{
          -288,-18},{-288,-29.9556},{-284,-29.9556},{-284,-26.9778}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ib, MCU.u[2]) annotation (Line(
      points={{-220,-208},{-218,-208},{-218,-110},{-378,-110},{-378,-18},
          {-284,-18},{-284,-25.7333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ic, MCU.u[3]) annotation (Line(
      points={{-420,-206},{-420,-18},{-288,-18},{-288,-24.4889},{-284,
          -24.4889}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theta_m, MCU.u[4]) annotation (Line(
      points={{-118,146},{-118,66},{-318,66},{-318,-18},{-284,-18},{
          -284,-23.2444}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spd, MCU.u[5]) annotation (Line(
      points={{-340,148},{-340,-18},{-288,-18},{-288,-22},{-284,-22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Torque_require, MCU.u[6]) annotation (Line(
      points={{-550,90},{-378,90},{-378,-18},{-290,-18},{-290,-20.7556},
          {-284,-20.7556}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Trq_or_Spd, MCU.u[7]) annotation (Line(
      points={{-552,8},{-504,8},{-504,-18},{-284,-18},{-284,-19.5111}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(targetSpd, MCU.u[8]) annotation (Line(
      points={{-550,-76},{-514,-76},{-514,-78},{-456,-78},{-456,-18},{
          -284,-18},{-284,-18.2667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(F_or_R, MCU.u[9]) annotation (Line(
      points={{-550,-160},{-438,-160},{-438,-18},{-284,-18},{-284,
          -17.0222}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(MCU.y[1], ua) annotation (Line(
      points={{-172,-25.7333},{-172,-18},{30,-18},{30,80},{114,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MCU.y[2], ub) annotation (Line(
      points={{-172,-22},{-174,-22},{-174,-18},{116,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MCU.y[3], uc) annotation (Line(
      points={{-172,-18.2667},{-138,-18.2667},{-138,-18},{30,-18},{30,
          -120},{117,-120},{117,-119}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(extent={{-540,-200},{100,140}},   preserveAspectRatio=false),   graphics), Icon(coordinateSystem(extent = {{-540,-200},{100,140}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSMControl_comsim;
