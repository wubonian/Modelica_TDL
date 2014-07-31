within TDL_v1.BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_ContinuousTransientFriction
  Real keci0;
  Real keci1;
  Real keci2;
  Real mue;
  parameter Real peak = 1.5;
  Real cgeo;
  parameter Real ws = 1;
  parameter StateSelect stateSelect = StateSelect.prefer;
  Real speed_rel(start = 0, stateSelect = stateSelect);
  Real f_pressure;
  Real friction;
protected
  Real z(start = 0, stateSelect = StateSelect.prefer);
  Real gw(start = 0);
  Real frictionS;
  Real frictionC;
  Real y;
  Boolean contact(start = false);
  Boolean free(start = true);
equation
  // outer interface
  contact = f_pressure > 0;
  frictionC = mue * f_pressure * cgeo;
  frictionS = peak * mue * f_pressure * cgeo;
  //  w_rel=3-time;
  // internal function
  gw = if contact then (frictionC + (frictionS - frictionC) * exp(-speed_rel * speed_rel / ws / ws)) / keci0 else 0;
  der(z) = if contact then speed_rel - abs(speed_rel) / gw * z else 0;
  friction = if contact then keci0 * z + keci1 * der(z) + keci2 * speed_rel else 0;
  y = der(z);
  free = f_pressure <= 0;
  // used to deal with the pulse torque when contact occur
  when edge(contact) then
    reinit(z, if speed_rel > 0 then gw else -gw);
    reinit(y, 0);
  end when;
end Internal_ContinuousTransientFriction;
