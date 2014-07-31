within TDL_v1.MechanicalActuator.Cam;
model Cam_Ideal_si_5
  import Modelica.Constants.pi;
  extends Interfaces.Partial_Cam_Ideal;
equation
  s=if phi_1<-45/180*pi then -0.0089 elseif phi_1>=-45/180*pi and phi_1<=-5/180*pi then -(-5/180*pi-phi_1)*0.0089/(40/180*pi) elseif
  phi_1>-5/180*pi and phi_1<55/180*pi then 0 elseif phi_1>=55/180*pi and phi_1<=95/180*pi then (phi_1-55/180*pi)*0.0089/(40/180*pi) else 0.0089;
  s_delay=if phi_2<-45/180*pi then -0.0089 elseif phi_2>=-45/180*pi and phi_2<=-5/180*pi then -(-5/180*pi-phi_2)*0.0089/(40/180*pi) elseif
  phi_2>-5/180*pi and phi_2<55/180*pi then 0 elseif phi_2>=55/180*pi and phi_2<=95/180*pi then (phi_2-55/180*pi)*0.0089/(40/180*pi) else 0.0089;
end Cam_Ideal_si_5;
