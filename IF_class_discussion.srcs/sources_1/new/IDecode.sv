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
   output logic     [2:0]   AluControlE,
   output logic [1:0] ImmSrcD
   );
    //logic [1:0] ImmSrcD;
    
    logic     [4:0]   RD1D, RD2D, RDD;
    logic     [24:0]  IMMEXID;
    logic             RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD;
    logic     [1:0]   ResultSrcD;
    logic     [2:0]   AluControlD;
    
    
    controller c(InstrD[6:0], InstrD[14:12], InstrD[30],
               ResultSrcD, MemWriteD,
               AluSrcD, RegWriteD, JumpD, BranchD,
               ImmSrcD, AluControlD);
               
    extend  extend1(InstrD[31:7],ImmSrcD,IMMEXID);
    regfile  regfile1(clk, RegWriteW, InstrD[19:15], InstrD[24:20], 
                 RdW, ResultW, RD1E, RD2E);
                 
    id_ex   id_ex1( clk, reset,
                    PCD,PCPlus4D,
                    RD1D, RD2D, RDD,
                    IMMEXID,
                    RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD,
                    ResultSrcD,
                    AluControlD,
                       
                    PCE,PCPlus4E,
                    RD1E, RD2E, RDE,
                    IMMEXIE,
                    RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
                    ResultSrcE,
                    AluControlE);

  
endmodule
