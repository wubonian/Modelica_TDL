within TDL_v1.Templates.Controllers;
model Base
  extends TDL_v1.Icons.Controller;
TDL_v1.Bus.MessageBus.MessageControlBus messageBus "Control signal bus"
    annotation (Placement(transformation(extent={{-20,-80},{20,-120}}, rotation
          =0)));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
            graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
         graphics),
    Documentation(info="<html>
</html>"));
end Base;
