`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/14 15:29:15
// Design Name: 
// Module Name: CPUsim
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


module CPUsim(

    );
    reg CLK;
    
    Computer_DP myPC(.CLK(CLK));
    
    initial begin
            CLK = 0;
            forever #5 CLK = ~CLK;
        end
endmodule
