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
    logic Zero, PCSrc;
    logic [2:0] ImmSrcD;
    controller c(InstrD[6:0], InstrD[14:12], InstrD[30], Zero,
               ResultSrcE, MemWriteE, PCSrc,
               AluSrcE, RegWriteE, JumpE,
               ImmSrcD, AluControlE);
               
    extend  extend1(InstrD[31:7],ImmSrcD,IMMEXIE);
    regfile  regfile1(clk, RegWriteE, InstrD[19:15], InstrD[24:20], 
                 InstrD[11:7], ResultW, RD1E, RD2E);
    id_ex   id_ex1();

  
endmodule
