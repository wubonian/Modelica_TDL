within TDL_v1.Icons;
partial model Road "Icon for a road"
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-200,-100},{200,100}}, grid = {2,2}, initialScale = 0.1), graphics={  Rectangle(extent=  {{-200,100},{200,-100}}, lineColor=  {0,0,255}, pattern=  LinePattern.None,
            lineThickness=                                                                                                    0.5, fillColor=  {255,255,255},
            fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-200,100},{200,-100}}, lineColor=  {0,0,255}, pattern=  LinePattern.None, fillColor=  {135,135,135},
            fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-200,200},{200,120}}, lineColor=  {0,0,255}, textString=  "%name"),Rectangle(extent=  {{-167,14},{-107,-7}}, lineColor=  {0,0,255}, pattern=  LinePattern.None, fillColor=  {255,255,255},
            fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-27,13},{33,-8}}, lineColor=  {0,0,255}, pattern=  LinePattern.None, fillColor=  {255,255,255},
            fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{113,14},{173,-7}}, lineColor=  {0,0,255}, pattern=  LinePattern.None, fillColor=  {255,255,255},
            fillPattern=                                                                                                    FillPattern.Solid)}), Documentation(info = "<html>
<p>
This partial class is intended to design a default icon for a <em>road</em>.
</p>
<placeholder></placeholder>
</html>"));
end Road;
