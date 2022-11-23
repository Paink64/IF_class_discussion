`timescale 1ns / 1ps

module id_ex(
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
   
    always_ff @(posedge clk, posedge reset)
    if (reset) begin
		RD1E <= 0;
		RD2E <=0;
		PCE <=0;
		RDE <= 0;
		IMMEXIE <=0;
		PCPlus4E <=0;
		RegWriteE <= 0;
		ResultSrcE <=0;
		MemWriteE <=0;
		JumpE <= 0;
		BranchE <=0;
		AluControlE <=0;
		AluSrcE <=0;
	end
	else begin
		RD1E <= 0;
		RD2E <=0;
		PCE <=0;
		RDE <= 0;
		IMMEXIE <=0;
		PCPlus4E <=0;
		RegWriteE <= 0;
		ResultSrcE <=0;
		MemWriteE <=0;
		JumpE <= 0;
		BranchE <=0;
		AluControlE <=0;
		AluSrcE <=0;
	end
   
endmodule
