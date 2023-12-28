module ControlUnit(
  input [6:0] opcode,
  output reg [1:0] ALUOp,
  output reg Branch, MemToReg, MemRead, MemWrite, ALUSrc, RegWrite
);
  
  always @ (*)
    begin
      if (opcode[6:4] == 3'b011)
        begin
          ALUSrc = 0;MemToReg=0;
          RegWrite=1;Branch=0;
          MemRead=0;MemWrite=0;
          ALUOp = 2'b10;
        end
      else if(opcode[6:4] == 3'b0)
        begin
          ALUSrc =1;MemToReg=1;
          RegWrite=1;Branch=0;
          MemRead=1;MemWrite=0;
          ALUOp = 2'b00;
        end
      else if(opcode[6:4] == 3'b10)
        begin
          ALUSrc=1;
          RegWrite=0;Branch=0;
          MemRead=0;MemWrite=1;
          ALUOp=2'b00;
        end
      else if(opcode[6:4] == 3'b110)
        begin
          ALUSrc=0;
          RegWrite=0;Branch=1;
          MemRead=0;MemWrite=0;
          ALUOp=2'b01;
        end
    end
endmodule

  