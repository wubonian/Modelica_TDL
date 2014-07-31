within TDL_v1.Templates.FaultMonitor;
model Base
  extends TDL_v1.Icons.FaultModel;
  Bus.FaultBus.FaultBus faultBus
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,0})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),        graphics));
end Base;
