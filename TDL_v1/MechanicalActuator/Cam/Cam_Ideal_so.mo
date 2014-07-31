within TDL_v1.MechanicalActuator.Cam;
model Cam_Ideal_so
  import Modelica.Constants.pi;
  extends Interfaces.Partial_Cam_Ideal;
equation
  s=if phi_1<5/180*pi then 0 elseif phi_1>=5/180*pi and phi_1<=45/180*pi then -(phi_1-5/180*pi)*0.0089/(40/180*pi) else -0.0089;
  s_delay=if phi_2<5/180*pi then 0 elseif phi_2>=5/180*pi and phi_2<=45/180*pi then -(phi_2-5/180*pi)*0.0089/(40/180*pi) else -0.0089;
end Cam_Ideal_so;
