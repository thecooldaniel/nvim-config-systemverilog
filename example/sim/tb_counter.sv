`include "packageExample.svh"
`timescale 1ns / 1ps

module tb_counter;
    import packageExample::*;

    logic clk;
    logic rst_n;
    logic [3:0] counter;

    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .c(counter)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        rst_n = 0;
        #10;
        rst_n = 1;

        #100;

        exampleFunc();

        #10;
        $finish;
    end

endmodule

