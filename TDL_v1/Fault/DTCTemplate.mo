within TDL_v1.Fault;
record DTCTemplate
  Integer DTC_Number;
  Boolean DTC_Active;
  Integer DTC_Counter(start = 0);
  //----------Specify other necessary properties for DTC class------------
end DTCTemplate;
