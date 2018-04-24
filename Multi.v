`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2017 12:28:51
// Design Name: 
// Module Name: Multi
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


module Multi(
    input [2:0] inA,
    input [2:0] inB,
    input clk,    
    output [5:0] outY
    );
    
    
    reg [2:0] a,b;
    reg [5:0] Y;
    wire[5:0] c;
    reg [6:0] reg_c;
    
    always@(posedge clk)
    begin   
    Y<=outY;
    a<=inA;
    b<=inB;
    reg_c<=c;
    end
    
    assign outY[0] = (a[0] & b[0]);
    halfadd H1 (a[1] & b[0],a[0] & b[1],outY[1],c[0]);
    full_adder F1 (a[2] & b[0],a[1] & b[1],reg_c[0],c[1],c[2]);
    full_adder F2 (reg_c[2],a[0] & b[2],reg_c[1],c[3],outY[2]);
    full_adder F3 (a[2] & b[1],a[1] & b[2],reg_c[3],c[4],outY[3]);
    halfadd H2 (a[2] & b[2],c[4],outY[4],c[5]);
    assign outY[5] = c[5];
    
    
endmodule
