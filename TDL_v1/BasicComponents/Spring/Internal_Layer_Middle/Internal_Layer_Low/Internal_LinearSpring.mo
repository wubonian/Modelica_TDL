within TDL_v1.BasicComponents.Spring.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_LinearSpring
  Real distance_rel;
  Real react_spring;
  Real c;
equation
  react_spring = -c * distance_rel;
end Internal_LinearSpring;
