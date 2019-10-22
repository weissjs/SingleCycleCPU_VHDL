library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memory is
	port(   address :  in std_logic_vector(15 downto 0);
		    Write_data  : in std_logic_vector(15 downto 0);
			Read_data : out std_logic_vector(15 downto 0);
			MemWrite : in std_logic;
			MemRead  : in std_logic;
		    clk          :  in std_logic);
end data_memory;

architecture behavioral of data_memory is

  
  type registers is array(0 to 255) of std_logic_vector(15 downto 0);
  signal memory : registers := (
                      x"F011", -- Load Imiddate [1111][0000][0001][0001]
                      x"0002",
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
										  x"0000", x"0000", 
										  x"F011", x"0002",
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
										  x"0000", x"0000");
  
begin

  process(clk)	
  begin
	
    if (rising_edge(clk)) then
		if (MemWrite = '1') then
			memory(to_integer(unsigned(address))) <= Write_data;
		else 
			memory <= memory;
		end if;
    end if;
  end process;
	
	Read_data <= memory(to_integer(unsigned(address))) when MemRead = '1';
end behavioral;
			
			
	