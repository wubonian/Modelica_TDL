within TDL_v1.MechanicalActuator.ExternalForce;
model Rotational_ExternalForce
  extends
    TDL_v1.BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D;
  Modelica.Blocks.Interfaces.RealInput u_input
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  u=u_input;
  flange_a.tau=-y;
end Rotational_ExternalForce;
