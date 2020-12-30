LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RISCV IS
	PORT(
		CLK,RST: IN STD_LOGIC;
		INSTRUCTION: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		READ_DATA: IN SIGNED(63 DOWNTO 0);
		MEM_WRITE,MEM_READ: OUT STD_LOGIC;
		IM_ADDRESSE: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
		DM_ADDRESSE: OUT SIGNED(63 DOWNTO 0);
		WRITE_DATA: OUT SIGNED(63 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE STRUCT OF RISCV IS

SIGNAL PC_SRC,REG_WRITE,ALU_SRC,MEM_TO_REG,ZERO: STD_LOGIC;
SIGNAL FUNC,ALU_OPERATION: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL OPCODE: STD_LOGIC_VECTOR(6 DOWNTO 0);

COMPONENT DATAPATH IS
	PORT(
		CLK, RST, MUX_PC_SEL, MUX_ALU_SEL, MUX_WB_SEL, REGWRITE: IN STD_LOGIC;
		READ_DATA: IN SIGNED(63 DOWNTO 0);
		INSTR: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALU_OPERATION: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ZERO: OUT STD_LOGIC;
		ALU_RESULT_1: OUT SIGNED(63 DOWNTO 0);
		READ_DATA2_2: OUT SIGNED(63 DOWNTO 0);
		OPCODE: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		FUNC_1: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		PC_O: OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT CU IS
	PORT (
		INSTRUCTION : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		CLK,RST,ZERO : IN STD_LOGIC;
		FUNC_1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ALU_OPERATION: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		REG_WRITE_3, MEM_WRITE_2, MEM_READ_2,MEM_TO_REG_3,PC_SRC_3,ALU_SRC_1: OUT STD_LOGIC
	);
END COMPONENT;


BEGIN

   DP: DATAPATH
      PORT MAP (CLK,RST,PC_SRC,ALU_SRC,MEM_TO_REG,REG_WRITE,READ_DATA,INSTRUCTION,
		ALU_OPERATION,ZERO,DM_ADDRESSE,WRITE_DATA,OPCODE,FUNC,IM_ADDRESSE);   

   C: CU
      PORT MAP (OPCODE,CLK,RST,ZERO,FUNC,ALU_OPERATION,REG_WRITE,MEM_WRITE,MEM_READ,MEM_TO_REG,PC_SRC,ALU_SRC);  

END STRUCT;