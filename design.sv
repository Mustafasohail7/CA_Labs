// Code your design here
`include "ImmGen.v"
`include "InstructionParser.v"
`include "MUX.v"
`include "ALU_64_bit.v"
`include "registerFile.v"
`include "Data_Memory.v"
`include "Instruction_Memory.v"
`include "Program_Counter.v"
`include "adder.v"
`include "ALUControl.v"
`include "ControlUnit.v"

module Top_Single_Processor(
  input clk,
  input reset
);
  wire [63:0]mux1out;
  wire [63:0]pcout1;
  wire andgate;
  wire branch;
  wire zero;
  assign andgate= branch & zero; //and gate for mux 1
  
  Program_Counter pc(.clk(clk),.reset(reset),.PC_In(mux1out),.PC_Out(pcout1)); //program counter
  
  wire [63:0]mux1a;	
  wire [63:0]mux1b; 
  MUX m1(.S(andgate),.a(mux1a),.b(mux1b),.data_out(mux1out)); //MUX 1
  
  wire [31:0]instructionout;
  Instruction_Memory IM(.Inst_Address(pcout1),.Instruction(instructionout)); //Ins_MEMORY
  
  wire [4:0]rs1;
  wire [4:0]rs2;
  wire [4:0]rd;
  wire [6:0]opcodetoCU;
  wire [6:0]func7;
  wire [2:0]func3;
  InstructionParser a0(.instruction(instructionout),.opcode(opcodetoCU),.rd(rd),.funct3(func3),.rs1(rs1),.rs2(rs2),.funct7(func7)); //ins_praser
  
  wire [63:0]ReadDataout1;
  wire [63:0]ReadDataout2;
  wire RegWrite;
  wire [63:0]mux3out;

  registerFile rf0(.WriteData(mux3out),.rs1(rs1),.rs2(rs2),.rd(rd),.RegWrite(RegWrite),.clk(clk),.reset(reset),.ReadData1(ReadDataout1),.ReadData2(ReadDataout2)); //register file
  
  wire [63:0] immcalc;
  wire [63:0]immWire;
  assign immcalc = immWire<<1;//for shift	
  wire [63:0]mux2out;
  wire ALUSrc;
  MUX m2(.S(ALUSrc),.a(ReadDataout2),.b(immWire),.data_out(mux2out)); //MUX 2
  
  ImmGen IDG(.instruction(instructionout),.imm_data(immWire)); //Immediate data gen
  
  //wire [63:0] a;
  //wire [63:0] b;
  adder add1(.A(pcout1),.B(64'd4),.C(mux1a)); //Adder 1
  
  adder add2(.A(pcout1),.B(immcalc),.C(mux1b)); //adder 2
  
  //wire zero;
  wire [3:0]AlU_Operation;
  wire [63:0]aluout;
  ALU_64_bit alu(.a(ReadDataout1),.b(mux2out),.ALUOp(AlU_Operation),.result(aluout),.Zero(zero)); //ALU
  
  wire [3:0]functin;
  assign functin = {instructionout[30],instructionout[14:12]};
  wire [1:0]ALUOPtoCU;
  ALUControl alucu(.ALUOp(ALUOPtoCU),.funct(functin),.operation(AlU_Operation)); //ALU_Control
  
  wire MemRead;
  wire MemWrite;
  wire MemtoReg;
  
  ControlUnit cu(.opcode(opcodetoCU),.ALUOp(ALUOPtoCU),.Branch(branch),.MemRead(MemRead),.MemToReg(MemtoReg),	.MemWrite(MemWrite),.ALUSrc(ALUSrc),.RegWrite(RegWrite)); //Control_Unit
  
  wire [63:0] Read_Data;
  Data_Memory dm(.Mem_Addr(aluout),.Write_Data(ReadDataout2),.Read_Data(Read_Data),.clk(clk),.MemWrite(MemWrite),.MemRead(MemRead)); //Data Memory
  


  MUX m3(.S(MemtoReg),.a(aluout),.b(Read_Data),.data_out(mux3out)); //MUX 3
  
endmodule