within TDL_v1.ElectricDrives.PMSMsystem.Elements;
model Pins2Plug
  Modelica.Electrical.Analog.Interfaces.Pin pin2 annotation(Placement(visible = true, transformation(origin = {-72.8466,-53.3742}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-72.8466,-53.3742}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin pin1 annotation(Placement(visible = true, transformation(origin = {-72.84699999999999,-0.18405}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-72.84699999999999,-0.18405}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin pin annotation(Placement(visible = true, transformation(origin = {-72.8466,56.5767}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {-72.8466,56.5767}, extent = {{-12,-12},{12,12}}, rotation = 0)));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug positiveplug1 annotation(Placement(visible = true, transformation(origin = {63.1411,-0.9571}, extent = {{-12,-12},{12,12}}, rotation = 0), iconTransformation(origin = {63.1411,-0.9571}, extent = {{-12,-12},{12,12}}, rotation = 0)));
equation
  pin.v = positiveplug1.pin[1].v;
  pin1.v = positiveplug1.pin[2].v;
  pin2.v = positiveplug1.pin[3].v;
  positiveplug1.pin[1].i = -pin.i;
  positiveplug1.pin[2].i = -pin1.i;
  positiveplug1.pin[3].i = -pin2.i;
  annotation(Diagram(graphics={  Rectangle(rotation=  0, lineColor=  {0,0,255}, fillColor=  {0,0,255}, pattern=  LinePattern.Solid,
            fillPattern=                                                                                                    FillPattern.None,
            lineThickness=                                                                                                    0.25, extent=  {{-69.3252,79.7546},{63.1902,-69.3252}})}), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2,2}), graphics={  Rectangle(lineColor=  {0,0,255}, fillColor=  {0,0,255}, extent=  {{-74,80},{64,-76}}),Text(lineColor=  {0,0,255}, fillColor=  {0,0,255}, extent=  {{-66,60},{52,-36}}, textString=  "Plug", fontSize=  40)}));
end Pins2Plug;
