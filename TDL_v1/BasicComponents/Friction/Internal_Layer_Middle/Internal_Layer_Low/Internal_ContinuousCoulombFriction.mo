within TDL_v1.BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_ContinuousCoulombFriction
  // when speed has positive value, then friction force has positive value too.
  // when pressure has positive value, then clutch is engaged.
  // input pressure force is in unit N
  Real mue;
  Real cgeo;
  // friction coefficient
  Real speed_limit;
  Real speed_rel;
  Real f_pressure;
  Real friction;
protected
  Boolean free(start = true);
equation
  free = f_pressure <= 0;
  friction = noEvent(if free then 0 else f_pressure * mue * cgeo * tanh(2 * speed_rel / speed_limit));
end Internal_ContinuousCoulombFriction;
