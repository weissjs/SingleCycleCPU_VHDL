library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend is
	port( len_8 : in std_logic_vector(7 downto 0);
		  len_16 : out std_logic_vector(15 downto 0));
end sign_extend;

architecture behavioral of sign_extend is
begin
	
    len_16 <= std_logic_vector(resize(signed(len_8), len_16'length));
	
end behavioral;
			