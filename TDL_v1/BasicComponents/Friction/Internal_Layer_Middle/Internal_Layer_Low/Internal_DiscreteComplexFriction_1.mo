within TDL_v1.BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_DiscreteComplexFriction_1
  extends Internal_PartialDiscreteFriction;
  Real mue;
  Real cgeo;
  Real k(final min = 1);
  Real k_prop;
  Real k_Stribeck;
  Real f_pressure;
  Real friction;
protected
  Real friction_Coulomb;
  Real friction_Stribeck;
equation
  friction_Coulomb = f_pressure * mue;
  friction_Stribeck = friction_Coulomb * (k - 1);
  free = f_pressure <= 0;
  friction0 = f_pressure * mue * cgeo * k;
  friction0_max = friction0 * 1.001;
  friction = if locked then sa * unitFriction else if free then 0 else cgeo * (if startForward then k_prop * speed_rel + friction_Coulomb + friction_Stribeck else if startBackward then k_prop * speed_rel - friction_Coulomb - friction_Stribeck else if pre(mode) == Forward then k_prop * speed_rel + friction_Coulomb + friction_Stribeck * exp(-k_Stribeck * abs(speed_rel)) else k_prop * speed_rel - friction_Coulomb - friction_Stribeck * exp(-k_Stribeck * abs(speed_rel)));
end Internal_DiscreteComplexFriction_1;
