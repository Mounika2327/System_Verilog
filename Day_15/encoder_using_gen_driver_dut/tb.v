// Code your testbench here
// or browse Examples
class generator;
    mailbox mbx;
    bit [3:0] a;
    task run();
        for (int i = 0; i < 4; i++) begin
            a = 4'b0001 << i;
            mbx.put(a);
          $display("GENERATOR: a=%0b", a);
        end
    endtask
endclass

class driver;
    mailbox mbx;
    virtual encoder_if vif;
    task run();
        bit [3:0] temp;
        forever begin
            mbx.get(temp);
            vif.a = temp;
            #5;
            $display("DRIVER: a=%0b => y=%0b", vif.a, vif.y);
        end
    endtask
endclass

module tb;
    encoder_if eif();
    encoder4to2 dut (.a(eif.a), .y(eif.y));
    generator gen;
    driver    drv;
    mailbox   mbx;
    initial begin
        gen = new();
        drv = new();
        mbx = new();
        gen.mbx = mbx;
        drv.mbx = mbx;
        drv.vif = eif;
        fork
            gen.run();
            drv.run();
        join
        #50 $finish;
    end
endmodule
