library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_add is
	port( pc_in    : in std_logic_vector(6 downto 0);
		  pc_out   : out std_logic_vector(6 downto 0);
end pc_add;

architecture behavioral of pc_add is
begin
	
  pc_out <= pc_in + "0000001";
		
	
end behavioral;
			