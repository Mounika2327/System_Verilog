interface inter;
  logic d;
  logic  clk;
  logic rst;
  logic q;
endinterface
  
module tb;
  inter aif();

  initial begin
    aif.clk=0;
   forever #5 aif.clk=~aif.clk;
  end
  
  dff u1 (.d(aif.d),.q(aif.q),.clk(aif.clk),.rst(aif.rst));
  
  initial begin
    aif.d=0;#10;
    aif.d=1; #10;
     
  end
   initial begin
     $monitor("clk=%0b,d=%0b,q=%0b",aif.clk,aif.d,aif.q);
     #20;
     $finish;
   end
      
endmodule
