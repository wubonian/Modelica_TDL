within TDL_v1.ElectricDrives.PMSMsystem.Control;
model SectorJudgement
  //sector judgement and caculate N
  Modelica.Blocks.Interfaces.RealInput alfa annotation(Placement(transformation(extent = {{-120,30},{-80,70}})));
  Modelica.Blocks.Interfaces.RealInput beta annotation(Placement(transformation(extent = {{-120,-70},{-80,-30}})));
  Modelica.Blocks.Interfaces.IntegerOutput N annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
protected
  Real a,b,c;
algorithm
  a:=beta;
  b:=sqrt(3) / 2 * alfa - beta / 2;
  c:=(-sqrt(3) / 2 * alfa) - beta / 2;
  N:=4 * sign_sf(c) + 2 * sign_sf(b) + 1 * sign_sf(a);
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-70,38},{72,-38}}, lineColor=  {0,0,255}, textString=  "N_judge")}));
end SectorJudgement;
