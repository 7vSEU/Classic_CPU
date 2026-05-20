`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/16 14:30:25
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input wire _clk,
    input wire _reset,
    input wire [7:0] opcode,
    input wire [15:0] Flags_in,
    output wire [31:0] ControlSignals
    );
    reg [7:0] CAR = 8'b00000000;
    reg [31:0] CM [255:0];   //32->5;64->6;128->7;256->8
    //reg [31:0] CBR;
    
    assign ControlSignals = CM[CAR];
    
    initial begin
        CM[8'h00] = 32'b00001001;           //CAR 0
        CM[8'h01] = 32'b00010001;
        CM[8'h02] = 32'b00000010;
        CM[8'h03] = 32'b01100001;           //LOAD X entrance
        CM[8'h04] = 32'b00001001;
        CM[8'h05] = 32'b0000000110000001;
        CM[8'h06] = 32'b0000001000000001;
        CM[8'h07] = 32'b0000010000000100;   //LOAD X exit
        CM[8'h08] = 32'b01100001;           //STORE X entrance
        CM[8'h09] = 32'b0001000000000001;
        CM[8'h0A] = 32'b0000100000000001;
        CM[8'h0B] = 32'b0000010000000100;   //STORE X exit
        CM[8'h0C] = 32'b01100001;           //ADD X entrance
        CM[8'h0D] = 32'b00001001;
        CM[8'h0E] = 32'b10000001;
        CM[8'h0F] = 32'b0000001000000001;           
        CM[8'h10] = 32'b0000010000000100;   //ADD X exit
        CM[8'h11] = 32'b01100001;           //SUB X entrance
        CM[8'h12] = 32'b00001001;
        CM[8'h13] = 32'b10000001;
        CM[8'h14] = 32'b000001000000000000000001;           
        CM[8'h15] = 32'b0000010000000100;   //SUB X exit
        CM[8'h16] = 32'b010000000000000000000000;           // JMPGEZ X
        CM[8'h17] = 32'b0100000000000000;   //JMP X / BRANCH TRUE entrance
        CM[8'h18] = 32'b0000010000000100;   //JMP X / BRANCH TRUE exit
        CM[8'h19] = 32'b0000000001000000;   //BRANCH FALSE entrance
        CM[8'h1A] = 32'b0000010000000100;   //BRANCH FALSE exit
        CM[8'h1B] = 32'b01100001;           //MPY X entrance
        CM[8'h1C] = 32'b00001001;
        CM[8'h1D] = 32'b10000001;
        CM[8'h1E] = 32'b000010000000000000000001;           
        CM[8'h1F] = 32'b0000010000000100;   //MPY X exit
        CM[8'h20] = 32'b01100001;           //AND X entrance
        CM[8'h21] = 32'b00001001;
        CM[8'h22] = 32'b10000001;
        CM[8'h23] = 32'b000100000000000000000001;           
        CM[8'h24] = 32'b0000010000000100;   //AND X exit
        CM[8'h25] = 32'b01100001;           //OR X entrance
        CM[8'h26] = 32'b00001001;
        CM[8'h27] = 32'b10000001;
        CM[8'h28] = 32'b001000000000000000000001;           
        CM[8'h29] = 32'b0000010000000100;   //OR X exit
        CM[8'h2A] = 32'b01100001;           //NOT X entrance
        CM[8'h2B] = 32'b00001001;
        CM[8'h2C] = 32'b10000001;
        CM[8'h2D] = 32'b1000000000000001;           
        CM[8'h2E] = 32'b0000010000000100;   //NOT X exit
        CM[8'h2F] = 32'b000000010000000001000001;           //SHIFTR entrance
        CM[8'h30] = 32'b0000010000000100;   //SHIFTR exit    
        CM[8'h31] = 32'b000000100000000001000001;           //SHIFTL entrance
        CM[8'h32] = 32'b0000010000000100;   //SHIFTL exit
        CM[8'h33] = 32'b01100001;
        CM[8'h34] = 32'b0000010000000100;
    end
    
    always@(posedge _clk)
    begin
    if(ControlSignals[0])   CAR <= CAR+1;
    if(ControlSignals[1]) 
        begin
        if(opcode == 8'b00000000)   CAR <= 8'h33;//proceed
        if(opcode == 8'b00000001)   CAR <= 8'h08;//STORE X  GOOD
        if(opcode == 8'b00000010)   CAR <= 8'h03;//LOAD X   GOOD
        if(opcode == 8'b00000011)   CAR <= 8'h0C;//ADD X    GOOD
        if(opcode == 8'b00000100)   CAR <= 8'h11;//SUB X    GOOD
        if(opcode == 8'b00000101)   CAR <= 8'h16;//JMPGEZ X
        if(opcode == 8'b00000110)   CAR <= 8'h17;//JMP X
        if(opcode == 8'b00000111)   CAR <= CAR;//HALT
        if(opcode == 8'b00001000)   CAR <= 8'h1B;//MPY X
        if(opcode == 8'b00001010)   CAR <= 8'h20;//AND X
        if(opcode == 8'b00001011)   CAR <= 8'h25;//OR X
        if(opcode == 8'b00001100)   CAR <= 8'h2A;//NOT X
        if(opcode == 8'b00001101)   CAR <= 8'h2F;//SHIFTR
        if(opcode == 8'b00001110)   CAR <= 8'h31;//SHIFTL
        end
    if(ControlSignals[2])   CAR <= 0;
    if(ControlSignals[22])  CAR <= Flags_in ? 8'h17 : 8'h19;
    
    
    end
endmodule
