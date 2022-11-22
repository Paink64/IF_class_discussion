`timescale 1ns / 1ps

module MemStg(
   input logic              clk, reset,
   input logic      [31:0]  ALUResultM, WriteDataM, PCPlus4M,
   input logic      [4:0]   RDM,
   input logic              RegWriteM, MemWriteM,
   input logic      [1:0]   ResultSrcM,
   
   output logic     [31:0]  ALUResultW, ReadDataW, PCPlus4W,
   output logic     [4:0]   RDW,
   output logic             RegWriteW,
   output logic     [1:0]   ResultSrcW
    );
    Mem_WB  Mem_WB1();
endmodule