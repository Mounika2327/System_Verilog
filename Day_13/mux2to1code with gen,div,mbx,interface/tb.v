class generator;
    mailbox mbx;
    bit a;
    bit b;
    bit sel;

    task run();
      
      for (int i = 0; i < 8; i++) begin
            {sel, a, b} = i;
            mbx.put({sel, a, b});
            $display("GENERATOR: sel=%0b, a=%0b, b=%0b", sel, a, b);
        end
    endtask
endclass

class driver;
    mailbox mbx;
    virtual mux_if vif;

    task run();
      bit [2:0] temp;
        forever begin
            mbx.get(temp);
            vif.sel = temp[2];
            vif.a   = temp[1];
            vif.b   = temp[0];
            #5;
            $display("DRIVER: a=%0b, b=%0b, sel=%0b => y=%0b", vif.a, vif.b, vif.sel, vif.y);
        end
    endtask
endclass

module tb;
    mux_if mif();
    mux2to1 dut (.a(mif.a), .b(mif.b), .sel(mif.sel), .y(mif.y));

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
