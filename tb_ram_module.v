`timescale 1ns / 1ps
module tb_ram_module;
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;
    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    ram_module #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) uut (
        .clk(clk), .we(we), .addr(addr), .din(din), .dout(dout)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Start RAM Simulation");
        we = 0; addr = 0; din = 0;
        #10; we = 1; addr = 4'h3; din = 8'hAA;
        #10; addr = 4'h5; din = 8'h55;
        #10; we = 0; addr = 4'h3;
        #10; addr = 4'h5;
        #10; $stop;
    end
endmodule
