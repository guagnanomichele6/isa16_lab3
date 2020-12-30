LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY FF IS
	PORT (
		D 				: IN STD_LOGIC;
		CLK,RST_N,EN 	: IN STD_LOGIC;
		Q				: OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE BEHAVIOR OF FF IS

BEGIN

	PROCESS(clk,rst_n,en)

	BEGIN
		IF (rst_n='0') THEN
			Q <=  '0';
		ELSIF (clk'EVENT AND clk='1' AND en='1') THEN
			Q <= D;
		END IF;

	END PROCESS;

END ARCHITECTURE;