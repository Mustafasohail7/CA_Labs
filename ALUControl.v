module ALUControl(
  input [1:0] ALUOp,
  input [3:0] funct,
  output reg [3:0] operation
);
  
  always @ (*)
    begin
      if (ALUOp == 2'b00)
        operation=4'b10;
      else if(ALUOp == 2'b01)
        operation=4'b110;
      else if(ALUOp == 2'b10)
        begin
          if (funct == 4'b0)
            operation=4'b10;
          else if (funct == 4'b1000)
            operation=4'b110;
          else if (funct == 4'b111)
            operation=4'b0;
          else if (funct == 4'b110)
            operation=4'b1;
        end
    end
endmodule