within TDL_v1.Example.EMT.Controllers;
model ABS
  extends TDL_v1.Templates.Controllers.Base;
  CoSimulation.Interface_dll_2 ABS_Simulink(
    dll_name_ex="ABS_win32.dll",
    init_name_ex="ABS_initialize",
    step_name_ex="ABS_step",
    ter_name_ex="ABS_terminate",
    in_name_ex="ABS_U",
    out_name_ex="ABS_y",
    in_num_ex=2,
    samplePeriod=0.005,
    out_num_ex=3)       annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={0,0})));
  Modelica.Blocks.Interfaces.RealInput Vehicle_Spd annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput Brake_Pedal
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(ABS_Simulink.u[2], messageBus.HMI_Message) annotation (Line(
      points={{-20,1},{-40,1},{-40,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(ABS_Simulink.y[1], messageBus.ABS_Message) annotation (Line(
      points={{20,-1.33333},{40,-1.33333},{40,-100},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(Vehicle_Spd, ABS_Simulink.u[1]) annotation (Line(
      points={{-100,0},{-60,0},{-60,-1},{-20,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Brake_Pedal, ABS_Simulink.y[2]) annotation (Line(
      points={{100,0},{60,0},{60,1.11022e-016},{20,1.11022e-016}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end ABS;
