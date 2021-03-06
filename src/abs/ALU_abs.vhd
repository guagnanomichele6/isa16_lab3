LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ALU_abs IS
	PORT(
		A				: IN	SIGNED(63 DOWNTO 0);
		B				: IN	SIGNED(63 DOWNTO 0);
		ALU_OPERATION	: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		ZERO			: OUT	STD_LOGIC;
		ALU_RESULT		: OUT	SIGNED(63 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE BEHAVIOR OF ALU_abs IS

	SIGNAL ALU_RESULT_PROV,ALU_RESULT_PROV_1,ALU_RESULT_PROV_2,ALU_RESULT_PROV_3	: SIGNED(63 DOWNTO 0);
	SIGNAL ALU_RESULT_PROV_4,ALU_RESULT_PROV_5,ALU_RESULT_PROV_6,ALU_RESULT_PROV_7	: SIGNED(63 DOWNTO 0);
	SIGNAL SHIFT																	: UNSIGNED(4 DOWNTO 0);
	SIGNAL ZERO1,ZERO2																: STD_LOGIC;
	SIGNAL MASK,TMP_ABS																: SIGNED(63 DOWNTO 0);

	COMPONENT ADDER IS
		GENERIC (N:INTEGER);
		PORT (
			A,B 	: IN  SIGNED(N-1 DOWNTO 0);
			S 		: OUT SIGNED(N-1 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT SUBTRACTOR IS
		GENERIC (N:INTEGER);
		PORT (
			A,B 		: IN SIGNED(N-1 DOWNTO 0);
			S 			: OUT SIGNED(N-1 DOWNTO 0)
			);
	END COMPONENT;

BEGIN

	SUB: SUBTRACTOR
		GENERIC MAP(64)
		PORT MAP (A,B,ALU_RESULT_PROV);

	ADD: ADDER
		GENERIC MAP(64)
		PORT MAP (A,B,ALU_RESULT_PROV_1);

	ALU_RESULT_PROV_2	<= A AND B;
	ALU_RESULT_PROV_3	<= A XOR B;
	SHIFT				<= UNSIGNED(B(4 DOWNTO 0));
	ALU_RESULT_PROV_4	<= SHIFT_RIGHT(A,TO_INTEGER(SHIFT));
	ALU_RESULT_PROV_5	<= (63 DOWNTO 1 => '0') & ALU_RESULT_PROV(63);

	JAL: ADDER
		GENERIC MAP(64)
		PORT MAP (A,(to_signed(4, 64)),ALU_RESULT_PROV_6);

	MASK	<= (OTHERS => A(63));
	TMP_ABS	<= A XOR MASK;

	SUB_ABS: SUBTRACTOR
		GENERIC MAP(64)
		PORT MAP (TMP_ABS,MASK,ALU_RESULT_PROV_7);

	WITH ALU_OPERATION SELECT ALU_RESULT <=
		ALU_RESULT_PROV_1 WHEN "0010", --ADD
		ALU_RESULT_PROV_2 WHEN "0000", --AND
		ALU_RESULT_PROV_3 WHEN "0001", --XOR
		ALU_RESULT_PROV_4 WHEN "0011", --SRAI
		ALU_RESULT_PROV_5 WHEN "0100", --SLT
		ALU_RESULT_PROV_6 WHEN "1010", --J
		ALU_RESULT_PROV_7 WHEN "1111", --ABS
		ALU_RESULT_PROV_1 WHEN OTHERS;

	ZERO1 <=	ALU_RESULT_PROV(63) OR ALU_RESULT_PROV(62) OR ALU_RESULT_PROV(61) OR ALU_RESULT_PROV(60) OR
				ALU_RESULT_PROV(59) OR ALU_RESULT_PROV(58) OR ALU_RESULT_PROV(57) OR ALU_RESULT_PROV(56) OR
				ALU_RESULT_PROV(55) OR ALU_RESULT_PROV(54) OR ALU_RESULT_PROV(53) OR ALU_RESULT_PROV(52) OR
				ALU_RESULT_PROV(51) OR ALU_RESULT_PROV(50) OR ALU_RESULT_PROV(49) OR ALU_RESULT_PROV(48) OR
				ALU_RESULT_PROV(47) OR ALU_RESULT_PROV(46) OR ALU_RESULT_PROV(45) OR ALU_RESULT_PROV(44) OR
				ALU_RESULT_PROV(43) OR ALU_RESULT_PROV(42) OR ALU_RESULT_PROV(41) OR ALU_RESULT_PROV(40) OR
				ALU_RESULT_PROV(39) OR ALU_RESULT_PROV(38) OR ALU_RESULT_PROV(37) OR ALU_RESULT_PROV(36) OR
				ALU_RESULT_PROV(35) OR ALU_RESULT_PROV(34) OR ALU_RESULT_PROV(33) OR ALU_RESULT_PROV(32) OR
				ALU_RESULT_PROV(31) OR ALU_RESULT_PROV(30) OR ALU_RESULT_PROV(29) OR ALU_RESULT_PROV(28) OR
				ALU_RESULT_PROV(27) OR ALU_RESULT_PROV(26) OR ALU_RESULT_PROV(25) OR ALU_RESULT_PROV(24) OR
				ALU_RESULT_PROV(23) OR ALU_RESULT_PROV(22) OR ALU_RESULT_PROV(21) OR ALU_RESULT_PROV(20) OR
				ALU_RESULT_PROV(19) OR ALU_RESULT_PROV(18) OR ALU_RESULT_PROV(17) OR ALU_RESULT_PROV(16) OR
				ALU_RESULT_PROV(15) OR ALU_RESULT_PROV(14) OR ALU_RESULT_PROV(13) OR ALU_RESULT_PROV(12) OR
				ALU_RESULT_PROV(11) OR ALU_RESULT_PROV(10) OR ALU_RESULT_PROV(9) OR ALU_RESULT_PROV(8) OR
				ALU_RESULT_PROV(7) OR ALU_RESULT_PROV(6) OR ALU_RESULT_PROV(5) OR ALU_RESULT_PROV(4) OR
				ALU_RESULT_PROV(3) OR ALU_RESULT_PROV(2) OR ALU_RESULT_PROV(1) OR ALU_RESULT_PROV(0);

	ZERO2 <= (ALU_OPERATION(3) AND (NOT ALU_OPERATION(2))) AND (ALU_OPERATION(1) AND (NOT ALU_OPERATION(0)));

	ZERO <= (NOT ZERO1) OR ZERO2;

END BEHAVIOR;