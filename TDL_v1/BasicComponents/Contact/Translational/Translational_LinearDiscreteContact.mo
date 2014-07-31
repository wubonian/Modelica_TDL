within TDL_v1.BasicComponents.Contact.Translational;
model Translational_LinearDiscreteContact
  parameter Modelica.SIunits.Position distance;
  extends
    BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDiscreteContact;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  parameter Modelica.SIunits.TranslationalSpringConstant c_contact;
  parameter Modelica.SIunits.TranslationalDampingConstant d_contact;
equation
  c = c_contact;
  d = d_contact;
  distance_rel = s_rel+distance;
  speed_rel = v_rel;
  f = -react;
end Translational_LinearDiscreteContact;
