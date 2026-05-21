`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 15:36:35
// Design Name: 
// Module Name: Computer_DP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Computer_DP(
    input wire CLK,
    input wire RESET,
    output wire LED,
    output wire [15:0] Inspection
    );
    //assign LED = 0;
    
    wire [15:0] MEM_in;
    wire [7:0] MEM_addr;
    wire [15:0] MEM_out;
    wire RW;
    
    wire LED2;//not imp
    Centralprocessingunit my_CPU(
    ._CLK(CLK),
    ._RESET(RESET),
    .MBR_in(MEM_out),
    .MBR_out(MEM_in),
    .MAR_out(MEM_addr),
    .RW(RW),
    .Signal(LED2)
    );
    assign LED = 1;
    
    ExternalMemorySV my_MEM(
    ._CLK(CLK),
    ._RESET(RESET),
    .MEM_out(MEM_out),
    .MEM_in(MEM_in),
    .RW(RW),
    .MEM_addr(MEM_addr),
    .SS(Inspection)
    );
    
endmodule
