within TDL_v1.ElectricDrives.PMSMsystem.Control;
model signal_deal
  Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(extent = {{46,-10},{68,12}})));
  Modelica.Blocks.Math.Add subtract(k2 = -1) annotation(Placement(transformation(extent = {{-12,-12},{14,14}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(extent = {{-66,-28},{-46,-8}})));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-126,-20},{-86,20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{96,-10},{116,10}})));
equation
  connect(const.y,subtract.u2) annotation(Line(points = {{-45,-18},{-30,-18},{-30,-8},{-14.6,-8},{-14.6,-6.8}}, color = {0,0,127}, smooth = Smooth.None));
  connect(subtract.y,abs1.u) annotation(Line(points = {{15.3,1},{43.8,1}}, color = {0,0,127}, smooth = Smooth.None));
  connect(u,subtract.u1) annotation(Line(points = {{-106,0},{-62,0},{-62,8.800000000000001},{-14.6,8.800000000000001}}, color = {0,0,127}, smooth = Smooth.None));
  connect(abs1.y,y) annotation(Line(points = {{69.09999999999999,1},{86.55,1},{86.55,0},{106,0}}, color = {0,0,127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-66,26},{74,-12}}, lineColor=  {0,0,255}, textString=  "signal_deal")}));
end signal_deal;
