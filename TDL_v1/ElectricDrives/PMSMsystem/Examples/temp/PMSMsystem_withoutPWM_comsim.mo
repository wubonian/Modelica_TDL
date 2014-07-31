within TDL_v1.ElectricDrives.PMSMsystem.Examples.temp;
model PMSMsystem_withoutPWM_comsim
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent={{-212,
            -54},{-188,-30}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 336) annotation(Placement(transformation(extent={{-21,-21},
            {21,21}},                                                                                                    rotation = 270, origin={-199,-3})));
  system.PMSM_withoutPWM pMSM_withoutPWM
    annotation (Placement(transformation(extent={{-164,-66},{-6,46}})));
  system.PMSMControl_comsim pMSMControl_comsim
    annotation (Placement(transformation(extent={{-434,-60},{-342,14}})));
  Modelica.Blocks.Sources.Constant Tm_tar(k=20)
    annotation (Placement(transformation(extent={{-522,-6},{-502,14}})));
  Modelica.Blocks.Sources.Constant T_or_n(k=2) annotation (Placement(
        transformation(extent={{-522,-36},{-502,-16}})));
  Modelica.Blocks.Sources.Constant Nm_tar(k=2000) annotation (Placement(
        transformation(extent={{-520,-68},{-500,-48}})));
  Modelica.Blocks.Sources.Constant F_or_R(k=2) annotation (Placement(
        transformation(extent={{-524,-102},{-504,-82}})));
equation
  connect(ground.p,constantVoltage.n) annotation(Line(points={{-200,-30},{
          -200,-24},{-199,-24}},                                                                       color = {0,0,255}, smooth = Smooth.None));
  connect(constantVoltage.p, pMSM_withoutPWM.pin_p) annotation (Line(
      points={{-199,18},{-164,18},{-164,20.3059}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantVoltage.n, pMSM_withoutPWM.pin_n) annotation (Line(
      points={{-199,-24},{-198,-24},{-198,-33.0588},{-164,-33.0588}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pMSM_withoutPWM.i_a, pMSMControl_comsim.ia) annotation (Line(
      points={{-144.25,-68.6353},{-144.25,-80},{-362,-80},{-362,-61.7412},{-362.125,-61.7412}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM.i_b, pMSMControl_comsim.ib) annotation (Line(
      points={{-124.5,-68.6353},{-124.5,-80},{-124,-80},{-124,-92},{-388,-92},{-388,-61.7412}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM.i_c, pMSMControl_comsim.ic) annotation (Line(
      points={{-104.75,-68.6353},{-104.75,-110},{-416.75,-110},{-416.75,-61.3059}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM.theta_m, pMSMControl_comsim.theta_m)
    annotation (Line(
      points={{-60.3125,-67.9765},{-60.3125,-130},{-373.337,-130},{-373.337,15.3059}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSM_withoutPWM.spd, pMSMControl_comsim.spd) annotation (Line(
      points={{-35.625,-67.9765},{-36,-67.9765},{-36,-144},{-405.25,-144},{-405.25,15.7412}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl_comsim.ua, pMSM_withoutPWM.ua) annotation (Line(
      points={{-339.988,0.941176},{-339.988,0},{-234,0},{-234,68},{-124.5,68},{-124.5,49.2941}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl_comsim.ub, pMSM_withoutPWM.ub) annotation (Line(
      points={{-339.7,-20.3882},{-258,-20.3882},{-258,80},{-85,80},{-85,49.2941}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pMSMControl_comsim.uc, pMSM_withoutPWM.uc) annotation (Line(
      points={{-339.556,-42.3706},{-276,-42.3706},{-276,90},{-50.4375,90},{-50.4375,49.9529}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tm_tar.y, pMSMControl_comsim.Torque_require) annotation (Line(
      points={{-501,4},{-468,4},{-468,3.11765},{-435.438,3.11765}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_or_n.y, pMSMControl_comsim.Trq_or_Spd) annotation (Line(
      points={{-501,-26},{-474,-26},{-474,-18},{-435.725,-18},{-435.725,-14.7294}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Nm_tar.y, pMSMControl_comsim.targetSpd) annotation (Line(
      points={{-499,-58},{-482,-58},{-482,-50},{-458,-50},{-458,-33.0118},{-435.438,-33.0118}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(F_or_R.y, pMSMControl_comsim.F_or_R) annotation (Line(
      points={{-503,-92},{-452,-92},{-452,-51.2941},{-435.438,-51.2941}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(Diagram(coordinateSystem(extent={{-540,-200},{100,140}},   preserveAspectRatio=false),   graphics), Icon(coordinateSystem(extent = {{-540,-200},{100,140}}, preserveAspectRatio = false), graphics), experiment(StartTime = 0, StopTime = 0.2, Tolerance = 1e-006));
end PMSMsystem_withoutPWM_comsim;
