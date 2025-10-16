// Code your testbench here
// or browse Examples
class sample;
  rand bit[2:0]n, a[];
  constraint c1 { a.size() == 7;
    foreach(a[i])
     
      a[i] == a[a.size()-1-i];
                }
endclass
module tb;
  sample s = new();
  int i;
  initial begin
    repeat(10) begin
    assert(s.randomize());
    foreach(s.a[i])
      $display("a[%0d] = %0d", i, s.a[i]);
      $display("\n");
   end
  end
endmodule

