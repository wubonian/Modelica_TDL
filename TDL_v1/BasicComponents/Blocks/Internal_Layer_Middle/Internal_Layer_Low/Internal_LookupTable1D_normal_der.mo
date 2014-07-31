within TDL_v1.BasicComponents.Blocks.Internal_Layer_Middle.Internal_Layer_Low;
partial model Internal_LookupTable1D_normal_der
  Real u;
  Real u_der;
  Real y;
  Real y_der;
  parameter Boolean tableOnFile = false;
  parameter Real table[:,2]=[0,1] annotation(Dialog(enable=not tableOnFile));
  parameter String tableName = "NoName" annotation(Dialog(enable = tableOnFile));
  parameter String fileName = "NoName" annotation (Dialog(
      enable=tableOnFile,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  final parameter Boolean verboseRead = true annotation(Dialog(enable = tableOnFile));
  final parameter Integer columns[:] = 2:size(table, 2);
  final parameter Modelica.Blocks.Types.Smoothness smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments;
protected
  Modelica.Blocks.Types.ExternalCombiTable1D tableID = Modelica.Blocks.Types.ExternalCombiTable1D(if tableOnFile then tableName else "NoName", if tableOnFile and fileName <> "NoName" and not Modelica.Utilities.Strings.isEmpty(fileName) then fileName else "NoName", table, columns, smoothness);
  Real tableOnFileRead(fixed=false);
  function readTableData "Read table data from ASCII text or MATLAB MAT-file"
    extends Modelica.Icons.Function;
    input Modelica.Blocks.Types.ExternalCombiTable1D tableID;
    input Boolean forceRead = false
      "= true: Force reading of table data; = false: Only read, if not yet read.";
    input Boolean verboseRead
      "= true: Print info message; = false: No info message";
    output Real readSuccess "Table read success";
    external"C" readSuccess=  ModelicaStandardTables_CombiTable1D_read(tableID, forceRead, verboseRead)
      annotation (Library={"ModelicaStandardTables"});
  end readTableData;

  function getTableValue "Interpolate 1-dim. table defined by matrix"
    extends Modelica.Icons.Function;
    input Modelica.Blocks.Types.ExternalCombiTable1D tableID;
    input Integer icol;
    input Real u;
    input Real tableAvailable
      "Dummy input to ensure correct sorting of function calls" annotation(__OpenModelica_UnusedVariable = true);
    output Real y;
    external"C" y=  ModelicaStandardTables_CombiTable1D_getValue(tableID, icol, u)
      annotation (Library={"ModelicaStandardTables"});
    annotation (derivative(noDerivative=tableAvailable) = getDerTableValue);
  end getTableValue;

  function getTableValueNoDer
    "Interpolate 1-dim. table defined by matrix (but do not provide a derivative function)"
    extends Modelica.Icons.Function;
    input Modelica.Blocks.Types.ExternalCombiTable1D tableID;
    input Integer icol;
    input Real u;
    input Real tableAvailable
      "Dummy input to ensure correct sorting of function calls" annotation(__OpenModelica_UnusedVariable = true);
    output Real y;
    external"C" y=  ModelicaStandardTables_CombiTable1D_getValue(tableID, icol, u)
      annotation (Library={"ModelicaStandardTables"});
  end getTableValueNoDer;

  function getDerTableValue
    "Derivative of interpolated 1-dim. table defined by matrix"
    extends Modelica.Icons.Function;
    input Modelica.Blocks.Types.ExternalCombiTable1D tableID;
    input Integer icol;
    input Real u;
    input Real tableAvailable
      "Dummy input to ensure correct sorting of function calls" annotation(__OpenModelica_UnusedVariable = true);
    input Real der_u;
    output Real der_y;
    external"C" der_y=  ModelicaStandardTables_CombiTable1D_getDerValue(tableID, icol, u, der_u)
      annotation (Library={"ModelicaStandardTables"});
  end getDerTableValue;
equation
  when initial() then
    if tableOnFile then
      tableOnFileRead =  readTableData(tableID, false, verboseRead);
    else
      tableOnFileRead =  1.;
    end if;
  end when;
  if tableOnFile then
    assert(tableName <> "NoName", "tableOnFile = true and no table name given");
  else
    assert(size(table, 1) > 0 and size(table, 2) > 0, "tableOnFile = false and parameter table is an empty matrix");
  end if;
  if smoothness == Modelica.Blocks.Types.Smoothness.ConstantSegments then
    y = getTableValueNoDer(tableID, 1, u, tableOnFileRead);
  else
    y = getTableValue(tableID, 1, u, tableOnFileRead);
  end if;
  y_der = getDerTableValue(tableID, 1, u, tableOnFileRead,u_der);
end Internal_LookupTable1D_normal_der;
