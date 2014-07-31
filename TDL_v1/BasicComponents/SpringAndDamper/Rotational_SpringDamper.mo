within TDL_v1.BasicComponents.SpringAndDamper;
model Rotational_SpringDamper
  parameter SpringAndDamper.Types.Mode_R mode_select=SpringAndDamper.Types.Mode_R.LL;
  parameter Modelica.SIunits.RotationalSpringConstant c=1 annotation(Dialog(enable = mode == 1 or mode==3));
  parameter Modelica.SIunits.RotationalDampingConstant d=1 annotation(Dialog(enable= mode==1 or mode==2));
  parameter Boolean tableOnFile_spring = false annotation(Dialog(enable= mode==2 or mode==4));
  parameter Real table_spring[:,2]=[0,1] annotation(Dialog(enable= mode==2 or mode==4));
  parameter String tableName_spring = "NoName" annotation(Dialog(enable = tableOnFile_spring and (mode==2 or mode==4)));
  parameter String fileName_spring = "NoName" annotation(Dialog(enable = tableOnFile_spring and (mode==2 or mode==4)));
  parameter Boolean tableOnFile_damper = false annotation(Dialog(enable= mode==3 or mode==4));
  parameter Real table_damper[:,2]=[0,1] annotation(Dialog(enable= mode==3 or mode==4));
  parameter String tableName_damper = "NoName" annotation(Dialog(enable = tableOnFile_damper and (mode==3 or mode==4)));
  parameter String fileName_damper = "NoName" annotation(Dialog(enable = tableOnFile_damper and (mode==3 or mode==4)));

  Rotational.Rotational_LinearSpringLinearDamper mode_1(c_LL=c, d_LL=d) if
                                           mode==1
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Rotational.Rotational_NonlinearSpringLinearDamper mode_2(
    tableOnFile=tableOnFile_spring,
    table=table_spring,
    tableName=tableName_spring,
    fileName=fileName_spring,
    d_NL=d) if                                                                                                     mode==2
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Rotational.Rotational_LinearSpringNonlinearDamper mode_3(
    tableOnFile=tableOnFile_damper,
    table=table_damper,
    tableName=tableName_damper,
    fileName=fileName_damper,
    c_LN=c) if                                                                                                     mode==3
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  Rotational.Rotational_NonlinearSpringNonlinearDamper mode_4(
    tableOnFile_damper=tableOnFile_damper,
    table_damper=table_damper,
    tableName_damper=tableName_damper,
    fileName_damper=fileName_damper,
    tableOnFile_spring=tableOnFile_spring,
    table_spring=table_spring,
    tableName_spring=tableName_spring,
    fileName_spring=fileName_spring) if                                                                                                     mode==4
    annotation (Placement(transformation(extent={{-10,-68},{10,-48}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
protected
  parameter Integer mode=if mode_select==SpringAndDamper.Types.Mode_R.LL then 1 elseif mode_select==SpringAndDamper.Types.Mode_R.NL then 2
 elseif
       mode_select==SpringAndDamper.Types.Mode_R.LN then 3 else 4;
equation
  connect(flange_a, mode_3.flange_a)
    annotation (Line(
      points={{-100,0},{-56,0},{-56,-20},{-10,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_a, mode_2.flange_a)
    annotation (Line(
      points={{-100,0},{-56,0},{-56,20},{-10,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_a, mode_1.flange_a)                              annotation (
      Line(
      points={{-100,0},{-56,0},{-56,60},{-10,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_a, mode_4.flange_a)
    annotation (Line(
      points={{-100,0},{-56,0},{-56,-58},{-10,-58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_b, mode_1.flange_b)                              annotation (
      Line(
      points={{100,0},{56,0},{56,60},{10,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_b, mode_2.flange_b)
    annotation (Line(
      points={{100,0},{56,0},{56,20},{10,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_b, mode_3.flange_b)
    annotation (Line(
      points={{100,0},{56,0},{56,-20},{10,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_b, mode_4.flange_b)
    annotation (Line(
      points={{100,0},{56,0},{56,-58},{10,-58}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Rotational_SpringDamper;
