library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_mem is
	port( Read_address :  in std_logic_vector(6 downto 0);
		    Instruction  : out std_logic_vector(15 downto 0);
		    clk          :  in std_logic);
end instruction_mem;

architecture behavioral of instruction_mem is
--  Instructions w/ Op Codes
--  Add  |0000|
--  addi |0001|
--  sub  |0010|
--  subi |0011|
--  and  |0100|
--  or   |0101|
--  sll  |0110|
--  srl  |0111|
--  beq  |1000|
--  blt  |1001|
--  bgt  |1010|
--  bne  |1011|
--  j    |1100|
--  lw   |1101|
--  sw   |1110|
--  li   |1111|
  
  type registers is array(0 to 127) of std_logic_vector(15 downto 0);
  signal instruction_list : registers := (
                      x"F004", -- Load Imiddate [1111][0000][0001][0001]
                      x"F014",
										  x"F02D", x"F030",
										  x"2323", x"C07F",
										  x"C07F", x"0021",
										  x"8032", x"8007",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0001", x"0002",
										  x"0003", x"0004",
										  x"7FFF", x"7FFF",
										  x"00FC", x"0021",
										  x"8032", x"8007",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0001", x"0002",
										  x"0003", x"0004",
										  x"7FFF", x"7FFF",
										  x"00FC", x"0021",
										  x"8032", x"8007",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",x"0001", x"0002",
										  x"0003", x"0004",
										  x"7FFF", x"7FFF",
										  x"00FC", x"0021",
										  x"8032", x"8007",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"0000",
										  x"0000", x"C07F");
  
begin

  process(clk)	
  begin
	
    if (rising_edge(clk)) then
	  Instruction <= instruction_list(to_integer(unsigned(Read_address)));
    end if;
  end process;
	
end behavioral;
			
			
	