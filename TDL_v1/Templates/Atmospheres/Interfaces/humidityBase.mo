within TDL_v1.Templates.Atmospheres.Interfaces;
partial function humidityBase "Determine humidity"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output Real h=0.5 "Humidity";
  annotation (Documentation(info="<html>
</html>"));
end humidityBase;
