within TDL_v1.Blocks;
model PI

  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-220,-20},{-180,20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
  Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent = {{-12,20},{8,40}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = max_limit) annotation(Placement(transformation(extent = {{20,20},{40,40}})));
  parameter Real k_P_p;
  parameter Real k_I_p;
  parameter Real max_limit;
  parameter Real outMax_Integrator;
  parameter Boolean sampleLimit_Integrator;
  parameter Real samplePeriod_Integrator;
  LimIntegrator limIntegrator(
    outMax=outMax_Integrator,
    sample_limit=sampleLimit_Integrator,
    samplePeriod=samplePeriod_Integrator)
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  Modelica.Blocks.Interfaces.BooleanInput u1 annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 90, origin = {-102,-102})));
  Modelica.Blocks.Math.Gain k_P(k = k_P_p) annotation(Placement(visible = true, transformation(origin={-100,36},   extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain k_I(k = k_I_p) annotation(Placement(visible = true, transformation(origin = {-120,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(k_I.y,limIntegrator.u) annotation(Line(points = {{-109,0},{-94,0}}, color = {0,0,127}));
  connect(add1.u1,k_P.y) annotation(Line(points={{-14,36},{-89,36}},   color = {0,0,127}));
  connect(u,k_P.u) annotation(Line(points={{-200,0},{-162,0},{-162,36},{-112,36}},   color = {0,0,127}));
  connect(add1.y,limiter.u) annotation(Line(points = {{9,30},{18,30}}, color = {0,0,127}, smooth = Smooth.None));
  connect(limiter.y,y) annotation(Line(points = {{41,30},{58,30},{58,0},{100,0}}, color = {0,0,127}, smooth = Smooth.None));
  connect(limIntegrator.y,add1.u2) annotation(Line(points = {{-71,0},{-42,0},{-42,24},{-14,24}}, color = {0,0,127}, smooth = Smooth.None));
  connect(u1,limIntegrator.Reset) annotation(Line(points = {{-102,-102},{-94,-102},{-94,-22},{-86.2,-22},{-86.2,-12}}, color = {255,0,255}, smooth = Smooth.None));
  connect(k_I.u, k_P.u) annotation (Line(
      points={{-132,0},{-162,0},{-162,36},{-112,36}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-200,
            -100},{100,100}}),                                                                        graphics), Icon(coordinateSystem(extent = {{-200,-100},{100,100}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-200,100},{100,-100}}, lineColor=  {0,0,255}),Text(extent=  {{-184,68},{74,-58}}, lineColor=  {0,0,255}, textString=  "PI")}));
end PI;
