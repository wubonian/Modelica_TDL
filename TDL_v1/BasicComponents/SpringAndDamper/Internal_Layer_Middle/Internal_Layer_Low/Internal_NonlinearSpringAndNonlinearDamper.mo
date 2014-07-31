within TDL_v1.BasicComponents.SpringAndDamper.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_NonlinearSpringAndNonlinearDamper
  parameter Boolean tableOnFile_spring = false;
  parameter Real table_spring[:,2];
  parameter String tableName_spring = "NoName" annotation(Dialog(enable = tableOnFile));
  parameter String fileName_spring = "NoName" annotation(Dialog(enable = tableOnFile));
  parameter Boolean tableOnFile_damper = false;
  parameter Real table_damper[:,2];
  parameter String tableName_damper = "NoName" annotation(Dialog(enable = tableOnFile));
  parameter String fileName_damper = "NoName" annotation(Dialog(enable = tableOnFile));
  BasicComponents.Blocks.LookupTable1D Spring(final tableOnFile = tableOnFile_spring, final table = table_spring, final tableName = tableName_spring, final fileName = fileName_spring);
  BasicComponents.Blocks.LookupTable1D Damper(final tableOnFile = tableOnFile_damper, final table = table_damper, final tableName = tableName_damper, final fileName = fileName_damper);
  Real distance_rel;
  Real speed_rel;
  Real react;
equation
  Spring.u = -distance_rel;
  Damper.u = -speed_rel;
  react = Spring.y + Damper.y;
end Internal_NonlinearSpringAndNonlinearDamper;
