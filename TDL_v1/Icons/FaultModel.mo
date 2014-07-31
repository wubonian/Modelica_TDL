within TDL_v1.Icons;
model FaultModel

  annotation(Icon(graphics={  Polygon(points=  {{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}}, smooth=  Smooth.None, fillColor=  {255,0,0},
            fillPattern=                                                                                                    FillPattern.Solid,
            lineThickness=                                                                                                    0.5, pattern=  LinePattern.None, lineColor=  {0,0,0}),
            Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
    Line(points={{-80,58},{-80,-90}}, color={192,192,192}),
    Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
    Polygon(
      points={{-80,80},{-88,58},{-72,58},{-80,80}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Polygon(
      points={{90,-80},{68,-72},{68,-88},{90,-80}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
                              Text(
          extent={{-150,150},{150,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          textString="%name"),
    Line(
      points={{-80,36},{-54,36},{-54,58},{-36,58},{-36,80},{-18,80},{-18,8},{16,
              8},{16,-16},{40,-16},{40,8},{62,8},{62,82},{78,82}},
      color={255,128,0},
      smooth=Smooth.None),
    Line(
      points={{-80,-44},{-56,-44},{-56,-80},{-36,-80},{-36,-42},{-6,-42},{-6,-80},
              {8,-80},{8,-42},{44,-42},{44,-80},{62,-80},{62,-42},{78,-42}},
      color={255,0,255},
      smooth=Smooth.None),
    Line( points={{-80,-8},{-70,8},{-60,14},{-36,4},{-22,-28},{-10,-46},{0,-54},
              {8,-54},{16,-48},{24,-36},{34,-18},{46,6},{64,28},{78,38}},
          color={0,0,255},
          smooth=Smooth.None),
                 Polygon(
          points={{68,90},{-24,10},{-2,-10},{-72,-90},{28,-10},{8,10},{68,90}},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0})}));

end FaultModel;
