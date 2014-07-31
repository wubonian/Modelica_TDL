within TDL_v1.Templates.Atmospheres.Interfaces;
partial function densityBase "Determine density"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output Modelica.SIunits.Density rho=1.18 "Density";
  annotation (Documentation(info="<html>
</html>"));
end densityBase;
