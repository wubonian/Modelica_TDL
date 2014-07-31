within TDL_v1.Templates.Atmospheres.Interfaces;
partial function temperatureBase "Determine temperature"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output Modelica.SIunits.Temperature T=298 "Temperature";
  annotation (Documentation(info="<html>
</html>"));
end temperatureBase;
