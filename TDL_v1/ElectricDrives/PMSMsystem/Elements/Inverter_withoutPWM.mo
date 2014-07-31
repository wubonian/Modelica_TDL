within TDL_v1.ElectricDrives.PMSMsystem.Elements;
model Inverter_withoutPWM "Inverter.mo"
  Modelica.Electrical.Analog.Interfaces.Pin a annotation(Placement(transformation(extent = {{90,50},{110,70}}), iconTransformation(extent = {{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.Pin b annotation(Placement(transformation(extent = {{90,-10},{110,10}}), iconTransformation(extent = {{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin c annotation(Placement(transformation(extent = {{90,-72},{110,-52}}), iconTransformation(extent = {{90,-72},{110,-52}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin plus annotation(Placement(transformation(extent = {{-112,50},{-92,70}}), iconTransformation(extent = {{-112,50},{-92,70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin minus annotation(Placement(transformation(extent = {{-112,-52},{-92,-32}}), iconTransformation(extent = {{-112,-52},{-92,-32}})));
  input Modelica.Blocks.Interfaces.RealInput a_sig annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {-60,106}), iconTransformation(origin = {-54,94}, extent = {{-14,-14},{14,14}}, rotation = 270)));
  input Modelica.Blocks.Interfaces.RealInput b_sig annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {0,106}), iconTransformation(origin = {0,94}, extent = {{-14,-14},{14,14}}, rotation = 270)));
  input Modelica.Blocks.Interfaces.RealInput c_sig annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {60,106}), iconTransformation(origin = {60,94}, extent = {{-14,-14},{14,14}}, rotation = 270)));
  Modelica.SIunits.Voltage U "Voltage drop between the two pins (= p.v - n.v)";
  Modelica.SIunits.Current I "Current flowing from pin p to pin n";
  //Modelica.Blocks.Interfaces.IntegerInput DriveOrBrake(start = 1) annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 90, origin = {0,-106})));
  //constant Integer Drive = 1;
  // constant Integer Brake = 2;
equation
  // if DriveOrBrake == Drive then
  //  assert(I >= 0, "");
  //else
  //   assert(I <= 0, "");
  // end if;
  0 = U * I + a.v * a.i + b.v * b.i + c.v * c.i;
  a.v = a_sig;
  b.v = b_sig;
  c.v = c_sig;
  U = plus.v - minus.v;
  0 = plus.i + minus.i;
  I = plus.i;
  annotation(viewSettings(clrRaster = 8421504), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}),Text(textString=  "Inverter", extent=  {{-68,46},{58,-42}})}), experiment(StopTime = 1, StartTime = 0), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end Inverter_withoutPWM;
