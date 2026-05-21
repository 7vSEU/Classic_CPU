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
    output wire [15:0] MEM_out,
    output reg [15:0] SS
    );
    
    
    reg [15:0] DATA [255:0];
    reg [15:0] DATA2 [255:0];
    reg [15:0] Dete [1:0] = {
    16'd4030, 
    16'd2010};
    
    wire [15:0] Numw1;
    wire [15:0] Numw2;
    assign Numw1 = 16'd5050;
    assign Numw2 = Dete[0];
    
    always@(posedge _CLK)
    begin
    //Dete[0] <= DATA[0];
    Dete[1] <= DATA[1];
    end
    
    initial begin
        $readmemh("MEM_data.mem", DATA);
        $readmemh("MEM_test.mem", DATA2);
    end
    
    assign MEM_out = DATA[MEM_addr];
    
    always@(posedge _CLK)
    begin
    if(RW)  DATA[MEM_addr] <= MEM_in;
    end
        
    Displayor my_disp(
    ._CLK(_CLK),
    .Num1(Numw1),
    .Num2(Numw2),
    //.Num1(16'd5050),
    //.Num2(16'd5050),
    .SG(SS[15:8]),
    .SS(SS[7:0])
    );
endmodule
