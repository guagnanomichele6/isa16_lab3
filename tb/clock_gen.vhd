library ieee;
use ieee.std_logic_1164.all;

ENTITY clk_gen IS
	PORT (
		CLK,RST	: OUT std_logic
	);
END clk_gen;

ARCHITECTURE beh OF clk_gen IS

	CONSTANT	Ts		: time := 10 ns;
	SIGNAL 		CLK_i	: std_logic;

BEGIN

	PROCESS	--process that generates the clock signal
	BEGIN
		IF (CLK_i = 'U') THEN
			CLK_i <= '0';
		ELSE
			CLK_i <= not(CLK_i);
		END IF;
		WAIT FOR Ts/2;
	END PROCESS;

	CLK <= CLK_i;

 process
  begin  -- process
    RST <= '0';
    wait for 3*Ts/2;
    RST <= '1';
    wait;
  end process;

END beh;