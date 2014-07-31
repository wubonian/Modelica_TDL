within TDL_v1.BasicComponents.Damper.Internal_Layer_Middle.Internal_Layer_Low;
model Internal_NonlinearDamper
  extends
    BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D;
  Real speed_rel;
  Real react_damper;
equation
  u= -speed_rel;
  react_damper=y*u;
  annotation(Documentation(info = "<html>
<p><code>Nonlinear characteristic is represent in the form a table, it can either be manually specifieed, or reaad data from a pre-defined table. The value read out is force or torque. N<font style=\"color: #006400; \">egative&nbsp;speed&nbsp;value&nbsp;corresponds&nbsp;to&nbsp;positive react force.</font></code></p>
</html>"));
end Internal_NonlinearDamper;
