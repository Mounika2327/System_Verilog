//generaator -> driver -> dut
interface inter;
  logic [2:0] a;
  logic [2:0] b;
  logic [3:0] c;
endinterface

class generator;
  int a=5;
  int b=5;
  mailbox mbx; 
  task run();
    bit [5:0] temp1 = {a[2:0], b[2:0]};
    mbx.put(temp1); 
    $display("GENERATOR Sent a=%0d b=%0d", a, b);
  endtask
endclass


class driver;
  mailbox mbx;          
      virtual inter vif;  
  task run();
  
    bit [5:0] temp;
    bit[2:0]a,b;
    mbx.get(temp); 
    vif.a = temp[5:3]; 
    vif.b = temp[2:0];
    
    
    
    $display(" Driven a=%0d b=%0d", vif.a,vif.b);
    #1;
    $display("DUT output c=%0d",vif.c);
    
  endtask
endclass

module tb;
  inter  aif(); 

  add u1 (.a(aif.a),.b(aif.b),.c(aif.c));

  
  generator gen;
  driver drv;
  mailbox mbx;

  initial begin
    gen = new();
    drv = new();
     mbx = new();

    gen.mbx = mbx;
    drv.mbx = mbx;
    drv.vif = aif;
  end

 initial begin
   fork
    gen.run();
    drv.run();
   join
  
  end
endmodule
