within TDL_v1.Electricity.Machines.SynchronousInductionMachines;
model PMSM_Fault
  import SI = Modelica.SIunits;
  extends Fault.FaultTemplate(final FaultNumber = 5, DTCNumber = {1,2,3,4,5});
  extends Internal_Layer_Middle.PMSM_Internal_Fault;
  //-----------------------fault parameters-------------------------------------
  parameter Modelica.SIunits.MagneticFlux psi_Fault=0.04
    "Fault flux of permanent magnet"
     annotation(Dialog(tab="fault parameters",enable=fault_injection));
  parameter Modelica.SIunits.Force f_Fault=1
    "bear failure equivalent press force"
     annotation(Dialog(tab="fault parameters",enable=fault_injection));
protected
  parameter SI.Current Ie_Fault=psi_Fault/Lmd;
equation
  threePhaseConnection.fault[1]=if DTC[1].DTC_Active then true else false;
  threePhaseConnection.fault[2]=if DTC[2].DTC_Active then true else false;
  threePhaseConnection.fault[3]=if DTC[3].DTC_Active then true else false;
  permanentMagnetFaultInjection.Ie=if DTC[4].DTC_Active then Ie_Fault else Ie_Normal;
  rotational_Continuous_Friction_Tanh.f_input=if DTC[5].DTC_Active then f_Fault else 0;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end PMSM_Fault;
