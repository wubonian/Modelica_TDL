within TDL_v1.ElectricDrives.PMSMsystem.Coordinate_Transformation;
model inv_Park
  Modelica.Blocks.Interfaces.RealInput u_d annotation(Placement(transformation(extent = {{-120,40},{-80,80}})));
  Modelica.Blocks.Interfaces.RealInput u_q annotation(Placement(transformation(extent = {{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput theta annotation(Placement(transformation(extent = {{-120,-80},{-80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput u_alfa annotation(Placement(transformation(extent = {{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.RealOutput u_beta annotation(Placement(transformation(extent = {{90,-50},{110,-30}})));
algorithm
  u_alfa:=u_d * cos(theta) - u_q * sin(theta);
  u_beta:=u_d * sin(theta) + u_q * cos(theta);
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-66,60},{78,-30}}, lineColor=  {0,0,255}, textString=  "inv_Park")}));
end inv_Park;
