LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.all;

ENTITY DATA_MEM IS
	PORT (	WRITE_DATA					: IN STD_LOGIC_VECTOR (63 DOWNTO 0);	-- Input data received
			MEM_READ, MEM_WRITE 		: IN STD_LOGIC;
			ADDRESS 					: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			READ_DATA 					: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)	-- Output data sent
		);
END DATA_MEM;

ARCHITECTURE BEHAVIOUR OF DATA_MEM IS

	TYPE MEM_D_ARRAY IS ARRAY(0 TO 2**10-1) OF STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL mem_d	: mem_d_array;
	SIGNAL D_OUT	: STD_LOGIC_VECTOR(63 DOWNTO 0);

	BEGIN

	PROCESS(MEM_WRITE,MEM_READ)
		VARIABLE 	mem_f 		: MEM_D_ARRAY;
		VARIABLE 	tmp_32_bit 	: STD_LOGIC_VECTOR (31 DOWNTO 0);
		VARIABLE 	count		: INTEGER RANGE 0 TO 2**10;
		VARIABLE 	init_mem	: natural range 0 to 1 := 0;

		-- Save data in mem_f from input hex file
		FILE 		text_file 	: text OPEN READ_MODE IS "../sim/MachineCodeData.hex";
		VARIABLE 	text_line 	: line;

		-- Write mem_f content to D_MEM_init_content
		FILE 		fp_out 		: text OPEN WRITE_MODE IS "../sim/D_MEM_init_content.txt";
		VARIABLE	line_out	: line;
	BEGIN
		IF(init_mem = 0) THEN
			WHILE NOT endfile(text_file) LOOP
				readline(text_file, text_line);
				hread(text_line, tmp_32_bit);

				mem_f(count)(31 DOWNTO 0) 	:= tmp_32_bit;
				mem_f(count)(63 DOWNTO 32) 	:= (OTHERS => tmp_32_bit(31));

				hwrite(line_out, mem_f(count));
				writeline(fp_out,line_out);

				count := count + 1;
			END LOOP;
			init_mem := init_mem + 1;
			mem_d<=mem_f;
		END IF;

		IF(MEM_WRITE='1') THEN
			mem_d(TO_INTEGER(UNSIGNED(ADDRESS(11 DOWNTO 2)))) <= WRITE_DATA;
		END IF;
		IF(MEM_READ='1') THEN
			D_OUT <= mem_d(TO_INTEGER(UNSIGNED(ADDRESS(11 DOWNTO 2))));
		ELSE
			D_OUT <= (OTHERS => 'Z');
		END IF;
	END PROCESS;

	READ_DATA <= D_OUT;

END BEHAVIOUR;
