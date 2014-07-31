within TDL_v1.Engine.Experiments;
model test_Engine

  Engine engine(inertia(J=0.1),
                              bearingFriction(peak=1, tau_pos=[0,5]))
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
  CoSimulation.Interface_dll_2 interface_dll(
    dll_name_ex="EMS_Signal_win32.dll",
    init_name_ex="EMS_Signal_initialize",
    step_name_ex="EMS_Signal_step",
    ter_name_ex="EMS_Signal_terminate",
    in_name_ex="EMS_Signal_U",
    out_name_ex="EMS_Signal_Y",
    out_num_ex=2,
    samplePeriod=0.005,
    in_num_ex=4)
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Modelica.Blocks.Sources.Step TeReq(
    height=-30,
    offset=30,
    startTime=2)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  Modelica.Blocks.Sources.Constant start_stop(k=1)
    annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
equation
  connect(interface_dll.y[1], engine.torque_req) annotation (Line(
      points={{40,-10.5},{50,-10.5},{50,-10},{60,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(start_stop.y, interface_dll.u[1]) annotation (Line(
      points={{-29,-10},{-4,-10},{-4,-10.75},{20,-10.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TeReq.y, interface_dll.u[2]) annotation (Line(
      points={{-29,-50},{-4,-50},{-4,-10.25},{20,-10.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(engine.speed_act_rpm, interface_dll.u[3]) annotation (Line(
      points={{66,0},{66,32},{-4,32},{-4,-9.75},{20,-9.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(engine.torque_act, interface_dll.u[4]) annotation (Line(
      points={{74,0},{74,40},{-12,40},{-12,-9.25},{20,-9.25}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(extent={{
            -100,-100},{100,100}})));
end test_Engine;
