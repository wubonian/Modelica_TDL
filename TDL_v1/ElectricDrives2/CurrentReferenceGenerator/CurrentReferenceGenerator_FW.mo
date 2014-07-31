within TDL_v1.ElectricDrives2.CurrentReferenceGenerator;
model CurrentReferenceGenerator_FW
  "Current reference generator including field weakening control"
  //extends PowerTrain.Utilities.Icons.ControlBlockBG;
  import SI = Modelica.SIunits;
  parameter Integer p "Pole pair number" annotation(Dialog(group="Motor parameters"));
  parameter SI.MagneticFlux psi_m "Magnets flux"
                                                annotation(Dialog(group="Motor parameters"));
  parameter Real k=2/3*1/p*1/psi_m "Gain value multiplied with input signal";

  parameter SI.Current iMachineMax "Maximum phase current of the machine(RMS)"  annotation(Dialog(group="Motor parameters"));

  parameter Real kp_fw "Gain field weakening" annotation(Dialog(group="Control parameters"));
  parameter SI.Time Ti_fw "Integral time constant field weakening" annotation(Dialog(group="Control parameters"));

  Real IdqMax(start=sqrt(2)*iMachineMax)
    "Maximum Idq current due to iMachineMax or voltage limitations";
  Real IqMax=sqrt(abs(IdqMax^2 - Id^2));

  Modelica.Blocks.Interfaces.RealInput Udq "Absolute dq voltage"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=0,
        origin={-120,60})));
  Modelica.Blocks.Interfaces.RealInput torque_demand "Reference torque"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Id "d axis current reference"
    annotation (Placement(transformation(extent={{100,50},{120,70}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Iq "q axis current"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}},
          rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n "Negative pin"
    annotation (Placement(transformation(extent={{50,-110},{70,-90}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p "Positive pin"
    annotation (Placement(transformation(extent={{-70,-110},{-50,-90}},
                                                                    rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{60,70},{80,50}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-20,-90})));
  Modelica.Blocks.Math.Gain gain1(k=0.95*1/sqrt(3))
                                              annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-50,10})));
  Modelica.Blocks.Math.Gain gain(k=k)
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{-60,70},{-40,50}})));
  Modelica.Blocks.Sources.Constant constUpper(k=0)
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Nonlinear.VariableLimiter currentLimiter
    annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=IqMax)
    annotation (Placement(transformation(extent={{20,-54},{40,-34}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=-IqMax)
    annotation (Placement(transformation(extent={{20,-86},{40,-66}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=-IdqMax)
    annotation (Placement(transformation(extent={{-20,80},{0,100}})));
  ElectricDrives2.Controller.PIAntiWindUp pIAntiWindUp(kp=kp_fw, Ti=Ti_fw)
    annotation (Placement(transformation(extent={{20,70},{40,50}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.0001)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
equation

  IdqMax=sqrt(2)*iMachineMax;
//  IdqMax= if (Udq < 0.98/sqrt(3)*voltageSensor.v) then sqrt(2)*iMachineMax else sqrt(Iq^2 + Id^2);

  connect(voltageSensor.n, pin_n) annotation (Line(
      points={{-10,-90},{60,-90},{60,-100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gain1.u, voltageSensor.v)
                                   annotation (Line(
      points={{-38,10},{-20,10},{-20,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Udq, add1.u2) annotation (Line(
      points={{-120,60},{-90,60},{-90,66},{-62,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(constUpper.y, add.u1)
                           annotation (Line(
      points={{1,30},{50,30},{50,54},{58,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, torque_demand)  annotation (Line(
      points={{-82,-60},{-120,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, Id) annotation (Line(
      points={{81,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(currentLimiter.y, Iq)  annotation (Line(
      points={{81,-60},{110,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(currentLimiter.u, gain.y)   annotation (Line(
      points={{58,-60},{-59,-60}},
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
  connect(voltageSensor.p, pin_p) annotation (Line(
      points={{-30,-90},{-60,-90},{-60,-100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pIAntiWindUp.y, add.u2) annotation (Line(
      points={{41,60},{50,60},{50,66},{58,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression2.y, pIAntiWindUp.limitLower) annotation (Line(
      points={{1,90},{10,90},{10,66},{18,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pIAntiWindUp.limitUpper, constUpper.y)
                                            annotation (Line(
      points={{18,54},{10,54},{10,30},{1,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstOrder.y, pIAntiWindUp.u) annotation (Line(
      points={{1,60},{18,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, firstOrder.u) annotation (Line(
      points={{-39,60},{-22,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.y, add1.u1) annotation (Line(
      points={{-61,10},{-70,10},{-70,54},{-62,54}},
      color={0,0,127},
      smooth=Smooth.None));

end CurrentReferenceGenerator_FW;
