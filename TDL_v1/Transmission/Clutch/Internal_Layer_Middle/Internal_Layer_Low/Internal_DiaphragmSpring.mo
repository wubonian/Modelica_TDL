within TDL_v1.Transmission.Clutch.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_DiaphragmSpring
  import SI = Modelica.SIunits;
  // inputs
  SI.Position pos_endstop;
  SI.Position pos_fulcrum;
  SI.Position pos_thrust_bearing;
  SI.Length l_large_edge;
  SI.Length l_small_edge;
  SI.Mass m_pressure_plate;
  SI.Force f_endstop;
  SI.Force f_large_edge;
  SI.Force f_small_edge;
  // contact force has positive value
  // outputs
  SI.Position s_rel_large_edge;
  SI.Position s_rel_small_edge;
  SI.Position s_rel_endstop;
  // all these three relative values, negative corresponds to contact.
  SI.Velocity v_rel_large_edge;
  SI.Velocity v_rel_small_edge;
  SI.Velocity v_rel_endstop;
  //--------------------------------------------------------------------------------------------
  SI.Position pos_large_edge;
  SI.Position pos_small_edge;
  SI.Velocity v_large_edge;
  SI.Acceleration a_large_edge;
equation
  pos_small_edge=(pos_fulcrum + l_small_edge)-(pos_large_edge - (pos_fulcrum - l_large_edge)) / l_large_edge *l_small_edge;
  //(pos_fulcrum + l_small_edge - pos_small_edge) / l_small_edge = (pos_large_edge - (pos_fulcrum - l_large_edge)) / l_large_edge;
  s_rel_large_edge = pos_fulcrum - l_large_edge - pos_large_edge;
  s_rel_small_edge = pos_thrust_bearing - pos_small_edge;
  s_rel_endstop = pos_large_edge - pos_endstop;
  v_rel_large_edge = der(s_rel_large_edge);
  v_rel_small_edge = der(s_rel_small_edge);
  v_rel_endstop = der(s_rel_endstop);
  v_large_edge = der(pos_large_edge);
  a_large_edge = der(v_large_edge);
  m_pressure_plate * a_large_edge = f_endstop + f_small_edge * l_small_edge / l_large_edge - f_large_edge;
initial equation
  pos_large_edge = pos_fulcrum - l_large_edge;
end Internal_DiaphragmSpring;
