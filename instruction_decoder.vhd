library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Instruction_decoder is
	port( rs,rt,rd, im : out std_logic_vector(3 downto 0);
	      constants     : out std_logic_vector(11 downto 0);
		    Instruction  :  in std_logic_vector(15 downto 0);
		    clk          :  in std_logic);
end Instruction_decoder;

architecture behavioral of Instruction_decoder is
  signal OPCODE : std_logic_vector(3 downto 0);
  begin
    OPCODE <= Instruction(15 downto 12);
    --case OPCODE is 
      --when 
end behavioral;