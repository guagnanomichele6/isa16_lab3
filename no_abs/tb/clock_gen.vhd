LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY clk_gen IS
	PORT (
		INSTR		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		CLK,RST_N	: OUT STD_LOGIC
	);
END clk_gen;

ARCHITECTURE beh OF clk_gen IS

	CONSTANT	half_period	: TIME		:= 4.28 ns;
	SIGNAL		CLK_i		: STD_LOGIC	:= '0';
	SIGNAL		end_sim		: STD_LOGIC	:= '0';

BEGIN

	PROCESS	--CLK PROCESS
	BEGIN
		IF (end_sim = '1') THEN
			CLK_i <= '0';
			WAIT;
		END IF;
		CLK_i <= NOT CLK_i;
		WAIT FOR half_period;
	END PROCESS;

	PROCESS(CLK_i)	--end_sim PROCESS
		VARIABLE last_instr_count	: INTEGER RANGE 0 TO 3 := 0;
		VARIABLE stop_sim			: STD_LOGIC := '0';
	BEGIN
		IF (CLK_i'EVENT AND CLK_i = '1') THEN
			IF (last_instr_count /= 3) THEN	--END_SIM occurred
				IF (INSTR = x"000000EF") THEN 	--need to stop sim after 3 clk cycles
					stop_sim := '1';
				END IF;
				IF (stop_sim = '1') THEN
					last_instr_count := last_instr_count + 1;
				END IF;
				end_sim <= '0';
			ELSE
				end_sim <= '1';
			END IF;
		END IF;
	END PROCESS;

	CLK <= CLK_i;

	PROCESS
	BEGIN	--RST_N process
		RST_N <= '0';
		WAIT FOR 5*half_period;
		RST_N <= '1';
		WAIT;
	END PROCESS;

END beh;
