within TDL_v1.MechanicalActuator.Sensor_Actuator;
model Sensor
  parameter Real parm_u_bias;
  parameter Real parm_y_bias;
  parameter Real parm_resolution;
  extends Internal_Layer_Middle.Internal_Layer_Low.Internal_Sensor;

  Modelica.Blocks.Interfaces.RealInput u_input
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y_output
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  u_bias=parm_u_bias;
  y_bias=parm_y_bias;
  resolution=parm_resolution;
  u=u_input;
  y_output=y;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Sensor;
