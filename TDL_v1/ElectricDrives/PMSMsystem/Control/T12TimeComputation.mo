within TDL_v1.ElectricDrives.PMSMsystem.Control;
model T12TimeComputation
  Real T1Mat[6],T2Mat[6];
  Real T_1,T_2,error;
  Modelica.Blocks.Interfaces.RealInput X annotation(Placement(transformation(extent = {{-120,30},{-80,70}})));
  Modelica.Blocks.Interfaces.RealInput Y annotation(Placement(transformation(extent = {{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput Z annotation(Placement(transformation(extent = {{-120,-70},{-80,-30}})));
  Modelica.Blocks.Interfaces.IntegerInput N annotation(Placement(transformation(extent = {{20,-20},{-20,20}}, rotation = -90, origin = {0,-100})));
  Modelica.Blocks.Interfaces.RealInput Tpwm annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = -90, origin = {0,100})));
  Modelica.Blocks.Interfaces.RealOutput T1 annotation(Placement(transformation(extent = {{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.RealOutput T2 annotation(Placement(transformation(extent = {{90,-50},{110,-30}})));
algorithm
  T1Mat:={Z,Y,-Z,-X,X,-Y};
  T2Mat:={Y,-X,X,Z,-Y,-Z};
  T_1:=T1Mat[N] * Tpwm / (T1Mat[N] + T2Mat[N]);
  T_2:=T2Mat[N] * Tpwm / (T1Mat[N] + T2Mat[N]);
  error:=Tpwm - T1Mat[N] - T2Mat[N];
  T1:=if error > 0 then T1Mat[N] else T_1;
  T2:=if error > 0 then T2Mat[N] else T_2;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-72,52},{76,-42}}, lineColor=  {0,0,255}, textString=  "T1T2")}));
end T12TimeComputation;
