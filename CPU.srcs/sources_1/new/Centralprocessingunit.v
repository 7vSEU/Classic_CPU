`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:18:18
// Design Name: 
// Module Name: Centralprocessingunit
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


module Centralprocessingunit(
    input wire _RESET,
    input wire _CLK,
    input wire [15:0] MBR_in,
    output wire [15:0] MBR_out,
    output wire [7:0] MAR_out,
    output wire RW,
    output reg Signal
    );
    reg [15:0] _INSTRUCTION;
    reg [7:0] MAR = 8'b00000000;
    reg [15:0] MBR;
    reg [7:0] PC = 8'b00000000;
    reg [7:0] IR;
    reg [15:0] BR;
    
    wire [31:0] ControlSignals;
    reg [15:0] Flags = 16'b0000000000000000;
    wire [15:0] ACC_out;
    
    assign MBR_out = MBR;
    assign MAR_out = MAR;
    
    ControlUnit CU(
    ._clk(_CLK),
    ._reset(_RESET),
    .opcode(IR),
    .Flags_in(Flags),
    .ControlSignals(ControlSignals)
    );
    
    ALU ALU1(
    ._clk(_CLK),
    ._reset(_RESET),
    .BR_in(BR),
    .ControlSignals(ControlSignals),
    .ALU_out(ACC_out)
    );
    
    always@(posedge _CLK)
    begin
    if(ControlSignals[3])   MBR <= MBR_in;
    if(ControlSignals[12])  MBR <= ACC_out;
    if(ControlSignals[14])  PC <= MBR[7:0];
    if(ControlSignals[4])   IR <= MBR[15:8];
    if(ControlSignals[7])   BR <= MBR;
    if(ControlSignals[10])  MAR <= PC;
    if(ControlSignals[5])   MAR <= MBR[7:0];
    if(ControlSignals[6])   PC <= PC+1;
    
    if(ACC_out > 0)  Flags[0] <= 1;    
        else  Flags[0] <= 0; 
    
    Signal <= (MAR == 8'h08);
    end
    
    assign RW = ControlSignals[11];
endmodule
