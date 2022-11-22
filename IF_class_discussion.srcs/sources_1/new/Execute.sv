`timescale 1ns / 1ps

module Execute(
   input logic              clk, reset,
   input logic      [4:0]   RD1E, RD2E, RDE,
   input logic      [24:0]  IMMEXIE,
   input logic      [31:0]  PCE,
   input logic      [31:0]  PCPlus4E,
   input logic              RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   input logic      [1:0]   ResultSrcE,
   input logic      [2:0]   AluControlE,
   
   output logic     [31:0]  PCTargetE,
   output logic     [31:0]  ALUResultM, WriteDataM, PCPlus4M,
   output logic     [4:0]   RDM,
   output logic             RegWriteM, MemWriteM,
   output logic     [1:0]   ResultSrcM
    );
    
    mux2 #(32)  pcmux(RD2E, IMMEXIE, AluSrcE, SrcBE);
    adder       PCadder(PCE, IMMEXIE, PCTargetE);
    
    
    
    
    
    Ex_Mem  Ex_Mem1();
endmodule
