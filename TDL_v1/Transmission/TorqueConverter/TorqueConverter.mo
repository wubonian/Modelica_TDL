within TDL_v1.Transmission.TorqueConverter;
model TorqueConverter "Hydrodynamic torque converter with lockup clutch"
  import SI = Modelica.SIunits;
  import Modelica.SIunits.Conversions.*;
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
  extends
    Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;

  parameter Real w_ref=1000 "Reference angular velocity for tau_ref";
  parameter SI.Inertia J_pump=0.002 "Inertia moment of pump";
  parameter SI.Inertia J_turbine=0.002 "Inertia moment of turbine";

  parameter Boolean tableOnFile=true "True, if trilok table is defined on file";
  parameter Real table[:, 3]=[0, 0, 0; 1, 1, 1]
    "Table [nue, mue, tau_ref], details see info"
    annotation (Dialog(enable=not tableOnFile));
  parameter String fileName="Gearbox.txt" "File name where table is stored"
                                      annotation (Dialog(enable=tableOnFile));
  parameter String tableName="torqueConverter"
    "Name of trilok table for driving torque"
    annotation (Dialog(enable=tableOnFile));

  Modelica.Mechanics.Rotational.Components.Clutch lockUpClutch(fn_max=1000,
      useHeatPort=useHeatPort) annotation (Placement(transformation(extent={{-10,
            20},{10,40}}, rotation=0)));
  Modelica.Mechanics.MultiBody.Parts.Rotor1D turbineInertia(final J=J_turbine,
      animation=false) annotation (Placement(transformation(extent={{50,-10},{
            70,10}}, rotation=0)));
  Modelica.Mechanics.MultiBody.Parts.Rotor1D pumpInertia(final J=J_pump,
      animation=false) annotation (Placement(transformation(extent={{-70,-10},
            {-50,10}}, rotation=0)));
  ConverterCore core(
    final w_ref=w_ref,
    useSupport=false,
    useHeatPort=useHeatPort) annotation (Placement(transformation(extent={{-10,
            -10},{10,10}}, rotation=0)));
  replaceable Modelica.Blocks.Tables.CombiTable1Ds muTauRefTable(
    final tableOnFile=tableOnFile,
    final table=table,
    final tableName=tableName,
    final fileName=fileName,
    columns=2:3) constrainedby Modelica.Blocks.Interfaces.SIMO annotation (
      Placement(transformation(extent={{10,-50},{-10,-30}}, rotation=0)));

  Modelica.Mechanics.MultiBody.Parts.Mounting1D Mounting1D annotation (
      Placement(transformation(extent={{-10,-80},{10,-60}}, rotation=0)));
  Modelica.Mechanics.Rotational.Components.RelativeStates relativeStates(
    w_rel(fixed=true),
    phi_rel(fixed=true),
    a_rel(fixed=false),
    stateSelect=StateSelect.always) annotation (Placement(transformation(
          extent={{60,40},{80,60}}, rotation=0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a if world.driveTrainMechanics3D
    annotation (Placement(transformation(extent={{-16,-16},{16,16}},
          rotation=-90,
        origin={0,-100})));
  Modelica.Blocks.Interfaces.RealInput f_normalized
    "Normalized force on lockup clutch (0 .. 1)" annotation (Placement(
        transformation(extent={{-120,40},{-80,80}}, rotation=0)));

public
  model ConverterCore "Core of a hydrodynamic torque converter"
    import Modelica.SIunits.Conversions.*;
    import SI = Modelica.SIunits;
    extends
      Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;

    Modelica.SIunits.Angle phi_a "Angle between left shaft flange and support";
    Modelica.SIunits.Angle phi_b "Angle between right shaft flange and support";
    extends
      Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;

    constant Real eps=1.e-10;

    parameter Real w_ref=1000 "Reference angular velocity for tau_ref";

    SI.AngularVelocity w_a "Angular velocity of flange_a (pump)";
    SI.AngularVelocity w_b "Angular velocity of flange_b (turbine)";
    Real mu
      "Torque multiplication mue = flange_b.tau/flange_a.tau (i.e. turbine torque / pump torque)";
    SI.Torque tau_ref
      "Reference pump torque tau_ref = flange_a.tau/(w_a^2/w_ref^2) (i.e. pump torque / squared pump angular velocity ratio)";

    Modelica.Blocks.Interfaces.RealInput muAndTauRef[2]
      "Input signal vector: [mue, tau_ref]" annotation (Placement(
          transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput nu
      "Speed factor nue = w_b/w_a = w_turbine/w_pump" annotation (Placement(
          transformation(extent={{100,-70},{120,-50}}, rotation=0)));
  equation
    phi_a = flange_a.phi - phi_support;
    phi_b = flange_b.phi - phi_support;
    w_a = der(phi_a);
    w_b = der(phi_b);

    nu = if noEvent(w_a > eps) or noEvent(w_a < -eps) then w_b/w_a else 0;

    mu = muAndTauRef[1];
    tau_ref = muAndTauRef[2];

    flange_a.tau = tau_ref*(w_a/from_rpm(w_ref))^2;
    flange_b.tau = -mu*flange_a.tau;

    // Lossy power
    lossPower = flange_a.tau*w_a*(1 - mu*nu);

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-48,38},{52,-12}},
            lineColor={0,0,0},
            textString="core"),
          Text(
            extent={{48,-64},{108,-82}},
            lineColor={0,0,0},
            textString="nu"),
          Text(
            extent={{-98,-64},{2,-82}},
            lineColor={0,0,0},
            textString="{mu, tau_ref}"),
          Text(
            extent={{-90,78},{90,28}},
            lineColor={0,0,0},
            textString="Converter"),
          Text(
            extent={{-100,140},{100,100}},
            lineColor={0,0,255},
            textString="%name")}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics),
      Documentation(revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>", info="<html>
<p>
This class reflects the core equations for a hydrodynamic torque converter.</p>
<p>
The equations base upon an experimental measurement of a converter which has been investigated on a test rig at constant speed <code>w_ref</code> of pump. Holding constant pump speed <code>w_ref</code> at different loads of the turbine, the reference pump torque <code>tau_ref</code> can be identified. </p>
<p>
The actual torque on flange_a (pump) depends on the input signal <code>tau_ref</code> and on the actual pump speed <code>w_pump&nbsp;=&nbsp;w_a</code>. 
The torque on flange_b (turbine) depends on the input signal <code>mue</code> (torque conversion factor).
The output speed factor <code>nue&nbsp;=&nbsp;w_turbine/w_pump</code>.</p>
</html>"));
  end ConverterCore;
protected
  outer Modelica.Mechanics.MultiBody.World world;
equation
  lossPower = core.lossPower;
  connect(lockUpClutch.flange_a, core.flange_a) annotation (Line(points={{-10,
          30},{-30,30},{-30,0},{-10,0}}, color={0,0,0}));
  connect(lockUpClutch.flange_b, core.flange_b)
    annotation (Line(points={{10,30},{30,30},{30,0},{10,0}}, color={0,0,0}));
  connect(pumpInertia.flange_b, core.flange_a)
    annotation (Line(points={{-50,0},{-10,0}}, color={0,0,0}));
  connect(core.flange_b, turbineInertia.flange_a)
    annotation (Line(points={{10,0},{50,0}}, color={0,0,0}));
  connect(pumpInertia.flange_a, flange_a)
    annotation (Line(points={{-70,0},{-100,0}}, color={0,0,0}));
  connect(turbineInertia.flange_b, flange_b)
    annotation (Line(points={{70,0},{100,0}}, color={0,0,0}));
  connect(core.nu, muTauRefTable.u) annotation (Line(points={{11,-6},{20,-6},{
          20,-40},{12,-40}}, color={0,0,127}));
  connect(muTauRefTable.y, core.muAndTauRef) annotation (Line(points={{-11,-40},
          {-20,-40},{-20,-6},{-12,-6}}, color={0,0,127}));
  connect(Mounting1D.frame_a, frame_a) annotation (Line(
      points={{0,-80},{0,-100}},
      color={0,0,0},
      thickness=0.5));
  connect(turbineInertia.frame_a, frame_a) annotation (Line(
      points={{60,-10},{60,-90},{0,-90},{0,-100}},
      color={0,0,0},
      thickness=0.5));
  connect(pumpInertia.frame_a, frame_a) annotation (Line(
      points={{-60,-10},{-60,-90},{0,-90},{0,-100}},
      color={0,0,0},
      thickness=0.5));
  connect(flange_a, relativeStates.flange_a) annotation (Line(points={{-100,0},
          {-80,0},{-80,50},{60,50}}, color={0,0,0}));
  connect(relativeStates.flange_b, flange_b)
    annotation (Line(points={{80,50},{100,50},{100,0}}, color={0,0,0}));
  connect(f_normalized, lockUpClutch.f_normalized)
    annotation (Line(points={{-100,60},{0,60},{0,41}}, color={0,0,127}));
  connect(core.support, Mounting1D.flange_b) annotation (Line(
      points={{0,-10},{0,-16},{40,-16},{40,-70},{10,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(core.heatPort, heatPort) annotation (Line(
      points={{-10,-10},{-10,-20},{-100,-20},{-100,-100}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(lockUpClutch.heatPort, heatPort) annotation (Line(
      points={{-10,20},{-26,20},{-26,-20},{-100,-20},{-100,-100}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Rectangle(
          extent={{-100,10},{-50,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={180,180,207}),
        Rectangle(
          extent={{-60,88},{50,-88}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-32,42},{-32,-42}}, color={0,0,0}),
        Line(points={{-32,0},{-4,0}}, color={0,0,0}),
        Polygon(
          points={{-2,-60},{-2,60},{-12,50},{-12,-52},{-2,-60}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          lineColor={0,0,255}),
        Rectangle(
          extent={{-32,8},{100,-8}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={230,230,255}),
        Ellipse(
          extent={{-10,78},{50,18}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{18,78},{18,64},{13.2,42},{0,24},{0,16},{32,16},{48,28},{54,
              50},{46,70},{34,78},{18,78}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,48},{38,24},{34.2,21.4},{29.8,19.6},{25.2,18.2},{19.6,
              17.8},{14,18.6},{9.6,19.8},{6,21.6},{3.4,23.2},{20,48}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-10,-78},{50,-18}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{18,-78},{18,-64},{13.2,-42},{0,-24},{0,-16},{32,-16},{48,-28},
              {54,-50},{46,-70},{34,-78},{18,-78}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,-48},{38,-24},{34.2,-21.4},{29.8,-19.6},{25.2,-18.2},{
              19.6,-17.8},{14,-18.6},{9.6,-19.8},{6,-21.6},{3.4,-23.2},{20,-48}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{22,78},{28,76},{28,88},{-60,88},{-60,-88},{28,-88},{28,-76},
              {22,-78},{22,-82},{-50,-82},{-50,82},{22,82},{22,78}},
          lineColor={115,115,115},
          fillColor={180,180,207},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20.2,78},{20.2,48},{38,24},{43,28.6},{46.4,33.8},{49.2,40.8},
              {50,48},{49.4,54},{47.8,59.4},{45,64.6},{41.6,69},{37.2,72.6},{
              32.8,75.2},{27.8,77},{22.8,78},{20.2,78}},
          lineColor={95,95,95},
          fillColor={180,180,207},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20.2,-78},{20.2,-48},{38,-24},{43,-28.6},{46.4,-33.8},{49.2,
              -40.8},{50,-48},{49.4,-54},{47.8,-59.4},{45,-64.6},{41.6,-69},{
              37.2,-72.6},{32.8,-75.2},{27.8,-77},{22.8,-78},{20.2,-78}},
          lineColor={95,95,95},
          fillColor={180,180,207},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{4,68},{34,34}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{4,-68},{34,-34}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{26.6,43.6},{42,23.4},{39.6,21.2},{24.8,41.8},{26.6,43.6}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{26.6,-43.6},{42,-23.4},{39.6,-21.2},{24.8,-41.8},{26.6,-43.6}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-20},{-70,-20}}, color={0,0,0}),
        Line(points={{-90,20},{-70,20}}, color={0,0,0}),
        Line(points={{-80,30},{-80,20}}, color={0,0,0}),
        Line(points={{-80,-20},{-80,-100},{70,-100},{70,-20}}, color={0,0,0}),
        Line(points={{60,-20},{80,-20}}, color={0,0,0}),
        Line(points={{60,20},{80,20}}, color={0,0,0}),
        Line(points={{70,30},{70,20}}, color={0,0,0}),
        Line(points={{-50,40},{-40,40}}, color={0,0,0}),
        Line(points={{-50,-40},{-40,-40}}, color={0,0,0}),
        Line(points={{-100,60},{-32,60},{-32,52}}, color={0,0,127}),
        Line(points={{-24,30},{-24,50},{-40,50},{-40,30}}, color={95,95,95}),
        Line(points={{-24,-30},{-24,-50},{-40,-50},{-40,-30}}, color={95,95,95}),
        Line(
          visible=useHeatPort,
          points={{-100,-100},{-100,-70},{0,-70},{18,-52}},
          color={191,0,0},
          pattern=LinePattern.Dot,
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p>
This is a model of hydrodynamic torque converter which is usually used 
as coupler between the combustion engine of a vehicle and an automatic gearbox.</p>
<p>
The torque converter consists of pump (or impeller), turbine and stator, 
where the latter is mounted with a one-way clutch. 
Additionally, there is realized the lockup clutch (by a friction clutch) to allow 
direct coupling of the torque converter pump and turbine.
The model also includes two lumped inertia terms, one for the pump and
drive plate of the lockup clutch and one for the turbine and driven plate of
the clutch.  
The signal input to the model controls the lockup clutch position.</p>
<p>
The element characteristics are primarily defined by a (n,3) combi-table 
where the columns have the following meaning:
<pre>
   column 1 ... Speed factor &nu; [-]:             nue     = w_turbine/w_pump,
   column 2 ... Torque conversion factor &mu; [-]: mue     = tau_turbine/tau_pump,
   column 3 ... Reference pump torque [Nm]:     tau_ref = tau_pump/(w_pump/w_ref)^2,
</pre>
where
<pre>
   w_turbine  : angular velocity of turbine [rev/min],
   w_pump     : angular velocity of pump [rev/min],
   tau_turbine: torque of turbine [Nm],
   tau_pump   : torque of pump [Nm],
   w_ref      : reference angular velocity for tau_ref [rev/min].
</pre>
The table can be defined either directly as a Modelica matrix or 
by a table stored on file or can use a static array in function usertab
on file usertab.c.</p>
<p>
Based on a model written by Anders Eriksson and Bengt Jacobson.</p>
</html>
", revisions="<html>
<table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://PowerTrain/Resources/Images/dlr_logo.png\" ></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end TorqueConverter;
