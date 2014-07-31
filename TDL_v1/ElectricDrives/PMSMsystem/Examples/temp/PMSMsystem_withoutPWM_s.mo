within TDL_v1.ElectricDrives.PMSMsystem.Examples.temp;
model PMSMsystem_withoutPWM_s

  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent={{-212,
            -54},{-188,-30}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 336) annotation(Placement(transformation(extent={{-21,-21},
            {21,21}},                                                                                                    rotation = 270, origin={-199,-3})));
  system.PMSMControl pMSMControl
    annotation (Placement(transformation(extent={{-442,-54},{-302,56}})));
  system.PMSM_withoutPWM_s pMSM_withoutPWM_s
    annotation (Placement(transformation(extent={{-164,-66},{-6,46}})));
  Modelica.Blocks.Sources.Constant Tm_req(k=20)
    annotation (Placement(transformation(extent={{-480,74},{-460,94}})));
  Modelica.Blocks.Sources.Constant Tm_or_Spd(k=2)
    annotation (Placement(transformation(extent={{-506,18},{-486,38}})));
  Modelica.Blocks.Sources.Constant Nm_req(k=2000)
    annotation (Placement(transformation(extent={{-522,-28},{-502,-8}})));
  Modelica.Blocks.Sources.Constant F_R(k=2)
    annotation (Placement(transformation(extent={{-522,-78},{-502,-58}})));
equation
  connect(ground.p,constantVoltage.n) annotation(Line(points={{-200,-30},{
          -200,-24},{-199,-24}},                                                                       color = {0,0,255}, smooth = Smooth.None));
  connect(constantVoltage.p, pMSM_withoutPWM_s.pin_p) annotation (Line(
      points={{-199,18},{-164,18},{-164,20.3059}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantVoltage.n, pMSM_withoutPWM_s.pin_n) annotation (Line(
      points={{-199,-24},{-198,-24},{-198,-33.0588},{-164,-33.0588}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pMSMControl.ua, pMSM_withoutPWM_s.ua) annotation (Line(
      points={{-329.125,30.7647},{-180,30.7647},{-180,68},{-124.5,68},{-124.5,49.2941}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(pMSMControl.ub, pMSM_withoutPWM_s.ub) annotation (Line(
      points={{-328.688,22.3529},{-238,22.3529},{-238,80},{-85,80},{-85,49.2941}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.uc, pMSM_withoutPWM_s.uc) annotation (Line(
      points={{-328.688,13.2941},{-258,13.2941},{-258,92},{-50.4375,92},{-50.4375,
          49.9529}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM_s.i_a, pMSMControl.ia) annotation (Line(
      points={{-144.25,-68.6353},{-144.25,-100},{-353.625,-100},{-353.625,-41.0588}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM_s.i_b, pMSMControl.ib) annotation (Line(
      points={{-124.5,-68.6353},{-124.5,-90},{-333.938,-90},{-333.938,-41.0588}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(pMSM_withoutPWM_s.i_c, pMSMControl.ic) annotation (Line(
      points={{-104.75,-68.6353},{-104.75,-78},{-312,-78},{-312,-68},{-311.188,-68},{
          -311.188,-41.0588}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM_s.theta_m, pMSMControl.theta_m) annotation (Line(
      points={{-60.3125,-67.9765},{-60.3125,-114},{-405.688,-114},{-405.688,-41.0588}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM_s.spd, pMSMControl.spd) annotation (Line(
      points={{-35.625,-67.9765},{-35.625,-124},{-425.813,-124},{-425.813,-41.0588}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(pMSMControl.Torque_require, Tm_req.y) annotation (Line(
      points={{-443.75,43.7059},{-452,43.7059},{-452,84},{-459,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.Trq_or_Spd, Tm_or_Spd.y) annotation (Line(
      points={{-444.188,27.5294},{-464,27.5294},{-464,28},{-485,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.targetSpd, Nm_req.y) annotation (Line(
      points={{-444.188,1.64706},{-472,1.64706},{-472,-18},{-501,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl.F_or_R, F_R.y) annotation (Line(
      points={{-444.188,-34.5882},{-444.188,-40},{-444,-40},{-444,-44},{-501,-44},{-501,
          -68}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(extent={{-540,-200},{100,140}},   preserveAspectRatio=false),   graphics), Icon(coordinateSystem(extent = {{-540,-200},{100,140}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSMsystem_withoutPWM_s;
