LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.all;

ENTITY INSTR_MEM IS
 PORT( ADDRESSE : IN STD_LOGIC_VECTOR (63 DOWNTO 0); --CI METTO DENTRO ASSEMBLY?
       INSTR : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));-- addresse grande 64 perché pc ha 64 bit
END INSTR_MEM;

ARCHITECTURE BEHAVIOUR OF INSTR_MEM IS

type MEM_ARRAY IS ARRAY(0 TO 2**8-1) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
--SIGNAL MEM : MEM_ARRAY ;
SIGNAL ADDR: STD_LOGIC_VECTOR (7 DOWNTO 0);

COMPONENT ADD_SUB IS
        GENERIC(N:INTEGER);
	PORT (
		A 		: IN SIGNED(N-1 DOWNTO 0);
		B 		: IN SIGNED(N-1 DOWNTO 0);
		CIN		: IN STD_LOGIC;
		S 		: OUT SIGNED(N-1 DOWNTO 0)
	);
END COMPONENT;

impure function init_mem return mem_array is
  file text_file : text open read_mode is "../sim/MachineCodeText_pipeline.hex";
  variable text_line : line;
  variable mem_f : mem_array;

		VARIABLE	line_out	: line;
		FILE 		res_fp 		: text OPEN WRITE_MODE IS "../sim/MachineCodeTextRes.txt";



begin
  for i in 0 to 54 loop
    readline(text_file, text_line);
    hread(text_line, mem_f(i));
  end loop;
for i in 55 to 2**8-1 loop
    mem_f(i):="00000000000000000000000000010011";--others are NOP
  end loop;
for i in 0 to 2**8-1 loop
 				hwrite(line_out, mem_f(i));
				writeline(res_fp,line_out);
end loop;
  return mem_f;
 file_close(text_file);
end function;

signal mem : mem_array := init_mem;

BEGIN

	ADDR<=STD_LOGIC_VECTOR(ADDRESSE(9 DOWNTO 2)); --I DVIDE BY 4 BECAUSE EVERY INSTR IS 4 BYTE
	INSTR <= MEM(TO_INTEGER(UNSIGNED(ADDR)));

END BEHAVIOUR;