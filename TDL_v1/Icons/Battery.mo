within TDL_v1.Icons;
partial model Battery "Icon for a battery subsystem"
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,0}, fillColor=  {255,255,255},
            fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{88,60},{0,60},{0,10}}, color=  {0,0,255}, smooth=  Smooth.None),Line(points=  {{-60,10},{-60,10},{60,10}}, color=  {0,0,255}, smooth=  Smooth.None),Line(points=  {{-32,-10},{30,-10}}, color=  {0,0,255}, smooth=  Smooth.None),Line(points=  {{0,-10},{0,-60},{90,-60}}, color=  {0,0,255}, smooth=  Smooth.None),Text(extent=  {{-100,100},{100,62}}, lineColor=  {0,0,255}, fillColor=  {255,255,0},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name")}), Documentation(info = "<html>
<p>
This partial class is intended to design a default icon for a <em>batery model</em>.
</p>
<placeholder></placeholder>
</html>"));
end Battery;
