LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY CONTROL IS
	PORT (
		OPCODE	: IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		BRANCH	: OUT STD_LOGIC;
		MEMREAD	: OUT STD_LOGIC;
		MEMTOREG: OUT STD_LOGIC;
		ALUop	: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		MEMWRITE: OUT STD_LOGIC;
		ALUsrc1	: OUT STD_LOGIC;
		ALUsrc2	: OUT STD_LOGIC;
		REGWRITE: OUT STD_LOGIC
		);
END ENTITY;

ARCHITECTURE BEHAVIOR OF CONTROL IS

	SIGNAL CTRL: STD_LOGIC_VECTOR(8 DOWNTO 0);

BEGIN

	WITH OPCODE SELECT CTRL <=
		"011000011" WHEN "0000011", --LOAD
		"000000011" WHEN "0010011", --IMM
		"000001010" WHEN "0100011", --STORE
		"000100001" WHEN "0110011", --R
		"100010000" WHEN "1100011", --BRANCH
		"000100011" WHEN "0110111", --U UPPER IMMEDIATE LUI
		"000010111" WHEN "0010111", --U UPPER IMMEDIATE AUIPC
		"100110111" WHEN "1101111", --J
		"000000000" WHEN OTHERS; --NOP

	BRANCH		<= CTRL(8);
	MEMREAD		<= CTRL(7);
	MEMTOREG	<= CTRL(6);
	ALUop		<= CTRL(5 DOWNTO 4);
	MEMWRITE	<= CTRL(3);
	ALUsrc1		<= CTRL(2);
	ALUsrc2		<= CTRL(1);
	REGWRITE	<= CTRL(0);

END BEHAVIOR;