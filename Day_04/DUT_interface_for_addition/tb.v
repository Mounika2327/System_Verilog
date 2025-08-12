logic [2:0] a;
  logic [2:0] b;
  logic [3:0] c;
endinterface
  
module tb;
  inter aif();
  add u1 (.a(aif.a),.b(aif.b),.c(aif.c));
  initial begin
    aif.a=5; aif.b=3; #10;
    aif.a=4; aif.b=1;
  end
   initial begin
     $monitor("a=%0d,b=%0d,c=%0d",aif.a,aif.b,aif.c);
     #100;
     $finish;
   end
      
endmodule
