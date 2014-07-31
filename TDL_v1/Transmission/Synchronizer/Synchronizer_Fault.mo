within TDL_v1.Transmission.Synchronizer;
model Synchronizer_Fault
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;
  extends Synchronizer(Left_Force(y=if DTC[1].DTC_Active then Left_Force_Sensor.f
          /sin(4.4381/180*pi) + 1 + parm_left_stuck_force else
          Left_Force_Sensor.f/sin(4.4381/180*pi) + 1), Right_Force(y=if DTC[2].DTC_Active
           then Right_Force_Sensor.f/sin(4.4381/180*pi) + 1 +
          parm_right_stuck_force else Right_Force_Sensor.f/sin(4.4381/180*pi) +
          1));
  parameter SI.Force parm_left_stuck_force=1000 annotation(enable=not useNormalModel and not debugLocal);
  parameter SI.Force parm_right_stuck_force=1000 annotation(enable=not useNormalModel and not debugLocal);
  // this template provides the following interfaces for the user
  // useNormalModel, debugLocal, DTC[i].DTC_Active
  // note that no fault should be specified for DTC number 0, 0 stands for the normal behavior.
  final parameter Integer FaultNumber = 2;
  parameter Integer DTCNumber[FaultNumber]={1,2};
  parameter Boolean useNormalModel = true;
  parameter Boolean debugLocal = false;
  TDL_v1.Fault.DTCTemplate DTC[FaultNumber];
  Bus.FaultBus.FaultBus faultBus if not useNormalModel and not debugLocal annotation(Placement(transformation(extent={{-110,90},
            {-90,110}})));
protected
  Bus.FaultBus.FaultBus faultInnerBus;
  Modelica.Blocks.Sources.IntegerConstant integerConstant(k = 0) if not (not useNormalModel and not debugLocal);
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = false) if not (not useNormalModel and not debugLocal);
equation
  for i in 1:FaultNumber loop
  DTC[i].DTC_Number = DTCNumber[i];
  DTC[i].DTC_Active = (pre(DTC[i].DTC_Active) and not (faultInnerBus.DTC_Number == DTC[i].DTC_Number and not faultInnerBus.Set_DTC) or not pre(DTC[i].DTC_Active) and faultInnerBus.DTC_Number == DTC[i].DTC_Number and faultInnerBus.Set_DTC) and not useNormalModel;
  DTC[i].DTC_Counter = if not pre(DTC[i].DTC_Active) and DTC[i].DTC_Active then pre(DTC[i].DTC_Counter) + 1 else pre(DTC[i].DTC_Counter);
  end for;

  connect(faultBus,faultInnerBus);
  connect(integerConstant.y,faultInnerBus.DTC_Number);
  connect(booleanConstant.y,faultInnerBus.Set_DTC);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -100},{180,100}}), graphics));
end Synchronizer_Fault;
