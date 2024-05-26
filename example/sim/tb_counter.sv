`include "packageExample.svh"
`timescale 1ns / 1ps

module tb_counter;
    import packageExample::*;

    logic clk;
    logic rst_n;
    logic [3:0] counter;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .c(counter)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        rst_n = 0;
        #10;
        rst_n = 1;

        // Wait for some time to let the counter run
        #100;

        // Call the example function from packageExample
        exampleFunc();

        // Finish the simulation
        #10;
        $finish;
    end

endmodule

