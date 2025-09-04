module fs(a,b,c,diff,borw);
  input a,b,c;
  output diff,borw;
  assign diff=a^b^c;
  assign borw=((~(a^b)&c)+(~a&b));
endmodule

interface inter;
  logic a;
  logic b;
  logic c;
  logic diff;
  logic borw;
endinterface
