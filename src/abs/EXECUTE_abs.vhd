LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY EXECUTE_abs IS
	PORT (
		PC_2,IMM_OUT_1				: IN	SIGNED(63 DOWNTO 0);
		RD_1						: IN	STD_LOGIC_VECTOR(4 DOWNTO 0);
		READ_DATA1_1,READ_DATA2_1	: IN	SIGNED(63 DOWNTO 0);
		ALUctrl						: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		ALUsrc1_1					: IN	STD_LOGIC;
		ALUsrc2_1					: IN	STD_LOGIC;
		ZERO						: OUT	STD_LOGIC;
		RD_1_OUT					: OUT	STD_LOGIC_VECTOR(4 DOWNTO 0);
		BRANCH_SUM					: OUT	SIGNED (63 DOWNTO 0);
		ALU_RESULT					: OUT	SIGNED(63 DOWNTO 0);
		RF_READ_DATA2_1_OUT			: OUT	SIGNED(63 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE BEHAVIOR OF EXECUTE_abs IS

	COMPONENT ADDER IS
		GENERIC (N:INTEGER);
		PORT (
			A,B	: IN  SIGNED(N-1 DOWNTO 0);
			S	: OUT SIGNED(N-1 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT ALU_abs IS
		PORT (
			A				: IN	SIGNED(63 DOWNTO 0);
			B				: IN	SIGNED(63 DOWNTO 0);
			ALU_OPERATION	: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ZERO			: OUT	STD_LOGIC;
			ALU_RESULT		: OUT	SIGNED(63 DOWNTO 0)
			);
	END COMPONENT;

	SIGNAL ALU_IN1,ALU_IN2,IMM_OUT_1_SHIFTED : SIGNED(63 DOWNTO 0);

BEGIN

	IMM_OUT_1_SHIFTED <= IMM_OUT_1(62 DOWNTO 0) & '0';	--left shift 1 pos

	EX_ADD: ADDER
		GENERIC MAP(64)
		PORT MAP(PC_2,IMM_OUT_1_SHIFTED,BRANCH_SUM);

	WITH ALUsrc1_1 SELECT ALU_IN1 <=
		PC_2 			 	WHEN '1',
		READ_DATA1_1 	WHEN OTHERS;
	WITH ALUsrc2_1 SELECT ALU_IN2 <=
		READ_DATA2_1	WHEN '0',
		IMM_OUT_1		WHEN OTHERS;

	ALU_DP: ALU_abs
		PORT MAP (ALU_IN1, ALU_IN2, ALUctrl, ZERO, ALU_RESULT);

	RF_READ_DATA2_1_OUT	<= READ_DATA2_1;
	RD_1_OUT			<= RD_1;

END BEHAVIOR;