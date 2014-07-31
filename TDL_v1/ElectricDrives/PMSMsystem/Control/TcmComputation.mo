within TDL_v1.ElectricDrives.PMSMsystem.Control;
model TcmComputation
  Modelica.Blocks.Interfaces.RealInput T1 annotation(Placement(transformation(extent = {{-120,30},{-80,70}})));
  Modelica.Blocks.Interfaces.RealInput T2 annotation(Placement(transformation(extent = {{-120,-70},{-80,-30}})));
  Modelica.Blocks.Interfaces.RealInput Tpwm annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = -90, origin = {0,100})));
  Modelica.Blocks.Interfaces.IntegerInput N annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 90, origin = {0,-100})));
  Modelica.Blocks.Interfaces.RealOutput Tcm1 annotation(Placement(transformation(extent = {{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealOutput Tcm2 annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput Tcm3 annotation(Placement(transformation(extent = {{90,-70},{110,-50}})));
protected
  Real x,y,z;
  Real[6] TcmMat1;
  Real[6] TcmMat2;
  Real[6] TcmMat3;
algorithm
  x:=(Tpwm - T1 - T2) / 4;
  y:=T1 / 2 + x;
  z:=y + T2 / 2;
  TcmMat1:={y,x,x,z,z,y};
  TcmMat2:={x,z,y,y,x,z};
  TcmMat3:={z,y,z,x,y,x};
  Tcm1:=TcmMat1[N];
  Tcm2:=TcmMat2[N];
  Tcm3:=TcmMat3[N];
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Text(extent=  {{-80,52},{76,-38}}, lineColor=  {0,0,255}, textString=  "Tcm"),Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255})}));
end TcmComputation;
