LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY REG_DATA IS
	GENERIC (N:INTEGER);
	PORT (
		D 				: IN SIGNED(N-1 DOWNTO 0);
		CLK,RST_N,EN 	: IN STD_LOGIC;
		Q				: OUT SIGNED(N-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE BEHAVIOR OF REG_DATA IS

BEGIN

	PROCESS(clk,rst_n,en)

	BEGIN
		IF (rst_n='0') THEN
			Q <= (OTHERS => '0');
		ELSIF (clk'EVENT AND clk='1' AND en='1') THEN
			Q <= D;
		END IF;

	END PROCESS;

END ARCHITECTURE;