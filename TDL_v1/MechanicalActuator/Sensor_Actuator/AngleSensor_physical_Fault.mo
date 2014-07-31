within TDL_v1.MechanicalActuator.Sensor_Actuator;
model AngleSensor_physical_Fault
  extends Modelica.Icons.RotationalSensor;
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput physical
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Sensor_Fault sensor_Fault(
    useNormalModel=useNormalModel,
    samplePeriod=samplePeriod,
    startTime=startTime,
    parm_u_bias=parm_u_bias,
    parm_y_bias=parm_y_bias,
    parm_resolution=parm_resolution,
    DTCNumber=DTCNumber,
    debugLocal=debugLocal,
    parm_u_bias_shift=parm_u_bias_shift,
    parm_y_bias_shift=parm_y_bias_shift,
    parm_resolution_shift=parm_resolution_shift,
    FaultNumber=FaultNumber)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  parameter Boolean useNormalModel=false;
  parameter Modelica.SIunits.Time samplePeriod=0.005;
  parameter Modelica.SIunits.Time startTime=0;
  parameter Real parm_u_bias=1;
  parameter Real parm_y_bias=1;
  parameter Real parm_resolution=1;
  parameter Integer DTCNumber[FaultNumber]={1,2,3,4,5};
  parameter Boolean debugLocal=false;
  parameter Real parm_u_bias_shift;
  parameter Real parm_y_bias_shift;
  parameter Real parm_resolution_shift;
  Bus.FaultBus.FaultBus faultBus
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  parameter Integer FaultNumber=5;
equation
  connect(flange_a, angleSensor.flange) annotation (Line(
      points={{-100,0},{-50,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor.phi, sensor_Fault.u_input) annotation (Line(
      points={{-29,0},{20,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor_Fault.y_output, physical) annotation (Line(
      points={{40,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(faultBus, sensor_Fault.faultBus) annotation (Line(
      points={{0,100},{30,100},{30,10}},
      color={255,0,0},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end AngleSensor_physical_Fault;
