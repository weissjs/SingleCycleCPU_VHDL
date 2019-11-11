library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pc_tb is
end pc_tb;

architecture behavioral of pc_tb is


	type address_array is array(0 to 4) of std_logic_vector(6 downto 0);
	signal address : address_array := ("0001000", "1000000", "1000101", "0000000", "1111111");

	signal pc_out_sig : std_logic_vector(6 downto 0);
	signal pc_in_sig : std_logic_vector(6 downto 0);
	signal clk : std_logic := '1';
	constant Tperiod : time := 2 ns;

begin

	process(clk)
      begin
        clk <= not clk after Tperiod/2;
    end process;
	
	process	
	  begin	
		for i in 0 to 4 loop
		  pc_in_sig <= address(i);
		  wait for 5 ns;
		end loop;
		wait;
	end process;
	
	DUT : entity work.pc(behavioral)
      port map( clk => clk,
				pc_in => pc_in_sig,
				pc_out => pc_out_sig);
end behavioral;
				