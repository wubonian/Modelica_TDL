within TDL_v1.Templates.Roads.Interfaces;
partial function trackOffsetBase "Determine track offset from road centre line"
  extends Modelica.Icons.Function;
  input Real s=0 "Roads surface parameter 1 (usually arc length along road)";
  input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
  output Modelica.SIunits.Position trackOffset[3]=zeros(3)
    "Track offset vector from road centre line to desired trajectory point";
  annotation (Documentation(info="<html>
<p> </p>
</html>"));
end trackOffsetBase;
