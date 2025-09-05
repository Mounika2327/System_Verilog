// Code your design here
module demux1to2 (
  input   a,sel,      
  output  y0 ,y1    );
  assign y0 = (~sel) & a ;
  assign y1 = (sel) & a ;
  
endmodule

interface demux_if;
    logic a;
    logic sel;
    logic y0;
    logic y1;
endinterface
