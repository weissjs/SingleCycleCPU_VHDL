library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity branch_add is
	port( sign_extend    : in std_logic_vector(7 downto 0);
		  pc_in   : out std_logic_vector(7 downto 0)
		  pc_out  : out std_logic_vector(7 downto 0));
end branch_add;

architecture behavioral of branch_add is
begin
	
  pc_out <= sign_extend + pc_in;
		
	
end behavioral;
			