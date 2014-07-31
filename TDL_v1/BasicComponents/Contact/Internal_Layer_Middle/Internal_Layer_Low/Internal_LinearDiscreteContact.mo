within TDL_v1.BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_LinearDiscreteContact
  // Basic assumption, negative relative distance corresponds to contact
  // reactive force has positive value
  //======================================== input values ===============================================
  Real c(final min = 0, start = 1);
  Real d(final min = 0, start = 1);
  parameter Real n(final min = 1) = 1;
  // used to distinguish contact condition
  Real distance_rel;
  Real speed_rel;
  //======================================== output values ===============================================
  Real react;
  Boolean contact;
protected
  Real react_c;
  Real react_d2;
  Real react_d;
equation
  contact = distance_rel < 0;
  react_c = smooth(1, noEvent(if contact then c * abs(distance_rel) ^ n else 0));
  react_d2 = smooth(1, noEvent(if contact then -d * speed_rel else 0));
  react_d = smooth(1, noEvent(if contact then if react_d2 > react_c then react_c elseif react_d2 < (-react_c) then -react_c else react_d2 else 0));
  react = react_c + react_d;
end Internal_LinearDiscreteContact;
