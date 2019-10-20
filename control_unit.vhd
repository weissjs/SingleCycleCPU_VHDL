library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
	port( 
		  instr_op  :  in std_logic_vector(3 downto 0);
	      RegDst       : out std_logic;
	      Jump         : out std_logic;
	      Branch       :  out std_logic;
	      MemRead      :  out std_logic;
	      MemtoReg     :  out std_logic;
	      ALUOP        :  out std_logic;
	      MemWrite     :  out std_logic;
	      ALUSrc       :  out std_logic_vector (3 downto 0);
	      RegWrite     :  out std_logic);
	      
end control_unit;
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

architecture behavioral of control_unit is
  begin
  
  process(instr_op)
    case instr_op is 
      when x"0" => --  add
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"1" => --  addi
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"2" => --  sub
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"3" => --  subi
	  		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"4" => --  and 
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"5" => --  or
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"6" => --  sll
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"7" => --  srl
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"8" => --  beq
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"9" => --  blt
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"A" => --  blt
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"b" => --  bne
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"C" => --  j 
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"d" => --  lw
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"e" => --  sw 
		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when x"f" => --  li
	  		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
      when others =>
	  		RegDst <= '0';
		Jump   <= '0';
		Branch <= '0';
		MemRead <= '0';
		MemtoReg <= '0';
		ALUop  <= '0';
		MemWrite <= '0';
		ALUSrc  <= "0000";
		RegWrtire <= '0';
    end case;
end behavioral;