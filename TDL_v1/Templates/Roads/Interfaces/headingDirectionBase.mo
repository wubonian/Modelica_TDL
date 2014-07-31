within TDL_v1.Templates.Roads.Interfaces;
partial function headingDirectionBase
  "Determine unit heading direction on road"
  extends Modelica.Icons.Function;
  input Real s=0 "Roads surface parameter 1 (usually arc length along road)";
  input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
  output Real e_s_0[3]={1,0,0}
    "Unit vector in direction of road heading at (s,w), resolved in world frame";
  annotation (Documentation(info="<html>
</html>"));
end headingDirectionBase;
