within TDL_v1.Example.EMT.Vehicle_Components;
model Engine
  import TDL_Version2 = TDL_v1;
  extends TDL_Version2.Templates.Engine.Base(
   final usingMultiBodyAccessories=false, final usingMultiBodyTransmission=false,
  usingFaultBus=false, final usingAcceleratorPedal=false, final usingMount=false);
  Controllers.EMS eMS
    annotation (Placement(transformation(extent={{-40,-20},{0,20}})));
  TDL_Version2.Engine.Engine engine
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
equation
  connect(eMS.messageBus, messageBus) annotation (Line(
      points={{-20,-20},{-20,-30},{-60,-30},{-60,100}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(eMS.Speed_Act, engine.speed_act_rpm) annotation (Line(
      points={{-40,12},{-52,12},{-52,36},{32,36},{32,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(engine.torque_act, eMS.Torque_Act) annotation (Line(
      points={{48,20},{48,28},{-46,28},{-46,-12},{-40,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eMS.Torque_Req, engine.torque_req) annotation (Line(
      points={{0,0},{20,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(engine.flange_a, transmissionFlange.flange) annotation (Line(
      points={{60,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Engine;
