within TDL_v1.BasicComponents.Contact.Rotational;
model Rotational_NonlinearDiscreteContact
  parameter Modelica.SIunits.Angle distance;
  extends
    BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearDiscreteContact;
  extends
    Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
  parameter Modelica.SIunits.RotationalDampingConstant d_contact;
equation
  d = d_contact;
  distance_rel = phi_rel+distance;
  speed_rel = w_rel;
  tau = -react;
end Rotational_NonlinearDiscreteContact;
