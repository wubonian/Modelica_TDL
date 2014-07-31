within TDL_v1.BasicComponents.Spring.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_NonlinearSpring
  // Reference Modelica.Blocks.Tables.CombiTable1D for more information
  extends
    BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D;
  Real distance_rel;
  Real react_spring;
equation
  u= -distance_rel;
  react_spring = y*u;
  annotation(Documentation(info = "<html>
<p><code>Nonlinear characteristic is represent in the form a table, it can either be manually specifieed, or reaad data from a pre-defined table. The value read out is force or torque. N<font style=\"color: #006400; \">egative&nbsp;distance&nbsp;value&nbsp;corresponds&nbsp;to&nbsp;compression,&nbsp;0&nbsp;corresponds&nbsp;to&nbsp;initial&nbsp;state. React&nbsp;force&nbsp;has&nbsp;positive&nbsp;value;</font></code></p>
</html>"));
end Internal_NonlinearSpring;
