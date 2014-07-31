within TDL_v1.BasicComponents.Blocks;
model LookupTable1D
  extends
    TDL_v1.BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low.Internal_LookupTable1D;
  Modelica.Blocks.Interfaces.RealInput u_in annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y_out annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
equation
  u = u_in;
  y = y_out;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end LookupTable1D;
