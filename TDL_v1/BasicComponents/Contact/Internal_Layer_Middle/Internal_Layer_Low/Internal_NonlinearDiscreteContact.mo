within TDL_v1.BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_NonlinearDiscreteContact
  // Basic assumption, negative relative distance corresponds to contact
  // Return contact force has positive value
  // The nonlinear characteristic is defined in a displacement-force table.
  //======================================== input values ===============================================
  extends
    BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D;
  Real d(final min = 0, start = 1);
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
  u = -distance_rel;
  react_c = smooth(1, noEvent(if contact then y else 0));
  react_d2 = smooth(1, noEvent(if contact then -d * speed_rel else 0));
  react_d = smooth(1, noEvent(if contact then if react_d2 > react_c then react_c elseif react_d2 < (-react_c) then -react_c else react_d2 else 0));
  react = react_c + react_d;
end Internal_NonlinearDiscreteContact;
