`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/21 10:33:36
// Design Name: 
// Module Name: Displayor
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


module Displayor(
    input wire _CLK,
    input wire [15:0] Num1,
    input wire [15:0] Num2,
    output reg [7:0] SG,
    output reg [7:0] SS
    );
    
    reg [2:0] Position = 3'b000;
    reg [3:0] BIT [7:0];
    reg [3:0] BIT_cache [7:0]; 
    reg [19:0] CLOCK = 20'h00000;
    wire _CLK2;
    
    assign _CLK2 = CLOCK[10];
    
    always@(posedge _CLK)
    begin
    CLOCK <= CLOCK+1;
    end
    
    integer s;
    always@(posedge _CLK)
    begin
        BIT[0] <= Num2%10;
        BIT[1] <= (Num2%100)/10;
        BIT[2] <= (Num2%1000)/100;
        BIT[3] <= (Num2%10000)/1000;
        BIT[4] <= Num1%10;
        BIT[5] <= (Num1%100)/10;
        BIT[6] <= (Num1%1000)/100;
        BIT[7] <= (Num1%10000)/1000;
        
        if(Position == 7) for (s = 0; s < 8; s = s + 1)   BIT_cache[s] <= BIT[s];
    end
    
    integer i;
    always@(posedge _CLK2)
    begin
    for (i = 0; i < 8; i = i + 1)   SS[i] = ~(Position == i);
        
    if(BIT_cache[Position] == 0)  SG <= 8'b11000000;
    if(BIT_cache[Position] == 1)  SG <= 8'b11111001;
    if(BIT_cache[Position] == 2)  SG <= 8'b10100100;
    if(BIT_cache[Position] == 3)  SG <= 8'b10110000;
    if(BIT_cache[Position] == 4)  SG <= 8'b10011001;
    if(BIT_cache[Position] == 5)  SG <= 8'b10010010;
    if(BIT_cache[Position] == 6)  SG <= 8'b10000010;
    if(BIT_cache[Position] == 7)  SG <= 8'b11111000;
    if(BIT_cache[Position] == 8)  SG <= 8'b10000000;
    if(BIT_cache[Position] == 9)  SG <= 8'b10010000;
    
    Position <= Position+1;
    
    
    end
endmodule
