within TDL_v1.MechanicalActuator.Sensor_Actuator;
model Sensor_Fault
  import TDL_Version2 = TDL_v1;
  extends Internal_Layer_Middle.Fault_Internal_Sensor;
  extends TDL_Version2.Fault.FaultTemplate(FaultNumber=5, DTCNumber={1,2,3,
        4,5});
  parameter Real parm_u_bias_shift;
  parameter Real parm_y_bias_shift;
  parameter Real parm_resolution_shift;
equation
  u_lock_enable = DTC[1].DTC_Active;
  y_lock_enable = DTC[2].DTC_Active;
  shift_u_bias = if DTC[3].DTC_Active then parm_u_bias_shift else 0;
  shift_y_bias = if DTC[4].DTC_Active then parm_y_bias_shift else 0;
  shift_resolution = if DTC[5].DTC_Active then parm_resolution_shift else 0;
end Sensor_Fault;
