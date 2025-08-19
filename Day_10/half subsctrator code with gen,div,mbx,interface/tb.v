class generator;
  mailbox mbx;
  bit a,b;
  task run();
    for(int i=0;i<4;i++)begin
      {a,b}=i;
      $display("generator test cases : A=%0b,B=%0b",a,b);
      mbx.put({a,b});
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif;
  bit [1:0]temp;
  bit a,b;
  task run();
    forever begin 
      mbx.get(temp);
      vif.a=temp[1];
      vif.b=temp[0];
      #5;
      $display("driver applied test cases : A=%0b,B=%0b and output fromm dut DIFFERENCE=%0b,BORROW=%0b",vif.a,vif.b,vif.diff,vif.borw);
    end
  endtask
endclass

module tb;
  hs u1(.a(aif.a),.b(aif.b),.diff(aif.diff),.borw(aif.borw));
  inter aif();
  generator gen;
  driver div;
  mailbox mbx;
  initial begin
    gen=new();
    div=new();
    mbx=new();
    gen.mbx=mbx;
    div.mbx=mbx;
    div.vif=aif;
    
    gen.run();
    div.run();
  end
  initial begin
    #100;
    $finish;
  end
endmodule
