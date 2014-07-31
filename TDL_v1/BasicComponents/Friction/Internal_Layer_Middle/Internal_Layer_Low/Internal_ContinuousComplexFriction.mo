within TDL_v1.BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_ContinuousComplexFriction
  Real mue;
  Real cgeo;
  Real k(final min = 1);
  Real k_prop;
  Real k_Stribeck;
  Real speed_limit;
  Real speed_rel;
  Real f_pressure;
  Real friction;
protected
  Boolean free(start = true);
equation
  free = f_pressure <= 0;
  friction = noEvent(if free then 0 else cgeo * (f_pressure * mue + (k - 1) * f_pressure * mue * exp(-k_Stribeck * abs(speed_rel)) + k_prop * abs(speed_rel)) * tanh(2 * speed_rel / speed_limit));
end Internal_ContinuousComplexFriction;
