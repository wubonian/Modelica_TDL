within TDL_v1.BasicComponents.Contact.Rotational;
model Rotational_LinearDiscreteContact
  parameter Modelica.SIunits.Angle distance;
  extends
    BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDiscreteContact;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
  parameter Modelica.SIunits.RotationalSpringConstant c_contact;
  parameter Modelica.SIunits.RotationalDampingConstant d_contact;
equation
  c = c_contact;
  d = d_contact;
  distance_rel = phi_rel+distance;
  speed_rel = w_rel;
  tau = -react;
end Rotational_LinearDiscreteContact;
