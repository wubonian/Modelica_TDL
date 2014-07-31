within TDL_v1.Templates.Atmospheres;
model Base "Base model for all atmospheres"

  replaceable function windVelocity=Interfaces.windVelocityBase
    "Dummy model for wind velocity" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the wind velocity model should be defined and included in atmosphere model.
</p>
</html>"));

  replaceable function density=Interfaces.densityBase
    "Dummy model for air density"
    annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the air density model should be defined and included in atmosphere model.
</p>
</html>"));

  replaceable function temperature=Interfaces.temperatureBase
    "Dummy model for air temperature" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the air temperature model should be defined and included in atmosphere model.
</p>
</html>"));

  replaceable function humidity=Interfaces.humidityBase
    "Dummy model for air humidity"
    annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the air humidity model should be defined and included in atmosphere model.
</p>
</html>"));

  annotation (
    missingInnerMessage=
        "\"atmosphere\" is not defined, drag any atmosphere model (e.g., VehicleInterfaces.Atmospheres.ConstantAtmosphere) to the top level of your model.",
    defaultComponentName="atmosphere",
    defaultAttributes="inner",
    Documentation(info="<html>
<p>This partial model defines the interfaces required for an atmosphere subsystem.  See the <a href=\"Modelica://VehicleInterfaces.Atmospheres\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Atmospheres.Tutorial\">tutorial</a> for more information.</p>
</html>"));

end Base;
