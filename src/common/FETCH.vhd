LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY FETCH IS
	PORT (
		CLK,RST_N		: IN	STD_LOGIC;
		BRANCH_SUM		: IN	SIGNED(63 DOWNTO 0);
		PCsrc			: IN	STD_LOGIC;
		PC_OUT			: OUT	STD_LOGIC_VECTOR(63 DOWNTO 0);
		INSTRUCTION		: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
		INSTRUCTION_OUT	: OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END FETCH;

ARCHITECTURE STRUCT OF FETCH IS

	COMPONENT PC_REG IS
		PORT (
			D			: IN	UNSIGNED(63 DOWNTO 0);
			CLK,RST_N,EN: IN	STD_LOGIC;
			Q			: OUT	UNSIGNED(63 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT ADDER IS
		GENERIC (N:INTEGER);
		PORT (
			A,B	: IN	SIGNED(N-1 DOWNTO 0);
			S	: OUT	SIGNED(N-1 DOWNTO 0)
			);
	END COMPONENT;

	SIGNAL NEW_PC,PC: UNSIGNED(63 DOWNTO 0);
	SIGNAL PC_PLUS4	: SIGNED(63 DOWNTO 0);

BEGIN

	WITH PCsrc SELECT NEW_PC<=
		UNSIGNED(BRANCH_SUM)	WHEN '1',
		UNSIGNED(PC_PLUS4)		WHEN OTHERS;

	PREG_PC: PC_REG
		PORT MAP (NEW_PC,CLK,RST_N,'1',PC);

	PC_ADD: ADDER
		GENERIC MAP(64)
		PORT MAP(SIGNED(PC),(to_signed(4, 64)),PC_PLUS4);

	PC_OUT			<= STD_LOGIC_VECTOR(PC);
	INSTRUCTION_OUT <= INSTRUCTION;

END STRUCT;