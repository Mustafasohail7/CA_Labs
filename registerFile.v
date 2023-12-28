module registerFile(
  input [63:0] WriteData,
  input [4:0] rs1,rs2,rd,
  input RegWrite, clk, reset,
  output reg [63:0] ReadData1, ReadData2
);
  
  reg [63:0] Registers [31:0];
  
  initial
    begin
      Registers[0] = 64'd0;
        Registers[1] = 64'd7138883470783448159;
        Registers[2] = 64'd9763145207577667706;
        Registers[3] = 64'd6293896135913060535;
        Registers[4] = 64'd6260099461516053998;
        Registers[5] = 64'd7136785504097059262;
        Registers[6] = 64'd14065999086358341513;
        Registers[7] = 64'd14908608823181779981;
        Registers[8] = 64'd7365214781091340317;
        Registers[9] = 64'd13975010813602376110;
        Registers[10] = 64'd11621949213182458886;
        Registers[11] = 64'd2071134933028613594;
        Registers[12] = 64'd3456377842939970587;
        Registers[13] = 64'd7390959050995462543;
        Registers[14] = 64'd14162411392962599656;
        Registers[15] = 64'd3512186986093756555;
        Registers[16] = 64'd17691795190376499309;
        Registers[17] = 64'd1783844361158560572;
        Registers[18] = 64'd13507537634546657600;
        Registers[19] = 64'd15996971091558857544;
        Registers[20] = 64'd15255136650059504645;
        Registers[21] = 64'd10526949590037935917;
        Registers[22] = 64'd17872225498303048539;
        Registers[23] = 64'd2874982605975916557;
        Registers[24] = 64'd7411108208514119842;
        Registers[25] = 64'd14853344336046842246;
        Registers[26] = 64'd2418671995977951797;
        Registers[27] = 64'd11391242381695777877;
        Registers[28] = 64'd8053939828690769675;
        Registers[29] = 64'd18233285171655171520;
        Registers[30] = 64'd1619613847997206267;
        Registers[31] = 64'd15097209827503586206;
    end
  
  always @ (posedge clk) begin
    if (RegWrite == 1'b1) begin
      if (rd!=5'b0) begin
      		Registers[rd] = WriteData;
      end
    end
  end
  
  always @ (*) begin
      if (reset) begin
        ReadData1 = 64'b0;
        ReadData2 = 64'b0;
      end
    else begin
      ReadData1 = Registers[rs1];
      ReadData2 = Registers[rs2];
    end
  end
  
endmodule
        
      
  
  
      
  
      
  