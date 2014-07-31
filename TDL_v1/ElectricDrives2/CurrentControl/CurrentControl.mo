within TDL_v1.ElectricDrives2.CurrentControl;
model CurrentControl "Current control for idq including field weakening"
  import SI = Modelica.SIunits;
  parameter Integer p "Pole pair number" annotation(Dialog(tab="motor parameters"));
  parameter SI.Inductance Lmd "Main inductance d-axis" annotation(Dialog(tab="motor parameters",group="Impedances"));
  parameter SI.Inductance Lmq "Main inductance q-axis" annotation(Dialog(tab="motor parameters",group="Impedances"));
  parameter SI.MagneticFlux psi_m "Magnets flux"
                                                annotation(Dialog(tab="motor parameters"));

  parameter Real kp_curr "Proportional part of current PI controller" annotation(Dialog(tab="control parameters"));
  parameter Real Ti_curr "Integrtal part of current PI controller" annotation(Dialog(tab="control parameters"));

  parameter Real InverterLossCoefficient
    "Inverter losses proportional to Iq/torque [W/A]";

  parameter SI.Time T_sigma "Time Constant";
  parameter Real vMax "Maximum output voltage";
  SI.Power PowerIn;

  Modelica.Blocks.Interfaces.RealInput Id_ref "reference d axis current"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}, rotation=
           0)));
  Modelica.Blocks.Interfaces.RealInput Iq_ref "reference q axis current"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput theta_m "Mechanical angle of rotor"
    annotation (Placement(transformation(
        origin={-60,-120},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealInput idq[2] "Current idq"
                                      annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120})));
  Modelica.Blocks.Interfaces.RealOutput Uq_ref
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput Ud_ref
    "Connector of Real output signal" annotation (Placement(transformation(
          extent={{100,50},{120,70}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
          extent={{-70,50},{-50,70}}, rotation=0)));
  Modelica.Blocks.Math.Feedback feedback1
                                         annotation (Placement(transformation(
          extent={{-90,-70},{-70,-50}}, rotation=0)));
  Modelica.Blocks.Math.Add add_Ud annotation (Placement(transformation(extent={{20,44},
            {40,64}},        rotation=0)));
  Modelica.Blocks.Math.Add add_Uq annotation (Placement(transformation(extent={{20,-64},
            {40,-44}},       rotation=0)));

  Delta_U delta_U(
    p=p,
    Lmd=Lmd,
    Lmq=Lmq,
    psi_m=psi_m)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Controller.PIAntiWindUpConstants
    PI_d(
    kp=kp_curr,
    Ti=Ti_curr,
    lowerLimit=-vMax,
    upperLimit=vMax)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  Controller.PIAntiWindUpConstants
    PI_q(
    kp=kp_curr,
    Ti=Ti_curr,
    lowerLimit=-vMax,
    upperLimit=vMax)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
equation
  // PowerIn = 3/2 *(Ud*Id + Uq*Iq);
  PowerIn = 3/2*(add_Ud.y*idq[1] + add_Uq.y*idq[2]);

  connect(feedback1.u1,Iq_ref)  annotation (Line(
      points={{-88,-60},{-120,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Ud_ref, Ud_ref) annotation (Line(
      points={{110,60},{110,60}},
      color={0,0,127},
      pattern=LinePattern.None,
      smooth=Smooth.None));
  connect(Id_ref, feedback.u1) annotation (Line(
      points={{-120,60},{-68,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(delta_U.dud, add_Ud.u2)  annotation (Line(
      points={{1,6},{10,6},{10,48},{18,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(delta_U.duq, add_Uq.u1)  annotation (Line(
      points={{1,-6},{10,-6},{10,-48},{18,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(delta_U.id, feedback.u2)  annotation (Line(
      points={{-22,6},{-60,6},{-60,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(delta_U.theta_m, theta_m)  annotation (Line(
      points={{-22,-6},{-40,-6},{-40,-92},{-60,-92},{-60,-120}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, PI_d.u) annotation (Line(
      points={{-51,60},{-22,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PI_d.y, add_Ud.u1) annotation (Line(
      points={{1,60},{18,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PI_q.y, add_Uq.u2) annotation (Line(
      points={{1,-60},{18,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PI_q.u, feedback1.y) annotation (Line(
      points={{-22,-60},{-71,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(idq[2], feedback1.u2) annotation (Line(
      points={{60,-110},{60,-80},{-80,-80},{-80,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(delta_U.iq, idq[2])  annotation (Line(
      points={{-22,0},{-50,0},{-50,-80},{60,-80},{60,-110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(idq[1], feedback.u2) annotation (Line(
      points={{60,-130},{60,-106},{58,-106},{58,-86},{-60,-86},{-60,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add_Ud.y, Ud_ref) annotation (Line(
      points={{41,54},{60,54},{60,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add_Uq.y, Uq_ref) annotation (Line(
      points={{41,-54},{60,-54},{60,-60},{110,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={
        Text(
          extent={{-100,30},{100,0}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Current"),
        Text(
          extent={{-100,0},{100,-30}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Control"),
                               Text(
          extent={{-142,-77},{-92,-102}},
          lineColor={128,128,128},
          textString="Iq"),    Text(
          extent={{102,19},{150,44}},
          lineColor={128,128,128},
          textString="Ud"),    Text(
          extent={{102,-77},{150,-102}},
          lineColor={128,128,128},
          textString="Uq"),    Text(
          extent={{-142,44},{-92,19}},
          lineColor={128,128,128},
          textString="Id"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>", info="<html>
<p>This model just contains contoller blocks set up for the generation of the voltage (Ud and Uq) depending on the reference currents (Iq_ref and I_dref). 
It implements the following three equations of the dq-motor model:</p>
<p><img src=\"modelica://PowerTrain/Resources/Images/ElectricDrives/dqEquations.PNG\"/></p>
<p><img src=\"modelica://PowerTrain/Resources/Images/ElectricDrives/dqTorqueEquation.PNG\"/></p>
</html>"));
end CurrentControl;
