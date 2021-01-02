LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY MUX_DATA IS
GENERIC (N:INTEGER);
    PORT ( SEL : IN  STD_LOGIC;
           A   : IN  SIGNED (N-1 DOWNTO 0);
           B   : IN  SIGNED (N-1 DOWNTO 0);
           X   : OUT SIGNED (N-1 DOWNTO 0));
END MUX_DATA;

ARCHITECTURE BEHAVIORAL OF MUX_DATA IS
BEGIN
    X <= A WHEN (SEL = '1') ELSE B;
END BEHAVIORAL;