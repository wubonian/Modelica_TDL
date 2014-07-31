within TDL_v1.MechanicalActuator.Cam;
model Cam_Ideal_3_4
  import Modelica.Constants.pi;
  extends Interfaces.Partial_Cam_Ideal;
equation
  s=if phi_1<105/180*pi then 0 elseif phi_1>=105/180*pi and phi_1<=145/180*pi then -(phi_1-105/180*pi)*0.0089/(40/180*pi) elseif
  phi_1>145/180*pi and phi_1<155/180*pi then -0.0089 elseif phi_1>=155/180*pi and phi_1<=195/180*pi then -(195/180*pi-phi_1)*0.0089/(40/180*pi) elseif
  phi_1>195/180*pi and phi_1<205/180*pi then 0 elseif phi_1>=205/180*pi and phi_1<=245/180*pi then (phi_1-205/180*pi)*0.0089/(40/180*pi) else 0.0089;
  s_delay=if phi_2<105/180*pi then 0 elseif phi_2>=105/180*pi and phi_2<=145/180*pi then -(phi_2-105/180*pi)*0.0089/(40/180*pi) elseif
  phi_2>145/180*pi and phi_2<155/180*pi then -0.0089 elseif phi_2>=155/180*pi and phi_2<=195/180*pi then -(195/180*pi-phi_2)*0.0089/(40/180*pi) elseif
  phi_2>195/180*pi and phi_2<205/180*pi then 0 elseif phi_2>=205/180*pi and phi_2<=245/180*pi then (phi_2-205/180*pi)*0.0089/(40/180*pi) else 0.0089;
end Cam_Ideal_3_4;
