within TDL_v1.BasicComponents.Damper.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_LinearDamper
  Real speed_rel;
  Real react_damper;
  Real d;
equation
  react_damper = -d * speed_rel;
end Internal_LinearDamper;
