
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

  logic [31:0] tb_InstrD,tb_PCD,tb_PCPlus4D;
  logic tb_PCSrcE;
  logic [31:0]tb_PCTargetE;

  ifetch ifetch1(clk, reset,tb_PCSrcE,tb_PCTargetE,tb_InstrD,tb_PCD,tb_PCPlus4D); 
  IDecode IDecode1(clk, reset,tb_PCD,tb_InstrD,tb_PCPlus4D);
  Execute Execute1(clk, reset,);
  MemStg MemStg1(clk, reset,);
  WBStg WBStg1(clk, reset,);
  
   initial begin      
    tb_PCSrcE <= 0;    
    tb_PCTargetE <= 0;      
   end                    

endmodule // pipeline
