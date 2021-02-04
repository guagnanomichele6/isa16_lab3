LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.all;

ENTITY INSTR_MEM IS
	PORT (	ADDRESS : IN STD_LOGIC_VECTOR (63 DOWNTO 0); --ADDRESS grande 64 perché PC ha 64 bit
    		INSTR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    	);
END INSTR_MEM;

ARCHITECTURE BEHAVIOUR OF INSTR_MEM IS

	TYPE MEM_I_ARRAY IS ARRAY(0 TO 2**8-1) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL SIM: STD_LOGIC;
	SIGNAL mem_i : MEM_I_ARRAY;
BEGIN
	SIM <= '1';

	PROCESS(SIM)
		VARIABLE	mem_f 		: MEM_I_ARRAY;
		VARIABLE	count		: INTEGER RANGE 0 to 2**8-1;
		-- Save instructions in mem_f from input hex file
		FILE 		text_file 	: text OPEN READ_MODE IS "../sim/MachineCodeText.hex";
		VARIABLE	text_line 	: line;

		-- Write mem_f content to I_MEM_init_content
		FILE 		fp_out		: text OPEN WRITE_MODE IS "../sim/I_MEM_init_content.txt";
		VARIABLE	line_out	: line;

	BEGIN
		IF(SIM='1') THEN
		WHILE NOT endfile(text_file) LOOP
		    readline(text_file, text_line);
		    hread(text_line, mem_f(count));
		    count := count + 1;
		END LOOP;
		file_close(text_file);

		-- Fill mem_f with NOPs
		FOR i IN count TO 2**8-1 LOOP
		    mem_f(i) := "00000000000000000000000000010011";
		END LOOP;

		FOR i IN 0 TO 2**8-1 LOOP
			hwrite(line_out, mem_f(i));
			writeline(fp_out, line_out);
		END LOOP;
		file_close(fp_out);
		END IF;
		mem_i<=mem_f;
	  END PROCESS;


		INSTR 	<= 	mem_i(TO_INTEGER(UNSIGNED(ADDRESS(9 DOWNTO 2)))); -- Divide by 4 because every instr is 4 byte, 9 DOWNTO 2 because mem_i has 2^8 entries

END BEHAVIOUR;