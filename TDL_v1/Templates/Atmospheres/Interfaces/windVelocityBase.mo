within TDL_v1.Templates.Atmospheres.Interfaces;
partial function windVelocityBase "Determine wind velocity"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output Modelica.SIunits.Velocity[3] v=zeros(3)
    "Wind velocity vector, resolved in world frame";
  annotation (Documentation(info="<html>
</html>"));
end windVelocityBase;
