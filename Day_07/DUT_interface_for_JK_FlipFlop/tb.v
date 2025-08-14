interface inter;
  logic j;
  logic k;
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
  
  jkff u1 (.q(aif.q),.j(aif.j),.k(aif.k),.clk(aif.clk),.rst(aif.rst));
  
  initial begin
    aif.j=0; aif.k=0; #10;
    aif.j=0; aif.k=1; #10;
    aif.j=1; aif.k=0; #10;
    aif.j=1; aif.k=1; 
   
     
  end
   initial begin
     $monitor("clk=%0b,j=%0b,k=%0b,q=%0b",aif.clk,aif.j,aif.k,aif.q);
     #50;     $finish;
   end
      
endmodule
