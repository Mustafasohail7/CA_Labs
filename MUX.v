// Code your design here
module MUX(a,b,S,data_out);
  input [63:0] a, b;
  input S;
  output [63:0] data_out;
  
  assign data_out = S ? b : a;
  
endmodule
  