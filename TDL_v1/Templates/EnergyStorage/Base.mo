within TDL_v1.Templates.EnergyStorage;
model Base
  extends TDL_v1.Icons.Battery;
  parameter Boolean usingHeatPort = false "Include the battery heat port"
    annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true));
  parameter Boolean usingFaultBus=false;
  parameter Boolean usingDashboard=false;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if usingHeatPort
    "Conditional port for exhaust heat flow"
    annotation (Placement(transformation(extent={{-70,-110},{-50,-90}},
          rotation=0)));

  Bus.MessageBus.MessageControlBus messageBus
    annotation (Placement(transformation(extent={{-90,90},{-70,110}})));
  Bus.FaultBus.FaultBus faultBus if usingFaultBus
    annotation (Placement(transformation(extent={{70,90},{90,110}})));

  Bus.Dashboard.Dashboard dashboardInformation if usingDashboard
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
public
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{90,70},{110,90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
end Base;
