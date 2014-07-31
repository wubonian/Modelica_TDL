within TDL_v1.Templates.Roads.Interfaces;
partial function positionBase "Determine road position"
  extends Modelica.Icons.Function;
  input Real s=0 "Roads surface parameter 1 (usually arc length along road)";
  input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
  output Modelica.SIunits.Position r_0[3]=zeros(3)
    "Position vector from world frame to point on road at (s,w), resolved in world frame";
  annotation (Documentation(info="<html>
</html>"));
end positionBase;
