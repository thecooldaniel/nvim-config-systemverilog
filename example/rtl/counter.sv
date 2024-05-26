module counter (
    input logic clk,
    input logic rst_n,
    output logic [3:0] c
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            c <= 4'd0;
        else if (c == 4'd9)
            c <= 4'd0;
        else
            c <= c + 4'd1;
            missingDefinition <= c + 1;
    end

endmodule
