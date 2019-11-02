library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
	port( pc_in    : in std_logic_vector(6 downto 0);
		  clk      : in std_logic;
		  pc_out   : out std_logic_vector(6 downto 0);
end pc;

architecture behavioral of pc is
begin
	
	process(clk)
	begin
	  if(rising_edge(clk)) then
		pc_out <= pc_in;
	end if;
	end process;
		
	
end behavioral;
			