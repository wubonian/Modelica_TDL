within TDL_v1.ElectricDrives.PMSMsystem.Coordinate_Transformation;
model Park
  Modelica.Blocks.Interfaces.RealInput i_alfa annotation(Placement(transformation(extent = {{-120,40},{-80,80}})));
  Modelica.Blocks.Interfaces.RealInput i_beta annotation(Placement(transformation(extent = {{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput theta annotation(Placement(transformation(extent = {{-120,-80},{-80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput i_d annotation(Placement(transformation(extent = {{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.RealOutput i_q annotation(Placement(transformation(extent = {{90,-50},{110,-30}})));
algorithm
  i_d:=i_alfa * cos(theta) + i_beta * sin(theta);
  i_q:=i_beta * cos(theta) - i_alfa * sin(theta);
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-66,60},{74,-40}}, lineColor=  {0,0,255}, textString=  "Park")}));
end Park;
