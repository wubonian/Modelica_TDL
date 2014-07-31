within TDL_v1.Transmission.Clutch.Internal_Layer_Middle;
model Fault_DiaphragmSpring

  extends Internal_Layer_Low.Internal_DiaphragmSpring;

  import SI = Modelica.SIunits;
  parameter SI.Position parm_pos_endstop=0.0025;
  parameter SI.Position parm_pos_fulcrum=0.003;
  parameter SI.Position parm_pos_thrust_bearing=0.008;
  parameter SI.Length parm_l_large_edge=0.00333;
  parameter SI.Length parm_l_small_edge=0.00807;
  parameter SI.Mass parm_m_pressure_plate=10;

  parameter SI.TranslationalSpringConstant c_endstop=1e8;
  parameter SI.TranslationalDampingConstant d_endstop=2.1e5;
  parameter SI.TranslationalDampingConstant d_large_edge=2.1e5;
  parameter SI.TranslationalDampingConstant d_small_edge=2.1e5;

  parameter Boolean tableOnFile_large_edge = false;
  parameter Real table_large_edge[:,2]=[1,2] annotation(Dialog(enable = not tableOnFile_large_edge));
  parameter String tableName_large_edge = "NoName" annotation(Dialog(enable = tableOnFile_large_edge));
  parameter String fileName_large_edge = "NoName" annotation(Dialog(enable = tableOnFile_large_edge,loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));

  parameter Boolean tableOnFile_small_edge = false;
  parameter Real table_small_edge[:,2]=[1,2] annotation(Dialog(enable = not tableOnFile_small_edge));
  parameter String tableName_small_edge = "NoName" annotation(Dialog(enable = tableOnFile_small_edge));
  parameter String fileName_small_edge = "NoName" annotation(Dialog(enable = tableOnFile_small_edge,loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));

  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput f_press annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-100})));

  Nonlinear large_edge(tableOnFile=tableOnFile_large_edge,table=table_large_edge,tableName=tableName_large_edge,fileName=fileName_large_edge);
  Nonlinear small_edge(tableOnFile=tableOnFile_small_edge,table=table_small_edge,tableName=tableName_small_edge,fileName=fileName_small_edge);
  Linear endstop;
  model Nonlinear
    extends
      BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_NonlinearDiscreteContact;
  end Nonlinear;

  model Linear
    extends
      BasicComponents.Contact.Internal_Layer_Middle.Internal_Layer_Low.Internal_LinearDiscreteContact;
  end Linear;

  Modelica.Blocks.Interfaces.RealVectorInput fault[3]
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
equation
  pos_endstop=parm_pos_endstop-fault[1];
  pos_fulcrum=parm_pos_fulcrum;
  pos_thrust_bearing=parm_pos_thrust_bearing+flange_a.s;
  l_large_edge=parm_l_large_edge;
  l_small_edge=parm_l_small_edge;
  m_pressure_plate=parm_m_pressure_plate;

  large_edge.d=d_large_edge;
  large_edge.distance_rel=1000*s_rel_large_edge/fault[2];
  large_edge.speed_rel=v_rel_large_edge;

  small_edge.d=d_small_edge;
  small_edge.distance_rel=1000*s_rel_small_edge/fault[3];
  small_edge.speed_rel=v_rel_small_edge;

  endstop.c=c_endstop;
  endstop.d=d_endstop;
  endstop.distance_rel=s_rel_endstop;
  endstop.speed_rel=-v_rel_large_edge;

  f_endstop=endstop.react;
  f_large_edge=large_edge.react;
  f_small_edge=small_edge.react;

  f_press=f_endstop;
  flange_a.f=-f_small_edge;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Fault_DiaphragmSpring;
