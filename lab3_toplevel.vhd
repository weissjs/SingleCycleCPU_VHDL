library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity l3_top is
	port( 
		  RegWr : in std_logic;
		  Rd    : in std_logic_vector(4 downto 0);
		  Rs    : in std_logic_vector(4 downto 0);
		  Rt    : in std_logic_vector(4 downto 0);
		  ALUctr : in std_logic_vector(2 downto 0);
		  Clk   :  in std_logic;
		  Result : out std_logic_vector(31 downto 0);
		  Zero   : out std_logic;
		  Overflow : out std_logic;
		  Carryout : out std_logic);
end l3_top;

architecture behavioral of l3_top is

	signal busA_sig : std_logic_vector(31 downto 0);
	signal busB_sig : std_logic_vector(31 downto 0);
	signal result_sig : std_logic_vector(31 downto 0);

begin

	Result <= result_sig;
		DUT : entity work.reg_file(behavioral)
      port map( Rd => Rd,
				Rs => Rs,
				Rt => Rt,
				busW => result_sig,
				RegWr => RegWr,
				clk => Clk,
				busA => busA_sig,
				busB => busB_sig);
				
		DUT0 : entity work.alu(behavioral)
      port map( busA => busA_sig,
				busB => busB_sig,
				mode => ALUctr,
				Overflow => Overflow,
				Cout => Carryout,
				Result => result_sig,
				Zero => Zero);
	
	
	

	
	
end behavioral;
			
			
	