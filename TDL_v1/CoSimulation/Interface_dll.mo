within TDL_v1.CoSimulation;
model Interface_dll
  parameter String dll_name_ex = "CoSimulation_win32.dll";
  parameter String init_name_ex = "CoSimulation_initialize";
  parameter String step_name_ex = "CoSimulation_step";
  parameter String ter_name_ex = "CoSimulation_terminate";
  parameter String in_name_ex = "CoSimulation_U";
  parameter String out_name_ex = "CoSimulation_Y";
  parameter Integer in_num_ex = 4;
  parameter Integer out_num_ex = 5;
  extends Modelica.Blocks.Interfaces.DiscreteBlock;
  Handle hand = Handle(dll_name=  dll_name_ex, init_name=  init_name_ex, step_name=  step_name_ex, ter_name=  ter_name_ex, in_name=  in_name_ex, out_name=  out_name_ex);
  input Modelica.Blocks.Interfaces.RealInput u[in_num_ex] annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
  output Modelica.Blocks.Interfaces.RealOutput y[out_num_ex] annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
protected
  class Handle
    extends ExternalObject;
    function constructor
      input String dll_name = "";
      input String init_name = "";
      input String step_name = "";
      input String ter_name = "";
      input String in_name = "";
      input String out_name = "";
      output Handle hand;

      external "C" hand = initHandle(dll_name,init_name,step_name,ter_name,in_name,out_name)       annotation(Include = "#include \"main.c\"");
    end constructor;

    function destructor
      input Handle hand;

      external "C" closeHandle(hand)       annotation(Include = "#include \"main.c\"");
    end destructor;
    annotation(uses(Modelica(version = "3.2")));
  end Handle;

  function controller
    input Handle hand;
    input Real u[:];
    input Integer in_num;
    input Integer out_num;
    output Real y[out_num];

    external "C" per_step(hand,u,in_num,y,out_num)     annotation(Include = "#include \"main.c\"");
  end controller;
algorithm
  //  x = {time,time};
  when {initial(),sampleTrigger} then
      y:=controller(hand, u, in_num_ex, out_num_ex);
  end when;
  annotation(viewSettings(clrRaster = 8421504), experiment(StopTime = 1, StartTime = 0), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
end Interface_dll;
