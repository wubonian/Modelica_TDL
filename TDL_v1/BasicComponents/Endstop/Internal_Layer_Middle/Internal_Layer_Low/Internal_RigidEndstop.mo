within TDL_v1.BasicComponents.Endstop.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_RigidEndstop
// distance=0 is the original position, if gapis positive then mean endstop at the right side, otherwise left side
  parameter Integer mode(final min=1,final max=2);
  replaceable parameter Real gap annotation(Dialog(enable = mode == 1));
  replaceable parameter Real gap_L annotation(Dialog(enable = mode == 2));
  replaceable parameter Real gap_R annotation(Dialog(enable = mode == 2));
  replaceable parameter Real c;
  replaceable parameter Real d;
  replaceable Real distance;
  replaceable Real speed;
  replaceable Real react;
protected
  Integer stopped;
  Real sa;
equation
  stopped=if mode==1 then (if gap>=0 and distance>=gap then 1 elseif gap<=0 and distance<=gap then -1 else 0)
 else
     (if distance>=gap_R then 1 elseif distance<=gap_L then -1 else 0);
  when stopped <> 0 then
    reinit(distance, if mode==1 then gap else (if stopped<0 then gap_L else gap_R));
    reinit(speed, 0);
  end when;
  react=if stopped==0 then 0 else sa;
  distance=if stopped==0 then sa else (if mode==1 then gap else (if stopped<0 then gap_L else gap_R));
end Internal_RigidEndstop;
