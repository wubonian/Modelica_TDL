within TDL_v1.ElectricDrives.PMSMsystem.Control;
model SVPWM
  XYZTimeComputation xYZTimeComputation annotation(Placement(transformation(extent = {{-60,20},{-40,40}})));
  T12TimeComputation t12TimeComputation annotation(Placement(transformation(extent = {{-30,20},{-10,40}})));
  TcmComputation tcmComputation annotation(Placement(transformation(extent = {{-2,20},{18,40}})));
  SVPWMgeneration sVPWMgeneration annotation(Placement(transformation(extent = {{28,20},{48,40}})));
  Modelica.Blocks.Interfaces.RealInput Ualfa annotation(Placement(transformation(extent = {{-128,20},{-88,60}})));
  Modelica.Blocks.Interfaces.RealInput Ubeta annotation(Placement(transformation(extent = {{-128,-60},{-88,-20}})));
  Modelica.Blocks.Interfaces.RealInput Tpwm annotation(Placement(transformation(extent = {{-17,-17},{17,17}}, rotation = -90, origin = {-9,105})));
  Modelica.Blocks.Interfaces.RealInput Vdc annotation(Placement(transformation(extent = {{-18,-18},{18,18}}, rotation = 90, origin = {0,-106})));
  SectorJudgement sectorJudgement annotation(Placement(transformation(extent = {{-60,-40},{-40,-20}})));
  Modelica.Blocks.Interfaces.RealOutput pwm1 annotation(Placement(transformation(extent = {{94,70},{114,90}})));
  Modelica.Blocks.Interfaces.RealOutput pwm3 annotation(Placement(transformation(extent = {{94,42},{114,62}})));
  Modelica.Blocks.Interfaces.RealOutput pwm5 annotation(Placement(transformation(extent = {{94,16},{114,36}})));
  Modelica.Blocks.Interfaces.RealOutput pwm2 annotation(Placement(transformation(extent = {{94,-90},{114,-70}})));
  Modelica.Blocks.Interfaces.RealOutput pwm4 annotation(Placement(transformation(extent = {{94,-58},{114,-38}})));
  Modelica.Blocks.Interfaces.RealOutput pwm6 annotation(Placement(transformation(extent = {{94,-22},{114,-2}})));
equation
  connect(Ualfa,xYZTimeComputation.alfa) annotation(Line(points = {{-108,40},{-80,40},{-80,38},{-60,38}}, color = {0,0,127}, smooth = Smooth.None));
  connect(Ubeta,xYZTimeComputation.beta) annotation(Line(points = {{-108,-40},{-80,-40},{-80,33},{-60,33}}, color = {0,0,127}, smooth = Smooth.None));
  connect(Tpwm,xYZTimeComputation.Tpwm) annotation(Line(points = {{-9,105},{-9,76},{-66,76},{-66,27},{-60,27}}, color = {0,0,127}, smooth = Smooth.None));
  connect(Vdc,xYZTimeComputation.Vdc) annotation(Line(points = {{0,-106},{0,-76},{-66,-76},{-66,22},{-60,22}}, color = {0,0,127}, smooth = Smooth.None));
  connect(xYZTimeComputation.X,t12TimeComputation.X) annotation(Line(points = {{-40,36},{-32,36},{-32,35},{-30,35}}, color = {0,0,127}, smooth = Smooth.None));
  connect(xYZTimeComputation.Y,t12TimeComputation.Y) annotation(Line(points = {{-40,30},{-30,30}}, color = {0,0,127}, smooth = Smooth.None));
  connect(xYZTimeComputation.Z,t12TimeComputation.Z) annotation(Line(points = {{-40,24},{-30,24},{-30,25}}, color = {0,0,127}, smooth = Smooth.None));
  connect(tcmComputation.N,t12TimeComputation.N) annotation(Line(points = {{8,20},{8,-30},{-20,-30},{-20,20}}, color = {255,127,0}, smooth = Smooth.None));
  connect(t12TimeComputation.Tpwm,xYZTimeComputation.Tpwm) annotation(Line(points = {{-20,40},{-20,76},{-66,76},{-66,27},{-60,27}}, color = {0,0,127}, smooth = Smooth.None));
  connect(tcmComputation.Tpwm,xYZTimeComputation.Tpwm) annotation(Line(points = {{8,40},{8,76},{-66,76},{-66,27},{-60,27}}, color = {0,0,127}, smooth = Smooth.None));
  connect(t12TimeComputation.T1,tcmComputation.T1) annotation(Line(points = {{-10,34},{-2,34},{-2,35}}, color = {0,0,127}, smooth = Smooth.None));
  connect(t12TimeComputation.T2,tcmComputation.T2) annotation(Line(points = {{-10,26},{-2,26},{-2,25}}, color = {0,0,127}, smooth = Smooth.None));
  connect(tcmComputation.Tcm1,sVPWMgeneration.Tcm1) annotation(Line(points = {{18,36},{28,36},{28,35}}, color = {0,0,127}, smooth = Smooth.None));
  connect(tcmComputation.Tcm2,sVPWMgeneration.Tcm2) annotation(Line(points = {{18,30},{28,30}}, color = {0,0,127}, smooth = Smooth.None));
  connect(tcmComputation.Tcm3,sVPWMgeneration.Tcm3) annotation(Line(points = {{18,24},{28,24},{28,25}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sectorJudgement.N,t12TimeComputation.N) annotation(Line(points = {{-40,-30},{-20,-30},{-20,20}}, color = {255,127,0}, smooth = Smooth.None));
  connect(sectorJudgement.alfa,xYZTimeComputation.alfa) annotation(Line(points = {{-60,-25},{-76,-25},{-76,38},{-60,38}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sectorJudgement.beta,xYZTimeComputation.beta) annotation(Line(points = {{-60,-35},{-70,-35},{-70,-34},{-80,-34},{-80,33},{-60,33}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sVPWMgeneration.pwm1,pwm1) annotation(Line(points = {{48,38},{54,38},{54,80},{104,80}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sVPWMgeneration.pwm2,pwm2) annotation(Line(points = {{48,35},{60,35},{60,-80},{104,-80}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sVPWMgeneration.pwm3,pwm3) annotation(Line(points = {{48,32},{66,32},{66,52},{104,52}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sVPWMgeneration.pwm4,pwm4) annotation(Line(points = {{48,28},{74,28},{74,-48},{104,-48}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sVPWMgeneration.pwm5,pwm5) annotation(Line(points = {{48,25},{82,25},{82,26},{104,26}}, color = {0,0,127}, smooth = Smooth.None));
  connect(sVPWMgeneration.pwm6,pwm6) annotation(Line(points = {{48,22},{90,22},{90,-12},{104,-12}}, color = {0,0,127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-82,68},{70,-46}}, lineColor=  {0,0,255}, textString=  "SVPWM")}));
end SVPWM;