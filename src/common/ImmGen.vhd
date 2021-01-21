LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ImmGen IS
	GENERIC (N : integer);
	PORT( 	A : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			B : OUT STD_LOGIC_VECTOR(2*N-1 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE BEHAVIOUR OF ImmGen IS

	SIGNAL B_LOAD, B_I_ARITH_LOGIC, B_STORE, B_U, B_J, B_BRANCH: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);

BEGIN

	B_LOAD<=(63 DOWNTO 12 => A(31))&A(31 DOWNTO 20);
	B_I_ARITH_LOGIC<=(63 DOWNTO 12 => A(31))&A(31 DOWNTO 20);
	B_STORE<=(63 DOWNTO 12 => A(31))&A(31 DOWNTO 25)&A(11 DOWNTO 7);
	B_U<=(63 DOWNTO 32 => A(31))&A(31 DOWNTO 12)&(11 DOWNTO 0 => '0');
	B_J<=(63 DOWNTO 20 => A(31))&A(31)&A(19 DOWNTO 12)&A(20)&A(30 DOWNTO 21);
	B_BRANCH<=(63 DOWNTO 12 => A(31))&A(31)&A(7)&A(30 DOWNTO 25)&A(11 DOWNTO 8);

	WITH A(6 DOWNTO 0) SELECT B <=
		B_LOAD 					WHEN "0000011", --LOAD
		B_I_ARITH_LOGIC 		WHEN "0010011", --I-ARITH_LOGIC
		B_STORE 				WHEN "0100011", --STORE
		B_U 					WHEN "0110111", --U
		B_U 					WHEN "0010111", --U
		B_J 					WHEN "1101111", --J
		B_BRANCH				WHEN "1100011", --BRANCH
		(63 DOWNTO 0 => '0') 	WHEN OTHERS;

END ARCHITECTURE;