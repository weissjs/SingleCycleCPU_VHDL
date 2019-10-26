library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_4 is
	port( in_1    : in std_logic_vector(3 downto 0);
		  in_2   : in std_logic_vector(3 downto 0);
		  sel  : in std_logic;
		  out_mux  : out std_logic_vector(3 downto 0));
end mux_4;

architecture behavioral of mux_4 is
begin
	
	process(sel, in_1, in_2)
	begin
	  case sel is
		when '0' =>
		  out_mux <= in_1;
		when '1' =>
		  out_mux <= in_2;
		when others =>
		  out_mux <= "ZZZZ";
	  end case;
	end process;
		
	
end behavioral;
			