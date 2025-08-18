//half adder code with generator , driver , mailbox, interface 


class generator;
  mailbox mbx;
  bit a;
  bit b;
  int i=0;
  
  task run();
    for(i=0;i<4;i++)begin
       {a,b}=i;
       mbx.put({a,b});
      $display("generator test cases : a=%0b, b=%0b",a,b);
    end
    
  endtask
endclass
 
class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
        bit [1:0]temp;
    bit a,b;
    forever begin
      #1;
    mbx.get(temp);
    vif.a=temp[1];
    vif.b=temp[0];
    #10;
    $display("Driver applied test cases : a=%0b,b=%0b and output from dut sum =%0b, carry=%0b",vif.a,vif.b,vif.sum,vif.carry);
    end
  endtask
endclass

module tb;

  ha u1(aif.a,aif.b,aif.sum,aif.carry);
  inter aif();
  generator gen;
  mailbox mbx;
  driver div;
  initial begin
    gen=new();
    mbx=new();
    div=new();
    gen.mbx=mbx;
    div.mbx=mbx;
    div.vif=aif;
    
    gen.run();
    div.run();
  end
endmodule
