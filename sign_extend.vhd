library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend is
	port( len_6 : in std_logic_vector(5 downto 0);
		  len_16 : out std_logic_vector(15 downto 0));
end sign_extend;

architecture behavioral of sign_extend is
begin
	
    len_16 <= std_logic_vector(resize(signed(len_6), len_16'length));
	
end behavioral;
			