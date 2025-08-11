module tb;
  int data1,data2;
  event done;
  task generator();
    for(int i=0;i<8;i++) begin
      data1=$random();
      $display("generated data=%0d",data1);
      #1;
      #9;
    end
    ->done;
  endtask
  
  //driver
    task driver();
    forever begin
    #10;
    data2=data1;
    $display("received data=%0d",data2);
    end
  endtask
  
  //simulation hold
    task simulation();
    wait(done.triggered);
    $finish;
  endtask
  
    initial begin
      fork
        generator();
        driver();
        simulation();
      join
    end
endmodule
