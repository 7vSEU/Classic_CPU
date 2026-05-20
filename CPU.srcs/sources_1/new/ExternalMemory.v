`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:33:09
// Design Name: 
// Module Name: ExternalMemory
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


module ExternalMemory(
    input wire _RESET,
    input wire _CLK,
    input wire [15:0] MEM_in,
    input wire [7:0] MEM_addr,
    output reg [15:0] MEM_out
    );
    reg [15:0] DATA [1:0];
    
    
    always@(posedge _CLK)
    begin
    
    end
endmodule
