library verilog;
use verilog.vl_types.all;
entity RISCV_pipeline is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        INSTRUCTION     : in     vl_logic_vector(31 downto 0);
        DM_READ_DATA    : in     vl_logic_vector(63 downto 0);
        IM_ADDRESS      : out    vl_logic_vector(63 downto 0);
        MEMWRITE_OUT    : out    vl_logic;
        MEMREAD_OUT     : out    vl_logic;
        DM_ADDRESS      : out    vl_logic_vector(63 downto 0);
        DM_WRITE_DATA   : out    vl_logic_vector(63 downto 0)
    );
end RISCV_pipeline;
