// Code your design here
module hs(a,b,diff,borw);
  input a,b;
  output diff,borw;
  assign diff=a^b;
  assign borw=~a&b;
endmodule

interface inter;
  logic a;
  logic b;
  logic diff;
  logic borw;
endinterface
