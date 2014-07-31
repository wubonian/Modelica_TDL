within TDL_v1.ElectricDrives.PMSMsystem.Coordinate_Transformation;
model Clarke
  Modelica.Blocks.Interfaces.RealInput i_a annotation(Placement(transformation(extent = {{-120,40},{-80,80}})));
  Modelica.Blocks.Interfaces.RealInput i_b annotation(Placement(transformation(extent = {{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput i_c annotation(Placement(transformation(extent = {{-120,-80},{-80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput i_alfa annotation(Placement(transformation(extent = {{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.RealOutput i_beta annotation(Placement(transformation(extent = {{90,-30},{110,-10}})));
algorithm
  i_alfa:=(i_a - 0.5 * (i_b + i_c)) * 2 / 3;
  i_beta:=(i_b - i_c) * sqrt(3) / 3;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-76,48},{74,-24}}, lineColor=  {0,0,255}, textString=  "Clark")}));
end Clarke;
