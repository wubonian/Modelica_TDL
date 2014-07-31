within TDL_v1.BasicComponents.Friction.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_DiscreteComplexFriction_2
  extends Internal_PartialDiscreteFriction;
  parameter Real mue_pos[:,2];
  Real mue0;
  Real cgeo;
  Real k;
  Real f_pressure;
  Real friction;
equation
  free = f_pressure <= 0;
  mue0 = Modelica.Math.tempInterpol1(0, mue_pos, 2);
  friction0 = f_pressure * mue0 * cgeo;
  friction0_max = k * friction0;
  friction = if locked then sa * unitFriction else if free then 0 else cgeo * f_pressure * (if startForward then Modelica.Math.tempInterpol1(speed_rel, mue_pos, 2) else if startBackward then -Modelica.Math.tempInterpol1(-speed_rel, mue_pos, 2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(speed_rel, mue_pos, 2) else -Modelica.Math.tempInterpol1(-speed_rel, mue_pos, 2));
  annotation(Documentation(info = "<html>
<p>This friction get its friction characteristic from a n*2 table mue_pos</p>
</html>"));
end Internal_DiscreteComplexFriction_2;
