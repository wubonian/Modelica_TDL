within TDL_v1.Transmission.Differential;
model Differential "Basic differential gear box, no mounts, no inertias"

  parameter Real ratio=1 "Gear ratio";
  parameter Real torqueBias=50/50 "Torque split output1/output2";
protected
  final parameter Real k = (1 + torqueBias)/ratio;
public
  Modelica.Mechanics.Rotational.Interfaces.Flange_a diffInput
    "Flange of input (driving) shaft"
                         annotation (Placement(transformation(extent={{-10,-110},
            {10,-90}}, rotation=0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b diffOutput1
    "Flange of output (driven) shaft 1"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=
           0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b diffOutput2
    "Flange of output (driven) shaft 2"
    annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
equation
  //  diffInput.phi = (diffOutput1.phi + diffOutput2.phi)*ratio/2;
  //  diffOutput1.tau = diffOutput2.tau;
  //  -ratio*diffInput.tau = diffOutput1.tau + diffOutput2.tau;
  diffInput.phi = diffOutput1.phi/k + (torqueBias/k)*diffOutput2.phi;

  // torque balance (no inertias)
  diffOutput1.tau = torqueBias*diffOutput2.tau;
  diffOutput2.tau = -diffInput.tau/k;

end Differential;
