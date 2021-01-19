LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ADDER IS	GENERIC (N:INTEGER);
						PORT (
								A,B 		: IN  SIGNED(N-1 DOWNTO 0);
								S 			: OUT SIGNED(N-1 DOWNTO 0)
								);
END ADDER;

ARCHITECTURE BEHAVIOR OF ADDER IS
BEGIN

S<=A+B;

END BEHAVIOR;