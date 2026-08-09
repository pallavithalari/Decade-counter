`timescale 1ns/1ps

module decade_counter (
    input  wire       clk,
    input  wire       reset,
    output reg [3:0]  count
);

    // MOD-10 / Decade Counter
    // Counts: 0 -> 1 -> 2 -> ... -> 9 -> 0

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (count == 4'b1001)
            count <= 4'b0000;
        else
            count <= count + 1'b1;
    end

endmodule