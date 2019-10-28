library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_8 is
	port( in_1    : in std_logic_vector(7 downto 0);
		  in_2   : in std_logic_vector(7 downto 0);
		  sel  : in std_logic;
		  out_mux  : out std_logic_vector(7 downto 0));
end mux_8;

architecture behavioral of mux_8 is
begin
	
	process(sel, in_1, in_2)
	begin
	  case sel is
		when '0' =>
		  out_mux <= in_1;
		when '1' =>
		  out_mux <= in_2;
		when others =>
		  out_mux <= "ZZZZZZZZ";
	  end case;
	end process;
		
	
end behavioral;
			