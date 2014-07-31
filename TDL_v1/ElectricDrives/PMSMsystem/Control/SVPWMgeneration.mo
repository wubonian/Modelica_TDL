within TDL_v1.ElectricDrives.PMSMsystem.Control;
model SVPWMgeneration
  extends TriangleWave;
  Real TcmMat[3] = {y - Tcm1,y - Tcm2,y - Tcm3};
  Modelica.Blocks.Interfaces.RealInput Tcm1 annotation(Placement(transformation(extent = {{-120,30},{-80,70}})));
  Modelica.Blocks.Interfaces.RealInput Tcm2 annotation(Placement(transformation(extent = {{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput Tcm3 annotation(Placement(transformation(extent = {{-120,-70},{-80,-30}})));
  Modelica.Blocks.Interfaces.RealOutput pwm1 annotation(Placement(transformation(extent = {{90,70},{110,90}})));
  Modelica.Blocks.Interfaces.RealOutput pwm2 annotation(Placement(transformation(extent = {{90,40},{110,60}})));
  Modelica.Blocks.Interfaces.RealOutput pwm3 annotation(Placement(transformation(extent = {{90,10},{110,30}})));
  Modelica.Blocks.Interfaces.RealOutput pwm4 annotation(Placement(transformation(extent = {{90,-30},{110,-10}})));
  Modelica.Blocks.Interfaces.RealOutput pwm5 annotation(Placement(transformation(extent = {{90,-60},{110,-40}})));
  Modelica.Blocks.Interfaces.RealOutput pwm6 annotation(Placement(transformation(extent = {{90,-90},{110,-70}})));
algorithm
  if noEvent(TcmMat[1] > 0) then
    pwm1:=1;
    pwm2:=0;
  else
    pwm1:=0;
    pwm2:=1;
  end if;
  if noEvent(TcmMat[2] > 0) then
    pwm3:=1;
    pwm4:=0;
  else
    pwm3:=0;
    pwm4:=1;
  end if;
  if noEvent(TcmMat[3] > 0) then
    pwm5:=1;
    pwm6:=0;
  else
    pwm5:=0;
    pwm6:=1;
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-78,58},{72,-46}}, lineColor=  {0,0,255}, textString=  "PWM
generation")}));
end SVPWMgeneration;
