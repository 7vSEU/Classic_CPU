`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:29:29
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire _clk,
    input wire _reset,
    input wire [15:0] BR_in,
    input wire [31:0] ControlSignals,
    output wire [15:0] ALU_out
    );
    
    reg [15:0] ACC = 16'h0000;
    assign ALU_out = ACC;
    
    always@(posedge _clk)
    begin
    if(ControlSignals[9])   ACC <= ACC + BR_in;
    if(ControlSignals[8])   ACC <= 0;
    if(ControlSignals[15])  ACC <= ~BR_in;
    if(ControlSignals[16])  ACC <= ACC >> 1;
    if(ControlSignals[17])  ACC <= ACC << 1;
    if(ControlSignals[18])  ACC <= ACC - BR_in;
    if(ControlSignals[19])  ACC <= ACC * BR_in;
    if(ControlSignals[20])  ACC <= ACC & BR_in;
    if(ControlSignals[21])  ACC <= ACC | BR_in;
    
    end
endmodule
