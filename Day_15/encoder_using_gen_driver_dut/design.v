// Code your design here

module encoder4to2 (
    input  logic [3:0] a,
    output logic [1:0] y
);
    always_comb begin
        case (a)
            4'b0001: y = 2'b00;
            4'b0010: y = 2'b01;
            4'b0100: y = 2'b10;
            4'b1000: y = 2'b11;
            default: y = 2'b00;
        endcase
    end
endmodule

interface encoder_if;
    logic [3:0] a;
    logic [1:0] y;
endinterface
