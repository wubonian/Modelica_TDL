within TDL_v1.Wheel;
model Rill "Tire model according to Rill"
  import SI = Modelica.SIunits;
  extends BaseClasses.Wheel_SlipNonlin;

  parameter NominalLoad data1 "Tire parameters at lower weight condition"
    annotation (Dialog(group="Slip model parameters"));
  parameter NominalLoad data2(
    Fz_nom=6000,
    Fds=75000,
    s_max=0.18,
    F_max=4500,
    s_slide=0.5,
    F_slide=4200) "Tire parameters at higher weight condition"
    annotation (Dialog(group="Slip model parameters"));
  parameter Real mue=1 "Current friction coefficient of road"
    annotation (Dialog(group="Slip model parameters"));
  parameter Real mue_nom=0.7
    "Friction coefficient of road for which tire data is valid"
    annotation (Dialog(group="Slip model parameters"));

  record NominalLoad "Nominal load parameters for Rill tire model"
    extends Modelica.Icons.Record;

    parameter SI.Force Fz_nom=3000 "Nominal vertical force";
    parameter SI.Force Fds=50000 "Slope at s_x=0 in longitudinal direction"
      annotation (Dialog(group="Longitudinal force"));
    parameter Real s_max=0.15 "Slip of maximum longitudinal tire force"
      annotation (Dialog(group="Longitudinal force"));
    parameter SI.Force F_max=3000 "Maximum longitudinal tire force at s_max"
      annotation (Dialog(group="Longitudinal force"));
    parameter Real s_slide=0.4 "Slip of sliding begin"
      annotation (Dialog(group="Longitudinal force"));
    parameter SI.Force F_slide=2800
      "Longitudinal tire force at sliding begin s_slide"
      annotation (Dialog(group="Longitudinal force"));
    annotation (Documentation(info="<html>
<p>
This class defines the set of parameters to be used for nominal load determination of Rill tire slip model.
</p>
</html>"));
  end NominalLoad;

  function interpolate1 "Interpolate linearly between two points"
    extends Modelica.Icons.Function;

    input Real x "Abszissa value to be interpolated";
    input Real x1 "Abszissa value of point 1";
    input Real y1 "Ordinate value of point 1";
    input Real x2 "Abszissa value of point 2";
    input Real y2 "Ordinate value of point 2";
    output Real y "Ordinate value of x, i.e., y(x)";
  algorithm
    y := y1 + (y2 - y1)*((x - x1)/(x2 - x1));
    annotation (Documentation(info="<html>
<p>
Function for linear interpolation between point 1 given by (x1, y1) and point 2 given by (x2, y2).
</p>
</html>"));
  end interpolate1;

  function interpolate2
    "Interpolate quadratically between two points, such that y(0)=0"
    extends Modelica.Icons.Function;

    input Real x "Abszissa value to be interpolated";
    input Real x1 "Abszissa value of point 1 (<> 0 required)";
    input Real y1 "Ordinate value of point 1";
    input Real x2 "Abszissa value of point 2 (x2 <> x1 required)";
    input Real y2 "Ordinate value of point 2";
    output Real y "Ordinate value of x, i.e., y(x)";
  algorithm
    y := ((y2*x1/x2 - y1*x2/x1)*(x1 - x)/(x1 - x2) + y1*x/x1)*x/x1;
    annotation (Documentation(info="<html>
<p>
Function for quadratic interpolation between point 1 given by (x1, y1) and point 2 given by (x2, y2).
</p>
</html>"));
  end interpolate2;

protected
  parameter Real k_mue=mue/mue_nom;
  constant Real e=2.71828182846;
  SI.Force Fz;
  Real Fds;
  Real s_max;
  Real s_slide;
  Real c;
  Real sigma;
  Real F_max;
  Real F_slide;
equation
  carrierFlange.s = 0;

  F_max = k_mue*interpolate2(
    Fz,
    data1.Fz_nom,
    data1.F_max,
    data2.Fz_nom,
    data2.F_max);
  Fds = interpolate2(
    Fz,
    data1.Fz_nom,
    data1.Fds,
    data2.Fz_nom,
    data2.Fds);
  F_slide = k_mue*interpolate2(
    Fz,
    data1.Fz_nom,
    data1.F_slide,
    data2.Fz_nom,
    data2.F_slide);
  s_max = k_mue*interpolate1(
    Fz,
    data1.Fz_nom,
    data1.s_max,
    data2.Fz_nom,
    data2.s_max);
  s_slide = k_mue*interpolate1(
    Fz,
    data1.Fz_nom,
    data1.s_slide,
    data2.Fz_nom,
    data2.s_slide);

  if slip <= s_max then
    c = sigma*(s_max/max(F_max, 1e-10)*Fds - 2 + sigma) + 1;
    sigma = slip/s_max;
    fDrive = s_max*Fds*sigma/c;
  elseif slip <= s_slide then
    c = 0;
    sigma = (slip - s_max)/(s_slide - s_max);
    fDrive = F_max - (F_max - F_slide)*sigma^2*(3 - 2*sigma);
  else
    c = 0;
    sigma = 0;
    fDrive = F_slide;
  end if;

  annotation (Diagram(graphics),
                       Documentation(info="<html>
<p>
A tire slip model based on a simple physics according to G.&nbsp;Rill, see <a href=\"#ref_rill\">References</a>.
It utilizes interpolation between two sets (<code>data1</code> and <code>data2</code>) of parameters
identified for two different tire loads.
</p>
<p>
See also <a href=\"Modelica://PowerTrain.Chassis.Wheels.BaseClasses.Wheel_Slip\">documentation</a> of tire slip basis model.
 
 
<a name=\"sec_References\">
<h4>References</h4>
<dl>
<dt><a name=\"ref_rill\">Rill G. (1994):
   <dd><b>Simulation von Kraftfahrzeugen</b>. Vieweg.
</dl>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{-100,-80},{100,-40}},
          lineColor={135,135,135},
          fillColor={191,95,0},
          fillPattern=FillPattern.Solid,
          textString="Rill"), Polygon(
          points={{40,100},{40,86},{70,80},{80,0},{100,0},{100,100},{40,100}},
          lineColor={0,127,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}));
end Rill;
