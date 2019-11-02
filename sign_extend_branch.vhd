library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend is
	port( len_4 : in std_logic_vector(3 downto 0);
		  len_7 : out std_logic_vector(6 downto 0));
end sign_extend;

architecture behavioral of sign_extend is
begin
	
    len_7 <= std_logic_vector(resize(signed(len_4), len_7'length));
	
end behavioral;
			