module Data_Memory(
  input [63:0] Mem_Addr, Write_Data,
  input clk, MemWrite, MemRead,
  output reg [63:0] Read_Data
);
  
  reg [7:0] Dmem [63:0];
  
  initial
    begin
      Dmem[0] = 8'h83;
      Dmem[1] = 8'h34;
      Dmem[2] = 8'h05;
      Dmem[3] = 8'h0F;
      Dmem[4] = 8'hB3;
      Dmem[5] = 8'h84;
      Dmem[6] = 8'h9A;
      Dmem[7] = 8'h00;
      Dmem[8] = 8'h93;
      Dmem[9] = 8'h84;
      Dmem[10] = 8'h14;
      Dmem[11] = 8'h00;
      Dmem[12] = 8'h23;
      Dmem[13] = 8'h38;
      Dmem[14] = 8'h95;
      Dmem[15] = 8'h0E;
      Dmem[16] = 8'h83;
      Dmem[17] = 8'h34;
      Dmem[18] = 8'h05;
      Dmem[19] = 8'h0F;
      Dmem[20] = 8'hB3;
      Dmem[21] = 8'h84;
      Dmem[22] = 8'h9A;
      Dmem[23] = 8'h00;
      Dmem[24] = 8'h93;
      Dmem[25] = 8'h84;
      Dmem[26] = 8'h14;
      Dmem[27] = 8'h00;
      Dmem[28] = 8'h23;
      Dmem[29] = 8'h38;
      Dmem[30] = 8'h95;
      Dmem[31] = 8'h0E;
      Dmem[32] = 8'h83;
      Dmem[33] = 8'h34;
      Dmem[34] = 8'h05;
      Dmem[35] = 8'h0F;
      Dmem[36] = 8'hB3;
      Dmem[37] = 8'h84;
      Dmem[38] = 8'h9A;
      Dmem[39] = 8'h00;
      Dmem[40] = 8'h93;
      Dmem[41] = 8'h84;
      Dmem[42] = 8'h14;
      Dmem[43] = 8'h00;
      Dmem[44] = 8'h23;
      Dmem[45] = 8'h38;
      Dmem[46] = 8'h95;
      Dmem[47] = 8'h0E;
      Dmem[48] = 8'h83;
      Dmem[49] = 8'h34;
      Dmem[50] = 8'h05;
      Dmem[51] = 8'h0F;
      Dmem[52] = 8'hB3;
      Dmem[53] = 8'h84;
      Dmem[54] = 8'h9A;
      Dmem[55] = 8'h00;
      Dmem[56] = 8'h93;
      Dmem[57] = 8'h84;
      Dmem[58] = 8'h14;
      Dmem[59] = 8'h00;
      Dmem[60] = 8'h23;
      Dmem[61] = 8'h38;
      Dmem[62] = 8'h95;
      Dmem[63] = 8'h0E;
    end
  
  always @ (posedge clk) begin
    if (MemWrite==1'b1) begin
      Dmem[Mem_Addr] <= Write_Data[7:0];
      Dmem[Mem_Addr+1] <= Write_Data[15:8];
      Dmem[Mem_Addr+2] <= Write_Data[23:16];
      Dmem[Mem_Addr+3] <= Write_Data[31:24];
      Dmem[Mem_Addr+4] <= Write_Data[39:32];
      Dmem[Mem_Addr+5] <= Write_Data[47:40];
      Dmem[Mem_Addr+6] <= Write_Data[55:48];
      Dmem[Mem_Addr+7] <= Write_Data[63:56];
    end
  end
  
  always @ (*) begin
    if (MemRead==1'b1) begin
      Read_Data = {Dmem[Mem_Addr+7],Dmem[Mem_Addr+6],Dmem[Mem_Addr+5],Dmem[Mem_Addr+4],Dmem[Mem_Addr+3],Dmem[Mem_Addr+2],Dmem[Mem_Addr+1],Dmem[Mem_Addr]};
    end
    else begin
      Read_Data=64'b0;
    end
  end
  
endmodule
  
  
  