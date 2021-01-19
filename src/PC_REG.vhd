LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY PC_REG IS
	PORT (
		D 				: IN UNSIGNED(63 DOWNTO 0);
		CLK,RST_N,EN 	: IN STD_LOGIC;
		Q				: OUT UNSIGNED(63 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE BEHAVIOR OF PC_REG IS

BEGIN

	PROCESS(clk,rst_n,en)

	BEGIN
		IF (rst_n='0') THEN
			Q <= "0000000000000000000000000000000000000000010000000000000000000000";
		ELSIF (clk'EVENT AND clk='1' AND en='1') THEN
			Q <= D;
		END IF;

	END PROCESS;

END ARCHITECTURE;