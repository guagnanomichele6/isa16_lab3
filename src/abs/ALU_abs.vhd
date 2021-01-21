LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ALU_abs IS
	PORT(
		A: IN SIGNED(63 DOWNTO 0);
		B: IN SIGNED(63 DOWNTO 0);
		ALU_OPERATION: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ZERO: OUT STD_LOGIC;
		ALU_RESULT: OUT SIGNED(63 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE BEHAVIOR OF ALU_abs IS

	SIGNAL ALU_RESULT_PROV,ALU_RESULT_PROV_1,ALU_RESULT_PROV_2,ALU_RESULT_PROV_3,ALU_RESULT_PROV_4,ALU_RESULT_PROV_5,ALU_RESULT_PROV_6,ALU_RESULT_PROV_7: SIGNED(63 DOWNTO 0);
	SIGNAL MASK, TMP_ABS 	: SIGNED(63 DOWNTO 0);
	SIGNAL SHIFT 			: UNSIGNED(4 DOWNTO 0);
	SIGNAL ZERO1,ZERO2 		: STD_LOGIC;

	COMPONENT ADDER IS	GENERIC (N:INTEGER);
		PORT( 	A,B 	: IN  SIGNED(N-1 DOWNTO 0);
				S 		: OUT SIGNED(N-1 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT SUBTRACTOR IS	GENERIC (N:INTEGER);
		PORT( 	A,B 		: IN SIGNED(N-1 DOWNTO 0);
				S 			: OUT SIGNED(N-1 DOWNTO 0)
			);
	END COMPONENT;

BEGIN

	SUB: 	SUBTRACTOR	GENERIC MAP(64)	PORT MAP (A,B,ALU_RESULT_PROV);

	ADD:	ADDER	GENERIC MAP(64)	PORT MAP (A,B,ALU_RESULT_PROV_1);

	ALU_RESULT_PROV_2<=A AND B;

	ALU_RESULT_PROV_3<=A XOR B;

	SHIFT<=UNSIGNED(B(4 DOWNTO 0));
	ALU_RESULT_PROV_4<=SHIFT_RIGHT(A,TO_INTEGER(SHIFT));

	ALU_RESULT_PROV_5<=(63 DOWNTO 1 => '0')&ALU_RESULT_PROV(63);

	JAL: ADDER	GENERIC MAP(64)
		PORT MAP (A,(to_signed(4, 64)),ALU_RESULT_PROV_6);

	MASK 		<= (OTHERS => A(63));
	TMP_ABS 	<= A XOR MASK;
	SUB_ABS: 	SUBTRACTOR GENERIC MAP(64)	PORT MAP (TMP_ABS,MASK,ALU_RESULT_PROV_7);

	WITH ALU_OPERATION SELECT ALU_RESULT <=
		ALU_RESULT_PROV_1 WHEN "0010", --ADD
		ALU_RESULT_PROV_2 WHEN "0000", --AND
		ALU_RESULT_PROV_3 WHEN "0001", --XOR
		ALU_RESULT_PROV_4 WHEN "0011", --SRAI
	   	ALU_RESULT_PROV_5 WHEN "0100", --SLT
		ALU_RESULT_PROV_6 WHEN "1010", --J
		ALU_RESULT_PROV_7 WHEN "1111", --ABS
		ALU_RESULT_PROV_1 WHEN OTHERS;

	WITH ALU_RESULT_PROV SELECT ZERO1 <=
		'1' WHEN "0000000000000000000000000000000000000000000000000000000000000000",
		'0' WHEN OTHERS;

	WITH ALU_OPERATION SELECT ZERO2 <=
		'1' WHEN "1010",
		'0' WHEN OTHERS;

	ZERO<=ZERO1 OR ZERO2;

END ARCHITECTURE;