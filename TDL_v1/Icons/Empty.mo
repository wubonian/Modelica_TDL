within TDL_v1.Icons;
model Empty "Icon for an empty component"
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(extent=  {{-100,100},{100,-100}}, lineColor=  {255,0,0},
            lineThickness=                                                                                                    1),Line(points=  {{-70,-70},{70,70}}, color=  {255,0,0}, thickness=  1)}), Documentation(info = "<html>
<p>
This partial class is intended to design a default icon for an <em>empty element</em>, i.e. for element which has no influence on the overall model.
</p>
</html>"));
end Empty;
