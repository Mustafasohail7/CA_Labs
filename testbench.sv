// Code your testbench here
// or browse Examples
module tb();
  reg clk;
  reg reset;
  
  Top_Single_Processor a1(clk, reset);
  
  initial
    clk =1'b0;
  
  always
    #5 clk = ~clk;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      
      reset = 1;
      #7
      reset = 0;
      #10
      reset = 0;
      #10
      reset = 0;
      #10;

      #300 $finish;
     
    end
endmodule