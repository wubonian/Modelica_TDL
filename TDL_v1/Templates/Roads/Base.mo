within TDL_v1.Templates.Roads;
model Base "Base model for all roads"

  replaceable function position =Interfaces.positionBase
    "Dummy model for road position" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the road position should be defined and included in road model.
</p>
</html>"));

  replaceable function trackOffset =Interfaces.trackOffsetBase
    "Dummy model for track offset from road centre line" annotation (
      Documentation(info="<html>
<p>
Dummy model to demonstrate how the track offset should be defined and included in road model.
</p>
</html>"));

  replaceable function normal =Interfaces.normalBase
    "Dummy model for unit normal on road" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the unit normal should be defined and included in road model.
</p>
</html>"));

  replaceable function headingDirection =Interfaces.headingDirectionBase
    "Dummy model for unit heading direction on road"
    annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the unit heading direction should be defined and included in road model.
</p>
</html>"));

  replaceable function frictionCoefficient =
      Interfaces.frictionCoefficientBase
    "Dummy model for friction coefficient on road" annotation (Documentation(
        info="<html>
<p>
Dummy model to demonstrate how the friction coefficient should be defined and included in road model.
</p>
</html>"));

  annotation (
    defaultComponentName="road",
    defaultAttributes="inner",
    Documentation(info="<html>
</html>"));
end Base;
