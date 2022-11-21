`timescale 1ns / 1ps

module WBStg(
    input  logic         clk, reset,
    input  logic         PCSrcE,
    input  logic  [31:0] PCTargetE,
    
    output logic  [31:0] ALUResultW, ReadDataW,
    output logic  [31:0] PCPlus4D   
    );
endmodule