//ID stage 
module IDecode (
   input logic              clk, reset,
   input logic      [31:0]  PCD,
   input logic      [31:0]  InstrD,
   input logic      [31:0]  PCPlus4D,
   input logic              RegWriteW,
   input logic      [31:0]  ResultW, RdW,
   output logic     [31:0]  PCE,PCPlus4E,
   output logic     [4:0]   RD1E, RD2E, RDE,
   output logic     [24:0]  IMMEXIE,
   output logic             RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   output logic     [1:0]   ResultSrcE,
   output logic     [2:0]   AluControlE
   );

   id_ex  id_ex1();

  
endmodule
