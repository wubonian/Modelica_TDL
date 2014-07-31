within TDL_v1.BasicComponents.Contact.Translational;
model Translational_NonlinearDiscreteContact
  parameter Modelica.SIunits.Position distance;
  extends
    BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearDiscreteContact;
  extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  parameter Modelica.SIunits.TranslationalDampingConstant d_contact;
equation
  d = d_contact;
  distance_rel = s_rel+distance;
  speed_rel = v_rel;
  f = -react;
end Translational_NonlinearDiscreteContact;
