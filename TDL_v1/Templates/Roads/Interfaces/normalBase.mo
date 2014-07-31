within TDL_v1.Templates.Roads.Interfaces;
partial function normalBase "Determine unit normal on road"
  extends Modelica.Icons.Function;
  input Real s=0 "Roads surface parameter 1 (usually arc length along road)";
  input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
  output Real e_n_0[3]={0,0,1}
    "Unit normal of road at (s,w), resolved in world frame";
  annotation (Documentation(info="<html>
</html>"));
end normalBase;
