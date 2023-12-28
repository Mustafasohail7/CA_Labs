module ImmGen(instruction, imm_data);
  input [31:0] instruction;
  output [63:0] imm_data;
  reg [63:0] imm_data;

  wire [1:0] check = instruction[26:25];
  reg [11:0] imm;
  
  
  always @ (instruction)
    begin
      if (check == 2'b00)
        imm = instruction[31:20];
      else if (check == 2'b01)
        imm = {instruction[31:25],instruction[11:7]};
      else if ((check == 2'b10) || (check == 2'b11))
        imm = {instruction[31],instruction[7],instruction[30:25],instruction[11:8]};
      
      imm_data[63:12] = {52{imm[11]}};
      imm_data[11:0] = imm;
    end
  
  
endmodule
      
        
        
  
  
  