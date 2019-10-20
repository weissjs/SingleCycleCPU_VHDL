library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Instruction_decoder is
	port( 
		    Instruction  :  in std_logic_vector(15 downto 12);
	      RegDst       : out std_logic;
	      Jump         : out std_logic;
	      Branch       :  in std_logic;
	      MemRead      :  in std_logic;
	      MemtoReg     :  in std_logic;
	      ALUOP        :  in std_logic;
	      MemWrite     :  in std_logic;
	      ALUSrc       :  in std_logic;
	      RegWrite     :  in std_logic);
	      
end Instruction_decoder;
--  Add  |0000|
--  addi |0001|
--  sub  |0010|
--  subi |0011|
--  and  |0100|
--  or   |0101|
--  sll  |0110|
--  srl  |0111|
--  beq  |1000|
--  blt  |1001|
--  bgt  |1010|
--  bne  |1011|
--  j    |1100|
--  lw   |1101|
--  sw   |1110|
--  li   |1111|

architecture behavioral of Instruction_decoder is
  signal OPCODE : std_logic_vector(3 downto 0);
  begin
    OPCODE <= Instruction(15 downto 12);
    case OPCODE is 
      when x"0" => --  Add
      when x"1" => --  addi
      when x"2" => --  sub
      when x"3" => --  subi
      when x"4" => --  and 
      when x"5" => --  or
      when x"6" => --  sll
      when x"7" => --  srl
      when x"8" => --  beq
      when x"9" => --  blt
      when x"A" => --  blt
      when x"b" => --  bne
      when x"C" => --  j 
      when x"d" => --  lw
      when x"e" => --  sw 
      when x"f" => --  li
      when others =>
    end case;
end behavioral;