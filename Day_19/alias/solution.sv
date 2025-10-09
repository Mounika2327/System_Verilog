module tb;
  wire a,b,c;
  alias a=b;
  alias c=b;
  assign c=1'b1;
  initial begin
    #1;
    $display("a=%0b,b=%0b,c=%0b",a,b,c);
  end
endmodule
