module mux2to1 (
  input   a,b,sel,      
  output  y      );
    assign y = sel ? b : a;
endmodule

interface mux_if;
    logic a;
    logic b;
    logic sel;
    logic y;
endinterface
