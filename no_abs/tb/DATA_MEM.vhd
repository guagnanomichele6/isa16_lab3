LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.all;

ENTITY DATA_MEM IS
	PORT (
		WRITE_DATA			: IN STD_LOGIC_VECTOR (63 DOWNTO 0);	-- Input data received
		MEM_READ, MEM_WRITE	: IN STD_LOGIC;
		ADDRESS				: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		READ_DATA			: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)	-- Output data sent
		);
END DATA_MEM;

ARCHITECTURE BEHAVIOUR OF DATA_MEM IS

	TYPE MEM_D_ARRAY IS ARRAY(0 TO 2**10-1) OF STD_LOGIC_VECTOR (63 DOWNTO 0);

	IMPURE FUNCTION init_mem_d (filename : STRING) RETURN MEM_D_ARRAY IS
		FILE read_file		: TEXT;
		VARIABLE f_line		: LINE;
		VARIABLE m			: MEM_D_ARRAY;
		VARIABLE tmp_32_bit	: STD_LOGIC_VECTOR (31 DOWNTO 0);
		VARIABLE count		: NATURAL RANGE MEM_D_ARRAY'RANGE;
	BEGIN
		file_open(read_file, filename, READ_MODE);
		WHILE NOT endfile(read_file) LOOP
			readline(read_file, f_line);
			hread(f_line, tmp_32_bit);
			m(count)(31 DOWNTO 0)	:= tmp_32_bit;
			m(count)(63 DOWNTO 32)	:= (OTHERS => tmp_32_bit(31));
			count := count + 1;
		END LOOP;
		file_close(read_file);
		FOR i IN count TO MEM_D_ARRAY'HIGH LOOP
			m(i) := (OTHERS => '0');
		END LOOP;
		RETURN m;
	END init_mem_d;

	SIGNAL mem_d	: MEM_D_ARRAY := init_mem_d(filename => "../tb/MachineCodeData.hex");

BEGIN

	PROCESS(ADDRESS)
	BEGIN
		IF(MEM_WRITE='1') THEN
			mem_d(TO_INTEGER(UNSIGNED(ADDRESS(11 DOWNTO 2)))) <= WRITE_DATA;
		END IF;
		IF(MEM_READ='1') THEN
			READ_DATA <= mem_d(TO_INTEGER(UNSIGNED(ADDRESS(11 DOWNTO 2))));
		ELSE
			READ_DATA <= (OTHERS => 'Z');
		END IF;
	END PROCESS;

END BEHAVIOUR;
