library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_add is
	port( pc_in    : in std_logic_vector(7 downto 0);
		  pc_out   : out std_logic_vector(7 downto 0);
end pc;

architecture behavioral of pc is
begin
	
  pc_out <= pc_in + "00000001";
		
	
end behavioral;
			