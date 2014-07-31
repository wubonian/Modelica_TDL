within TDL_v1.ElectricDrives.PMSMsystem.Control;
model XYZTimeComputation
  //X,Y,Z computation
  Modelica.Blocks.Interfaces.RealInput alfa annotation(Placement(transformation(extent = {{-120,60},{-80,100}})));
  Modelica.Blocks.Interfaces.RealInput beta annotation(Placement(transformation(extent = {{-120,10},{-80,50}})));
  Modelica.Blocks.Interfaces.RealInput Tpwm annotation(Placement(transformation(extent = {{-120,-50},{-80,-10}})));
  Modelica.Blocks.Interfaces.RealInput Vdc annotation(Placement(transformation(extent = {{-120,-100},{-80,-60}})));
  Modelica.Blocks.Interfaces.RealOutput X annotation(Placement(transformation(extent = {{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealOutput Y annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput Z annotation(Placement(transformation(extent = {{90,-70},{110,-50}})));
protected
  Real XYZ[3,1],U[2,1];
  Real Mat[3,2] = [0,sqrt(3);1.5,sqrt(3) / 2;-1.5,sqrt(3) / 2];
algorithm
  U[1,1]:=alfa;
  U[2,1]:=beta;
  XYZ:=Tpwm / Vdc * Mat * U;
  X:=XYZ[1,1];
  Y:=XYZ[2,1];
  Z:=XYZ[3,1];
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-76,58},{80,-50}}, lineColor=  {0,0,255}, textString=  "TxTyTz")}));
end XYZTimeComputation;
