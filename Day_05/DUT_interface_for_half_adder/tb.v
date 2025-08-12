interface inter;
logic a;
  logic  b;
  logic sum;
  logic carry;
endinterface
  
module tb;
  inter aif();
  fadd u1 (.a(aif.a),.b(aif.b),.sum(aif.sum),.carry(aif.carry));
  initial begin
    aif.a=0; aif.b=0; #10;
    aif.a=0; aif.b=1; #10;
     aif.a=1; aif.b=0; #10;
     aif.a=1; aif.b=1; 
  end
   initial begin
     $monitor("a=%0b,b=%0b,sum=%0b,carry=%0b",aif.a,aif.b,aif.sum,aif.carry);
     #100;
     $finish;
   end
      
endmodule
