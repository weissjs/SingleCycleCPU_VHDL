library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_add is
	port( A    : in std_logic;
		  B    : in std_logic;
		  Cin  : in std_logic;
		  sum  : out std_logic;
		  Cout : out std_logic);
end full_add;

architecture behavioral of full_add is

begin

	sum <= (A XOR B) XOR Cin;
	Cout <= ((A XOR B) AND Cin) OR (A AND B);

	
end behavioral;
			
			
	
	


