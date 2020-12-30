LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.all;

ENTITY DATA_MEM IS     
 PORT( DATA_IN : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		 clk, MEM_READ, MEM_WRITE : IN STD_LOGIC;
		 ADDRESSE : IN STD_LOGIC_VECTOR (63 DOWNTO 0); 
		 DATA_OUT : OUT STD_LOGIC_VECTOR (63 DOWNTO 0));
END DATA_MEM;

ARCHITECTURE BEHAVIOUR OF DATA_MEM IS

COMPONENT ADD_SUB IS
        GENERIC(N:INTEGER);
	PORT (
		A 		: IN SIGNED(N-1 DOWNTO 0);
		B 		: IN SIGNED(N-1 DOWNTO 0);
		CIN		: IN STD_LOGIC;
		S 		: OUT SIGNED(N-1 DOWNTO 0)
	);
END COMPONENT;

type MEM_D_ARRAY IS ARRAY(0 TO 2**10-1) OF STD_LOGIC_VECTOR (63 DOWNTO 0);
type MEM_P_ARRAY IS ARRAY(0 TO 2**10-1) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
--SIGNAL MEM : MEM_ARRAY ;
SIGNAL ADDRESSE_SUB: SIGNED (63 DOWNTO 0);
SIGNAL ADDR: STD_LOGIC_VECTOR(9 DOWNTO 0);

impure function init_mem_d return mem_d_array is
  file text_file : text open read_mode is "D:/Doc/squola/ISA/Lab3/git/isa16_lab3/sim/MachineCodeData.hex";
  variable text_line : line;
  variable mem_f : mem_d_array;
  variable PROV : mem_p_array;
		VARIABLE	line_out	: line;
		FILE 		res_fp 		: text OPEN WRITE_MODE IS "D:/Doc/squola/ISA/Lab3/git/isa16_lab3/sim/MachineCodeDataRes.txt";
begin
  for i in 0 to 1023 loop
    readline(text_file, text_line);
    hread(text_line, PROV(i));
    MEM_F(i)(63 DOWNTO 32):= (OTHERS => PROV(i)(31));
    MEM_F(i)(31 DOWNTO 0) := PROV(i);
  end loop;
 
for i in 0 to 1023 loop
 				hwrite(line_out, mem_f(i));
				writeline(res_fp,line_out);
end loop;

  return mem_f;
  file_close(text_file);
end function;

signal mem_d : mem_d_array := init_mem_d;

BEGIN

ADD: ADD_SUB
      GENERIC MAP(64)
      PORT MAP (SIGNED(ADDRESSE),"0000000000000000000000000000000000010000000000010000000000000000",'1',ADDRESSE_SUB);


ADDR<=STD_LOGIC_VECTOR(ADDRESSE(9 DOWNTO 0));
PROCESS(MEM_WRITE,MEM_READ)
BEGIN
    IF(MEM_WRITE='1') THEN
        MEM_D(TO_INTEGER(UNSIGNED(ADDR))) <= DATA_IN;
    END IF;
  IF(MEM_READ='1') THEN
	DATA_OUT <=	MEM_D(TO_INTEGER(UNSIGNED(ADDR)));
    END IF;
END PROCESS;
 
END BEHAVIOUR;