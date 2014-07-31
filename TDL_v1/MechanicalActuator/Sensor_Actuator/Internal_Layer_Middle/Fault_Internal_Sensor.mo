within TDL_v1.MechanicalActuator.Sensor_Actuator.Internal_Layer_Middle;
partial model Fault_Internal_Sensor
  extends Internal_Layer_Low.Internal_Sensor;
  extends Modelica.Blocks.Interfaces.DiscreteBlock(samplePeriod = 0.005);
  parameter Real parm_u_bias = 1;
  parameter Real parm_y_bias = 1;
  parameter Real parm_resolution = 1;
  Modelica.Blocks.Interfaces.RealInput u_input annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y_output annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
  Boolean u_lock_enable;
  Boolean y_lock_enable;
  Real shift_u_bias;
  Real shift_y_bias;
  Real shift_resolution;
protected
  Real u_inter;
  Real y_inter;
equation
  u_bias = parm_u_bias + shift_u_bias;
  y_bias = parm_y_bias + shift_y_bias;
  resolution = parm_resolution + shift_resolution;
  when {sampleTrigger,initial()} then
    u_inter = pre(u);
    u = if u_lock_enable then u_inter else u_input;
    y_inter = pre(y_output);
    y_output = if y_lock_enable then y_inter else y;
  end when;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end Fault_Internal_Sensor;
