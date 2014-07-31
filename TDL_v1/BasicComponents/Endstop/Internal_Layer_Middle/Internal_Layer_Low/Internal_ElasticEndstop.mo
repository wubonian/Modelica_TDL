within TDL_v1.BasicComponents.Endstop.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_ElasticEndstop
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
  model Contact
    extends
      TDL_v1.BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDiscreteContact;
  end Contact;
  Contact contact_L(n=1);
  Contact contact_R(n=1);
equation
  stopped=if mode==1 then (if gap>=0 and distance>=gap then 1 elseif gap<=0 and distance<=gap then -1 else 0)
 else
     (if distance>=gap_R then 1 elseif distance<=gap_L then -1 else 0);
  contact_L.c=c;
  contact_L.d=d;
  contact_R.c=c;
  contact_R.d=d;
  contact_L.distance_rel=if mode==1 then distance-gap else distance-gap_L;
  contact_L.speed_rel=speed;
  contact_R.distance_rel=if mode==1 then gap-distance else gap_R-distance;
  contact_R.speed_rel=-speed;
  react=if stopped==0 then 0 elseif stopped==-1 then -contact_L.react else contact_R.react;
end Internal_ElasticEndstop;
