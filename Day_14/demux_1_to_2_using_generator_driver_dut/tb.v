// Code your testbench here
// or browse Examples
class generator;
    mailbox mbx;
    bit a;
    bit sel;
    bit y0;
    bit y1;
   

    task run();
      
      for (int i = 0; i < 4; i++) begin
        { sel,a} = i;
        mbx.put({ sel,a});
            $display("GENERATOR: sel=%0b, a=%0b", sel, a);
        end
    endtask
endclass

class driver;
    mailbox mbx;
    virtual demux_if vif;

    task run();
      bit [1:0] temp;
        forever begin
            mbx.get(temp);
            
          vif.sel  = temp[1];
          vif.a =  temp[0];
      
            #5;
          $display("DRIVER: a=%0b, sel=%0b => y0=%0b,y1=%0b", vif.a,  vif.sel, vif.y0,vif.y1);
        end
    endtask
endclass

module tb;
    demux_if mif();
  demux1to2 dut (.a(mif.a),.sel(mif.sel), .y0(mif.y0),.y1(mif.y1));

    generator gen;
    driver    drv;
    mailbox   mbx;

    initial begin
      
        gen = new();
        drv = new();
        mbx = new();

        gen.mbx = mbx;
        drv.mbx = mbx;
        drv.vif = mif;

    
        fork
            gen.run();
            drv.run();
        join

        #100 $finish;
    end
endmodule
