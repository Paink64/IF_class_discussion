
module pipeline ();

  logic        clk;
  logic        reset;
  
  // initialize test
  initial
    begin
      reset <= 1; # 5; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

//~~~~~~~~~~~~~~~~~iFetch Module~~~~~~~~~~~~~~~~~~~~~~

  logic [31:0]    InstrD,PCD,PCPlus4D;
  logic           PCSrcE;
  logic [31:0]    PCTargetE;
  
  //~~~
  logic           RegWriteW,
  logic   [31:0]  ResultW, RdW,
  logic   [31:0]  PCE,PCPlus4E,
  logic   [4:0]   RD1E, RD2E, RDE,
  logic   [24:0]  IMMEXIE,
  logic           RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
  logic   [1:0]   ResultSrcE,
  logic   [2:0]   AluControlE

  //~~~~

  logic   [31:0]  ALUResultM, WriteDataM, PCPlus4M,
  logic   [4:0]   RDM,
  logic           RegWriteM, MemWriteM,
  logic   [1:0]   ResultSrcM

    //~~~

  logic   [31:0]  ALUResultW, ReadDataW, PCPlus4W,
  logic   [1:0]   ResultSrcW
  
  
  ifetch ifetch1(     clk, reset,
                      PCSrcE,
                      PCTargetE,

                      InstrD,
                      PCD,PCPlus4D);
  
  IDecode IDecode1(   clk, reset,
                      PCD,
                      InstrD,
                      PCPlus4D
                      RegWriteW,
                      ResultW, RdW,
                   
                      PCE,PCPlus4E,
                      RD1E, RD2E, RDE,
                      IMMEXIE,
                      RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
                      ResultSrcE,
                      AluControlE);
  
  Execute Execute1(   clk, reset,
                      RD1E, RD2E, RDE,
                      IMMEXIE,
                      PCE,
                      PCPlus4E,
                      RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
                      ResultSrcE,
                      AluControlE,
   
                      PCTargetE,
                      ALUResultM, WriteDataM, PCPlus4M,
                      RDM,
                      RegWriteM, MemWriteM,
                      ResultSrcM);
  
  MemStg MemStg1(     clk, reset,
                      ALUResultM, WriteDataM, PCPlus4M,
                      RDM,
                      RegWriteM, MemWriteM,
                      ResultSrcM,

                      ALUResultW, ReadDataW, PCPlus4W,
                      RDW,
                      RegWriteW,
                      ResultSrcW);
  
  WBStg WBStg1(       clk, reset,
                      ALUResultW, ReadDataW, PCPlus4W,
                      ResultSrcW,

                      ResultW);
  
   initial begin      
    PCSrcE <= 0;    
    PCTargetE <= 0;      
   end                    

endmodule // pipeline
