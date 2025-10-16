
class sample;
  int i;
  rand bit[16:0] a[];
  constraint c1 { a.size==16;//element count
                 foreach(a[i])
                   a[i] == i*i;
                }
endclass
module tb;
  sample s=new();
  int i;
  initial begin
    assert(s.randomize());
    foreach(s.a[i])
    $display("a[%0d]=%0d ",i,s.a[i]);   
  end
endmodule

