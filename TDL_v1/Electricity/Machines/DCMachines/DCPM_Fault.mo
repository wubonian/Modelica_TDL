within TDL_v1.Electricity.Machines.DCMachines;
model DCPM_Fault
  import SI = Modelica.SIunits;
  parameter SI.Force parm_bearing_failure_force=0.1;
  parameter SI.Resistance parm_R_open_circuit=-0.25*R_normal;
  parameter SI.Resistance parm_R_short_circuit=-0.1*R_normal;
  parameter SI.Resistance parm_R_brush_wearness=0.2*R_normal;

  extends Internal_Layer_Middle.DCPM_Internal_Fault;
  extends Fault.FaultTemplate(final FaultNumber = 6, DTCNumber = {1,2,3,4,5,6});
protected
  SI.Resistance R_1;
  SI.Resistance R_2;
  SI.Resistance R_3;
equation
  idealClosingSwitch.control=if DTC[1].DTC_Active then true else false;
  idealOpeningSwitch.control=if DTC[2].DTC_Active then true else false;
  R_1=if DTC[3].DTC_Active then parm_R_open_circuit else 0;
  R_2=if DTC[4].DTC_Active then parm_R_short_circuit else 0;
  R_3=if DTC[5].DTC_Active then parm_R_brush_wearness else 0;
  bearingFaultInjection.f_input=if DTC[6].DTC_Active then parm_bearing_failure_force else 0;
  l_armature.L_bias=0;
  r_armature.R_bias=R_1+R_2+R_3;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-140},{100,100}}), graphics));
end DCPM_Fault;
