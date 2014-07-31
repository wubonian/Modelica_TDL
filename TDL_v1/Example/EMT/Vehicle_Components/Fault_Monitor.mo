within TDL_v1.Example.EMT.Vehicle_Components;
model Fault_Monitor
  extends Templates.FaultMonitor.Base;
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Sources.IntegerConstant integerConstant(k=0)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
equation
  connect(booleanConstant.y, faultBus.Set_DTC) annotation (Line(
      points={{21,-30},{60,-30},{60,0},{100,0}},
      color={255,0,255},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(integerConstant.y, faultBus.DTC_Number) annotation (Line(
      points={{21,30},{60,30},{60,0},{100,0}},
      color={255,127,0},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end Fault_Monitor;
