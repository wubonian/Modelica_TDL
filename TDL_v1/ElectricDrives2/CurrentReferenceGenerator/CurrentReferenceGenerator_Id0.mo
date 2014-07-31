within TDL_v1.ElectricDrives2.CurrentReferenceGenerator;
model CurrentReferenceGenerator_Id0
  import SI = Modelica.SIunits;
  parameter Integer p "Pole pair number" annotation(Dialog(group="Motor parameters"));
  parameter SI.MagneticFlux psi_m "Magnets flux"
                                                annotation(Dialog(group="Motor parameters"));
  parameter SI.Current iMachineMax "Maximum phase current of the machine(RMS)"  annotation(Dialog(group="Motor parameters"));

  parameter Real k=2/3*1/p*1/psi_m "Gain value multiplied with input signal";

  Real IdqMax(start=sqrt(2)*iMachineMax)
    "Maximum Idq current due to iMachineMax or voltage limitations";

  Modelica.Blocks.Interfaces.RealInput torque_demand "Reference torque"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Id "d axis current reference"
    annotation (Placement(transformation(extent={{100,50},{120,70}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Iq "q axis current"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}},
          rotation=0)));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Math.Gain gain(k=k)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Nonlinear.VariableLimiter currentLimiter
    annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=IdqMax)
    annotation (Placement(transformation(extent={{20,-54},{40,-34}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=-IdqMax)
    annotation (Placement(transformation(extent={{20,-86},{40,-66}})));

equation
  IdqMax=sqrt(2)*iMachineMax;

  connect(currentLimiter.u, gain.y)   annotation (Line(
      points={{58,-60},{-20,-60},{-20,0},{-59,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression.y,currentLimiter. limit1)  annotation (Line(
      points={{41,-44},{50,-44},{50,-52},{58,-52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression1.y,currentLimiter. limit2)  annotation (Line(
      points={{41,-76},{50,-76},{50,-68},{58,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(currentLimiter.y, Iq) annotation (Line(
      points={{81,-60},{110,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, Id) annotation (Line(
      points={{81,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, torque_demand)  annotation (Line(
      points={{-82,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));

end CurrentReferenceGenerator_Id0;
