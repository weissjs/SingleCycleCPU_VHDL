library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_add is
	port( pc_in    : in std_logic_vector(6 downto 0);
		  pc_out   : out std_logic_vector(6 downto 0));
end pc_add;

architecture behavioral of pc_add is
  constant oneone : std_logic_vector(6 downto 0) := "0000001";
begin
	

  process(pc_in)
  begin
    if(pc_in = "1111111") then
      pc_out <= "1111111";
    else 
      pc_out <= std_logic_vector(unsigned(pc_in) + unsigned(oneone));
    end if;
  end process;
		
	
end behavioral;
			