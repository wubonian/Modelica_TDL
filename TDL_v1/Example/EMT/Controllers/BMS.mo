within TDL_v1.Example.EMT.Controllers;
model BMS
  extends TDL_v1.Templates.Controllers.Base;

  CoSimulation.Interface_dll_2 BMS_Simulink(
    dll_name_ex="BMS_win32.dll",
    init_name_ex="BMS_initialize",
    step_name_ex="BMS_step",
    ter_name_ex="BMS_terminate",
    in_name_ex="BMS_U",
    out_name_ex="BMS_Y",
    in_num_ex=1,
    out_num_ex=1,
    samplePeriod=0.005) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={3.55271e-015,3.55271e-015})));
  Modelica.Blocks.Interfaces.RealInput SOC annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,100})));
equation
  connect(BMS_Simulink.y[1], messageBus.BMS_Message) annotation (Line(
      points={{0,-20},{0,-100}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(SOC, BMS_Simulink.u[1]) annotation (Line(
      points={{0,100},{0,20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end BMS;
