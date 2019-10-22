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
		  Result : out std_logic_vector(15 downto 0);
		  Zero   : out std_logic;
		  Overflow : out std_logic;
		  Carryout : out std_logic);
end l3_top;

architecture behavioral of l3_top is

	signal read_data_1_sig : std_logic_vector(15 downto 0);
	signal read_data_2_sig : std_logic_vector(15 downto 0);
	signal input_alu_b     : std_logic_vector(15 downto 0);
	signal sign_extended_sig : std_logic_vector(15 downto 0);
	signal instruction_sig   : std_logic_vector(15 downto 0);
	signal program_count_sig : std_logic_vector(15 downto 0);
	signal write_data_sig : std_logic_vector(15 downto 0);
	signal result_alu_sig : std_logic_vector(15 downto 0);
	signal RegDst_sig     : std_logic;
	signal Jump_sig       : std_logic;
	signal Branch_sig     : std_logic;
	signal MemRead_sig    : std_logic;
	signal MemtoReg_sig   : std_logic;
	signal ALUOp_sig      : std_logic_vector(3 downto 0);
	signal MemWrite_sig   : std_logic;
	signal ALUSrc_sig     : std_logic;
	signal RegWrite_sig   : std_logic;
	

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
			
			
	