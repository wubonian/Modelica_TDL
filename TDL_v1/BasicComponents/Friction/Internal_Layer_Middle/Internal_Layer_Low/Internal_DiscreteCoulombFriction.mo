within TDL_v1.BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_DiscreteCoulombFriction
  extends Internal_PartialDiscreteFriction;
  Real mue;
  Real cgeo;
  Real k;
  Real f_pressure;
  Real friction;
equation
  free = f_pressure <= 0;
  friction0 = f_pressure * mue * cgeo;
  friction0_max = k * friction0;
  friction = if locked then sa * unitFriction else if free then 0 else cgeo * f_pressure * (if startForward then mue else if startBackward then -mue else if pre(mode) == Forward then mue else -mue);
end Internal_DiscreteCoulombFriction;
