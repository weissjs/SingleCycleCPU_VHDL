library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file is
	port( Rd      :  in std_logic_vector(3 downto 0);
		    Rs      :  in std_logic_vector(3 downto 0);
		    Rt      :  in std_logic_vector(3 downto 0);
		    busW    :  in std_logic_vector(15 downto 0);
		    RegWr   :  in std_logic;
		    clk     :  in std_logic;
		    busA    : out std_logic_vector(15 downto 0);
		    busB    : out std_logic_vector(15 downto 0));
end reg_file;

architecture behavioral of reg_file is
  
  type regList is array(0 to 15) of std_logic_vector(15 downto 0);
  signal reg : regList := (x"0001", x"0002",
										       x"0003", x"0004",
										       x"7FFF", x"7FFF",
										       x"00FC", x"0021",
										       x"8032", x"8007",
										       x"0000", x"0000",
										       x"0000", x"0000",
										       x"0000", x"0000");
  
begin

  process(clk)	
  begin
	
    if (rising_edge(clk)) then
	  busA <= reg(to_integer(unsigned(Rs))); 
	  busB <= reg(to_integer(unsigned(Rt))); 
	elsif (falling_edge(clk)) then
		if(RegWr = '1') then
		  reg(to_integer(unsigned(Rd))) <= busW;
		else 
		  reg <= reg;
		end if;
	else  
	  reg <= reg;
	end if;
  end process;
	
end behavioral;
			
			
	
	


