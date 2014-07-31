within TDL_v1.ElectricDrives.PMSMsystem.Coordinate_Transformation;
model inv_Clarke
  Modelica.Blocks.Interfaces.RealOutput i_a annotation(Placement(transformation(extent = {{94,60},{134,100}})));
  Modelica.Blocks.Interfaces.RealOutput i_b annotation(Placement(transformation(extent = {{94,-20},{134,20}})));
  Modelica.Blocks.Interfaces.RealOutput i_c annotation(Placement(transformation(extent = {{94,-100},{134,-60}})));
  Modelica.Blocks.Interfaces.RealInput i_alfa annotation(Placement(transformation(extent = {{-114,50},{-94,70}})));
  Modelica.Blocks.Interfaces.RealInput i_beta annotation(Placement(transformation(extent = {{-114,-70},{-94,-50}})));
algorithm
  i_a:=i_alfa;
  i_b:=(-1 / 2 * i_alfa) + sqrt(3) / 2 * i_beta;
  i_c:=(-1 / 2 * i_alfa) - sqrt(3) / 2 * i_beta;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-82,40},{78,-44}}, lineColor=  {0,0,255}, textString=  "inv_Clark")}));
end inv_Clarke;
