module tb;
  task swap (input bit [3:0] a,b);// a,b are arguments different
    bit [3:0] temp;
    temp=a;
    a=b;
    b=temp;
    $display("a=%0d | b=%0d",a,b); // a=7 ,b=9
  endtask
  bit [3:0] a;
  bit [3:0] b;
  initial begin
    a=9;
    b=7;
    swap(a,b);
    #10;
    $display("a=%0d | b=%0d",a,b); // a=9 ,b=7
  end
endmodule
    
