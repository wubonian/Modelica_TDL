within TDL_v1.Templates.Roads.Interfaces;
partial function frictionCoefficientBase
  "Determine friction coefficient on road"
  extends Modelica.Icons.Function;
  input Real s=0 "Roads surface parameter 1 (usually arc length along road)";
  input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
  output Real mue=1 "Roads friction coefficient at (s,w)";
  annotation (Documentation(info="<html>
<p> </p>
</html>"));
end frictionCoefficientBase;
