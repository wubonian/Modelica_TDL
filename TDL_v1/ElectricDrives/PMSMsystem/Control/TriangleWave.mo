within TDL_v1.ElectricDrives.PMSMsystem.Control;
model TriangleWave
  //triangle wave generation
  Modelica.SIunits.Time T0(start = startTime);
  Integer counter(start = nperiod);
  Integer counter2(start = nperiod);
  parameter Real amplitude = 5e-005;
  parameter Modelica.SIunits.Time rising = 5e-005;
  parameter Modelica.SIunits.Time width = 0;
  parameter Modelica.SIunits.Time falling = 5e-005;
  parameter Modelica.SIunits.Time period = 0.0001;
  parameter Integer nperiod = -1;
  parameter Real offset = 0;
  parameter Modelica.SIunits.Time startTime = 0;
  parameter Modelica.SIunits.Time T_rising = rising;
  parameter Modelica.SIunits.Time T_width = T_rising + width;
  parameter Modelica.SIunits.Time T_falling = T_width + falling;
  Real y;
equation
  when pre(counter2) <> 0 and sample(startTime, period) then
    T0 = time;
    counter2 = pre(counter);
    counter = pre(counter) - (if 0 < pre(counter) then 1 else 0);
  end when;
  y = offset + (if time < startTime or counter2 == 0 or T0 + T_falling <= time then 0 else if time < T0 + T_rising then (time - T0) * amplitude / T_rising else if time < T0 + T_width then amplitude else (T0 + T_falling - time) * amplitude / (T_falling - T_width));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,255})}));
end TriangleWave;
