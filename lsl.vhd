library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lsl is
	port( A    : in std_logic_vector(31 downto 0);
		  B   : in std_logic_vector(31 downto 0);
		  --Cin  : in std_logic;
		  Result  : out std_logic_vector(31 downto 0);
		  Cout : out std_logic);
end lsl;

architecture behavioral of lsl is

	signal b_sig : integer := 0;
	signal result_sig : std_logic_vector(31 downto 0);
	
	
begin
	
	--A_shift(0) <= '0';
	Cout <= A(31);
	
	b_sig <= to_integer(unsigned(B))
	
	
	process(A)
	begin
	result_sig <= 
	for j in 0 to b_sig loop 
		for i in 1 to 31 loop
			A_shift(i) <= A(i - 1);
		end loop;
	end process;
	
	
	
end behavioral;
			
			
	