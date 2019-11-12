library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity full_tb is
end full_tb;

architecture behavioral of full_tb is

  signal PC_reset : std_logic;
begin

	 PC_reset <= '1', '0' after 10 ns;
	 
	DUT : entity work.l4_top(behavioral)
      port map( PC_reset => PC_reset);
end behavioral;
				
	