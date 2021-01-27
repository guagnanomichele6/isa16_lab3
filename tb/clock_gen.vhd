library ieee;
use ieee.std_logic_1164.all;

ENTITY clk_gen IS
	PORT (
		CLK,RST	: OUT std_logic;
		INSTR	: IN STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END clk_gen;

ARCHITECTURE beh OF clk_gen IS

	CONSTANT	Ts		: time := 10 ns;
	SIGNAL 		CLK_i	: std_logic;

BEGIN

	PROCESS	--process that generates the clock signal
	BEGIN
		IF (INSTR = "00000000000000000000000011101111") THEN 	--END_SIM occurred
			WAIT;
		ELSE
			IF (CLK_i = 'U') THEN
				CLK_i <= '0';
			ELSE
				CLK_i <= not(CLK_i);
			END IF;
			WAIT FOR Ts/2;
		END IF;
	END PROCESS;

	CLK <= CLK_i;

	PROCESS
 	BEGIN  -- process
    	RST <= '0';
    	WAIT FOR 3*Ts/2;
    	RST <= '1';
    	WAIT;
	END PROCESS;


END beh;