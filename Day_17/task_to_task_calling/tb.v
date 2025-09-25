// Code your testbench here
// or browse Examples
module top;
  bit [2:0]x;
  bit [2:0]y;
  bit[3:0]z;
  bit clk=0;
  always #10 clk=~clk;
  task add();
  z=x+y;
    $display( "clk=%0b |x=%0d | y=%0d |z=%0d",clk,x,y,z);
  endtask
  initial begin
    x=5;
    y=5;
    add();
  end
  task simulation();
    x=6; y=6;
    add();
    #10;
    x=7; y=7;
    add();
    #10;
  endtask
  task run();
    x=$urandom();
    y=$urandom();
  endtask
  
  task clock();
    @(posedge clk)
    x=$urandom();
    y=$urandom();
    add();
    clock(); //for every posedge of clk it return to next clock
  endtask
  initial begin
    simulation();
    run();
    clock();
  end
  initial begin
    #150;
    $finish;
  end
endmodule
  
    
  
