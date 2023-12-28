// Code your design here
module ALU_64_bit(
  input [63:0] a,
  input [63:0] b,
  input [3:0] ALUOp,
  output [63:0] result,
  output Zero
);
  
  wire mux1out, mux2out,M3;
  
  assign mux1out = ALUOp[3] ? (~a) : a;
  assign mux2out = ALUOp[2] ? (~b) : b;
  assign result = ALUOp[0] ? (mux1out | mux2out) : ( ALUOp[1] ? mux1out+mux2out : mux1out&mux2out );
  assign Zero = result ? 1'b0 : 1'b1;
  
endmodule