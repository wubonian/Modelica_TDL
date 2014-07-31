within TDL_v1.ElectricDrives2.CurrentControl;
model Delta_U "Decoupling network of current control"
  import SI = Modelica.SIunits;
  parameter Integer p "Pole pair number" annotation(Dialog(tab="motor parameters"));
  parameter SI.Inductance Lmd "Main inductance d-axis"
                                                      annotation(Dialog(tab="motor parameters",group="Impedances"));
  parameter SI.Inductance Lmq "Main inductance q-axis"
                                                      annotation(Dialog(tab="motor parameters",group="Impedances"));
  parameter SI.MagneticFlux psi_m "Magnets flux"
                                                annotation(Dialog(tab="motor parameters"));

  Modelica.Blocks.Interfaces.RealInput theta_m "mechanical angle"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput id
    annotation (Placement(transformation(extent={{-140,40},{-100,80}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput iq
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput dud annotation (Placement(
        transformation(extent={{100,50},{120,70}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput duq
    annotation (Placement(transformation(extent={{100,-70},{120,-50}},
          rotation=0)));
  Modelica.Blocks.Math.Gain Ldaxis(k=Lmd)  annotation (Placement(
        transformation(extent={{-20,30},{0,50}},  rotation=0)));
  Modelica.Blocks.Math.Gain Lqaxis(k=Lmq)  annotation (Placement(
        transformation(extent={{-20,-30},{0,-10}}, rotation=0)));
  Modelica.Blocks.Math.Gain EMF(k=psi_m) annotation (Placement(
        transformation(extent={{-20,-76},{0,-56}}, rotation=0)));
  Modelica.Blocks.Math.Add u_q annotation (Placement(transformation(extent={{70,-70},
            {90,-50}},           rotation=0)));
  Modelica.Blocks.Math.Gain u_d(k=-1) annotation (Placement(transformation(
          extent={{70,50},{90,70}}, rotation=0)));
  Modelica.Blocks.Math.Product induced_v_d "cyclic induced voltage d axis"
    annotation (Placement(transformation(extent={{20,44},{40,64}}, rotation=
           0)));
  Modelica.Blocks.Math.Product induced_v_q "cyclic induced voltage q axis"
    annotation (Placement(transformation(extent={{20,-10},{40,10}},rotation=
           0)));
  Modelica.Blocks.Continuous.Der omega_calc
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}},
          rotation=0)));
  Modelica.Blocks.Math.Gain theta_elec_calc(k=p)
                                           annotation (Placement(
        transformation(extent={{-90,-70},{-70,-50}}, rotation=0)));

equation
  connect(EMF.y,u_q. u2) annotation (Line(points={{1,-66},{40,-66},{68,-66}},
                                                                      color=
         {0,0,127}));
  connect(u_d.y, dud)
    annotation (Line(points={{91,60},{110,60}}, color={0,0,127}));
  connect(u_q.y, duq)
    annotation (Line(points={{91,-60},{91,-60},{110,-60}},
                                                  color={0,0,127}));
  connect(id,induced_v_d. u1) annotation (Line(points={{-120,60},{-120,60},{18,
          60}},
        color={0,0,127}));
  connect(iq,induced_v_q. u1)
    annotation (Line(points={{-120,0},{0,0},{0,6},{18,6}},
                                               color={0,0,127}));
  connect(Ldaxis.y,induced_v_d. u2) annotation (Line(points={{1,40},{10,40},{10,
          48},{18,48}},     color={0,0,127}));
  connect(Lqaxis.y,induced_v_q. u2) annotation (Line(points={{1,-20},{10,-20},{
          10,-6},{18,-6}},         color={0,0,127}));
  connect(induced_v_d.y,u_q. u1) annotation (Line(points={{41,54},{50,54},{50,
          -54},{68,-54}},    color={0,0,127}));
  connect(induced_v_q.y,u_d. u) annotation (Line(points={{41,0},{60,0},{60,60},
          {68,60}},        color={0,0,127}));
  connect(omega_calc.y,EMF. u) annotation (Line(
      points={{-39,-60},{-30,-60},{-30,-66},{-22,-66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theta_m, theta_elec_calc.u)
                                    annotation (Line(
      points={{-120,-60},{-92,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(omega_calc.y, Ldaxis.u) annotation (Line(
      points={{-39,-60},{-30,-60},{-30,40},{-22,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theta_elec_calc.y, omega_calc.u) annotation (Line(
      points={{-69,-60},{-62,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(omega_calc.y, Lqaxis.u) annotation (Line(
      points={{-39,-60},{-30,-60},{-30,-20},{-22,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-4,20},{56,-20}},
          lineColor={0,0,0},
          textString="u"),
        Polygon(
          points={{-36,-14},{-20,14},{-2,-14},{-36,-14}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          lineColor={0,0,255})}),
                          Diagram(coordinateSystem(preserveAspectRatio=true,
                   extent={{-100,-100},{100,100}}),
                                  graphics),
    Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>", info="<html>
<p>This model computes the differential components of Uq and Ud and returns it as real outputs dud and duq, respectively.</p>
</html>"));
end Delta_U;
