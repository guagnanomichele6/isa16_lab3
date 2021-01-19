LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY SHIFT_REG_1 IS
  GENERIC (N : integer);
 PORT (
		D 				: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		CLK,RST_N,EN 	: IN STD_LOGIC;
		Q				: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE BEHAVIOUR OF SHIFT_REG_1 IS 

BEGIN
 
  PROCESS(clk)
  BEGIN
    IF (rst_n='0') THEN
      Q <= (OTHERS => '0');
    ELSIF (clk'EVENT AND clk='1' AND en='1') THEN
      Q<=D(N-2 DOWNTO 0) & '0';
 
    END IF;

  END PROCESS;

END ARCHITECTURE;