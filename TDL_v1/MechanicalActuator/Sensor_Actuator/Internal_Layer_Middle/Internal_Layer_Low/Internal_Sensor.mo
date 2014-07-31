within TDL_v1.MechanicalActuator.Sensor_Actuator.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_Sensor
  Real u;
  Real u_bias;
  Real resolution;
  Real y_bias;
  Real y;
equation
  y = y_bias + resolution * (u - u_bias);
end Internal_Sensor;
