within TDL_v1.Icons;
partial model SingleMount "Icon for a single mounting subsystem"
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics={  Rectangle(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,0}, fillColor=  {255,255,255},
            fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-100,20},{100,-20}}, lineColor=  {0,0,255}, fillColor=  {255,255,0},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name"),Line(points=  {{0,70},{0,60},{20,50},{-20,30},{20,10},{-20,-10},{20,-30},{-20,-50},{0,-60},{0,-90}}, color=  {0,0,0}),Rectangle(extent=  {{-80,90},{80,70}}, lineColor=  {0,0,0}, fillColor=  {215,215,215},
            fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-81,-70},{80,-70}}, color=  {0,0,0})}), Documentation(info = "<html>
<p>
This partial class is intended to design a default icon for a model of <em>single mount</em>.
</p>
<placeholder></placeholder>
</html>"));
end SingleMount;
