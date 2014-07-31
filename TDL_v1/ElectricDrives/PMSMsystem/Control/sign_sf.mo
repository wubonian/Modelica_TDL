within TDL_v1.ElectricDrives.PMSMsystem.Control;
function sign_sf
  input Real u;
  output Integer y;
protected
  constant Integer up = 1,down = 0;
algorithm
  y:=if u >= 0 then up else down;
end sign_sf;
