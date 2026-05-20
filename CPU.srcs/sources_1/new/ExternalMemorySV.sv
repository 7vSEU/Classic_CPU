`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/14 14:18:06
// Design Name: 
// Module Name: ExternalMemorySV
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


module ExternalMemorySV(
    input wire _RESET,
    input wire _CLK,
    input wire [15:0] MEM_in,
    input wire [7:0] MEM_addr,
    input wire  RW,
    output wire [15:0] MEM_out
    );
    
    reg [15:0] DATA [255:0];
    initial begin
        $readmemh("MEM_data.mem", DATA);
    end
    
    assign MEM_out = DATA[MEM_addr];
    
    always@(posedge _CLK)
    begin
    if(RW)  DATA[MEM_addr] <= MEM_in;
    end
endmodule
