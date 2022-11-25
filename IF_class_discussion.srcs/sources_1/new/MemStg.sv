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
    logic ReadDataM;
    dmem dmem1(clk, MemWriteM, ALUResultM, WriteDataM, ReadDataM);
    Mem_WB  Mem_WB1(clk, reset,
ALUResultM, ReadDataM, PCPlus4M,
RDM,
RegWriteM,
ResultSrcM,
   
ALUResultW, ReadDataW, PCPlus4W,
RDW,
RegWriteW,
ResultSrcW);

  // initial begin
   //  $display("Time\t ALUResultM\t WriteDataM\t\t PCPlus4M\t RDM\t RegWriteM\t  MemWriteM\t ResultSrcM\t ALUResultW\t ReadDataW\t PCPlus4W\t RDW\t RegWriteW\t ResultSrcW\t");
   //  $monitor("%0d\t\t %0d\t\t %h\t\t   %0d\t\t\t %0d\t\t\t %0d\t\t %0d\t\t  %b\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %d\t\t\t  %0d\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t  %0d\t\t  %0d\t\t %0d\t\t", $time,
   //ALUResultM, WriteDataM, PCPlus4M,RDM,RegWriteM, MemWriteM,ResultSrcM,ALUResultW, ReadDataW, PCPlus4W,RDW,RegWriteW,ResultSrcW);
   //   #260 $finish;
   //end

endmodule