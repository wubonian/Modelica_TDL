within TDL_v1.ElectricDrives2.Template;
model Template
  CurrentReferenceGenerator.CurrentReferenceGenerator_FW FW
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  CurrentControl.CurrentControl currentControl
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  AbsoluteValue absoluteValue
    annotation (Placement(transformation(extent={{0,40},{-20,60}})));
equation
  connect(FW.Id, currentControl.Id_ref) annotation (Line(
      points={{-39,16},{-22,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(FW.Iq, currentControl.Iq_ref) annotation (Line(
      points={{-39,4},{-22,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(absoluteValue.u_re, currentControl.Ud_ref) annotation (Line(
      points={{2,56},{10,56},{10,16},{1,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(currentControl.Uq_ref, absoluteValue.u_im) annotation (Line(
      points={{1,4},{14,4},{14,44},{2,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(absoluteValue.y_abs, FW.Udq) annotation (Line(
      points={{-21,50},{-72,50},{-72,16},{-62,16}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end Template;
