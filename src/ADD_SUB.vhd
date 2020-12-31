LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ADD_SUB IS
GENERIC (N:INTEGER);
	PORT (
		A 		: IN SIGNED(N-1 DOWNTO 0);
		B 		: IN SIGNED(N-1 DOWNTO 0);
		CIN		: IN STD_LOGIC;
		S 		: OUT SIGNED(N-1 DOWNTO 0)
	);
END ADD_SUB;

ARCHITECTURE STRUCT OF ADD_SUB IS

SIGNAL COUT_SIGN, BXOC: STD_LOGIC_VECTOR(N DOWNTO 0);

COMPONENT FULL_ADDER IS
	PORT (
		A 		: IN STD_LOGIC;
		B 		: IN STD_LOGIC;
		CIN		: IN STD_LOGIC;
		S 		: OUT STD_LOGIC;
		COUT 	: OUT STD_LOGIC
	);
END COMPONENT;

BEGIN
COUT_SIGN(0)<=CIN;
GEN_FA : FOR I IN 0 TO N-1 GENERATE 
   BXOC(I) <= B(I) XOR CIN;
   FA: FULL_ADDER PORT MAP(A(I),BXOC(I),COUT_SIGN(I),S(I),COUT_SIGN(I+1));
END GENERATE GEN_FA;

END STRUCT;