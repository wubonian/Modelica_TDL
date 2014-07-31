within TDL_v1.Icons;
partial model ElectricMotor "Icon for an electric drive subsystem"
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,0}, fillColor=  {255,255,255},
            fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-50,70},{70,-30}}, lineColor=  {0,0,0},
            fillPattern=                                                                                                    FillPattern.HorizontalCylinder, fillColor=  {0,128,255}),Rectangle(extent=  {{-50,60},{-70,-30}}, lineColor=  {0,0,0},
            fillPattern=                                                                                                    FillPattern.HorizontalCylinder, fillColor=  {128,128,128}),Rectangle(extent=  {{70,10},{90,-10}}, lineColor=  {0,0,0},
            fillPattern=                                                                                                    FillPattern.HorizontalCylinder, fillColor=  {95,95,95}),Rectangle(extent=  {{-50,80},{30,60}}, lineColor=  {95,95,95}, fillColor=  {95,95,95},
            fillPattern=                                                                                                    FillPattern.Solid),Polygon(points=  {{-60,-50},{-50,-50},{-30,-10},{40,-10},{60,-50},{70,-50},{70,-60},{-60,-60},{-60,-50}}, lineColor=  {0,0,0}, fillColor=  {0,0,0},
            fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-100,-55},{100,-95}}, lineColor=  {0,0,255}, fillColor=  {255,255,0},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name")}), Documentation(info = "<html>
<p>
This partial class is intended to design a default icon for an <em>electric motor</em>.
</p>
<placeholder></placeholder>
</html>"));
end ElectricMotor;
