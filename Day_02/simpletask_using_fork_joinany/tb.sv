module tb;

  task task1();
    $display("task1 started=%0t",$time);
      #20;
    $display("tas1 completed=%0t",$time);
    
   endtask
  
  //driver
    task task2();
      $display("task2 started=%0t",$time);
    #10;
      $display("task2 complted=%0t",$time);
      
     endtask
  
  //simulation hold
    task task3();
      $display("task3 started=%0t",$time);
     endtask
  
    initial begin
      fork 
         task1();
         task2();
      join_any
      task3();
     
     end
endmodule
