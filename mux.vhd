library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
	port( a    : in std_logic;
		  b   : in std_logic;
		  s  : in std_logic;
		  y  : out std_logic);
end mux;

architecture behavioral of mux is
begin
	
	y <= (a AND (NOT s)) OR (b AND s);
	
end behavioral;
			