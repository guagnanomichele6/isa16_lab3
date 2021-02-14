LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.all;

ENTITY INSTR_MEM_abs IS
	PORT (
		ADDRESS	: IN STD_LOGIC_VECTOR (63 DOWNTO 0); --ADDRESS grande 64 perché PC ha 64 bit
		INSTR	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
END INSTR_MEM_abs;

ARCHITECTURE BEHAVIOUR OF INSTR_MEM_abs IS

	TYPE MEM_I_ARRAY IS ARRAY(0 TO 2**8-1) OF STD_LOGIC_VECTOR (31 DOWNTO 0);

	IMPURE FUNCTION init_mem_i (filename : STRING) RETURN MEM_I_ARRAY IS
		FILE read_file		: TEXT;
		VARIABLE f_line		: LINE;
		VARIABLE m			: MEM_I_ARRAY;
		VARIABLE count		: NATURAL RANGE MEM_I_ARRAY'RANGE;
	BEGIN
		file_open(read_file, filename, READ_MODE);
		WHILE NOT endfile(read_file) LOOP
			readline(read_file, f_line);
			hread(f_line, m(count));
			count := count + 1;
		END LOOP;
		file_close(read_file);
		FOR i IN count TO MEM_I_ARRAY'HIGH LOOP
			m(i) := x"00000013"; -- Fill i_mem with NOPs
		END LOOP;
		RETURN m;
	END init_mem_i;

	SIGNAL mem_i	: MEM_I_ARRAY := init_mem_i(filename => "../tb/MachineCodeText_abs.hex");

BEGIN

	INSTR <= mem_i(TO_INTEGER(UNSIGNED(ADDRESS(9 DOWNTO 2)))); -- Divide by 4 because every instr is 4 byte, 9 DOWNTO 2 because mem_i has 2^8 entries

END BEHAVIOUR;
