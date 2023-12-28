module Instruction_Memory(
  input [63:0] Inst_Address,
  output reg [31:0] Instruction
);
  
  reg [7:0] Imem [15:0];
  
  initial
    begin
      Imem[0] = 8'h83;
      Imem[1] = 8'h34;
      Imem[2] = 8'h85;
      Imem[3] = 8'h02;
      Imem[4] = 8'hB3;
      Imem[5] = 8'h84;
      Imem[6] = 8'h9A;
      Imem[7] = 8'h00;
      Imem[8] = 8'h93;
      Imem[9] = 8'h84;
      Imem[10] = 8'h14;
      Imem[11] = 8'h00;
      Imem[12] = 8'h23;
      Imem[13] = 8'h34;
      Imem[14] = 8'h95;
      Imem[15] = 8'h02;
    end
  
  always @ (Inst_Address) begin
    Instruction = {Imem[Inst_Address+3],Imem[Inst_Address+2],Imem[Inst_Address+1],Imem[Inst_Address]};
    
  end
  
endmodule
    