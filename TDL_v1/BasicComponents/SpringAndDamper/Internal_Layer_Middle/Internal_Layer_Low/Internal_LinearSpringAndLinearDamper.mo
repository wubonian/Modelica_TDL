within TDL_v1.BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_LinearSpringAndLinearDamper
  extends
    BasicComponents.Spring.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearSpring;
  extends
    BasicComponents.Damper.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDamper;
  Real react;
equation
  react = react_spring + react_damper;
end Internal_LinearSpringAndLinearDamper;
