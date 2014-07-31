within TDL_v1.Bus.SignalBus;
expandable connector SignalControlBus
  extends Icons.SignalBus;
  Bus.SignalBus.EngineControlBus engine_control_bus;
  Bus.SignalBus.TransmissionControlBus transmission_control_bus;
  Bus.SignalBus.MotorControlBus motor_control_bus;
  Bus.SignalBus.BatteryControlBus battery_control_bus;
  Bus.SignalBus.VCUControlBus VCU_control_bus;
  Bus.SignalBus.HMIControlBus HMI_control_bus;
  Bus.SignalBus.ABSControlBus ABS_control_bus;
end SignalControlBus;
