library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity branch_add is
	port( sign_extend    : in std_logic_vector(6 downto 0);
		  pc_in   : in std_logic_vector(6 downto 0);
		  pc_out  : out std_logic_vector(6 downto 0));
end branch_add;

architecture behavioral of branch_add is begin

    pc_out <=  std_logic_vector( unsigned(sign_extend) + unsigned(pc_in));
		
	
end behavioral;
			