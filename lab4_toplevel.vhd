library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity l4_top is
	port( 
		  RegWr : in std_logic;
		  Rd    : in std_logic_vector(4 downto 0);
		  Rs    : in std_logic_vector(4 downto 0);
		  Rt    : in std_logic_vector(4 downto 0);
		  ALUctr : in std_logic_vector(2 downto 0);
		  Clk   :  in std_logic;
		  Zero   : out std_logic;
		  Overflow : out std_logic;
		  Carryout : out std_logic);
end l4_top;

architecture behavioral of l4_top is

	signal read_data_1_sig : std_logic_vector(15 downto 0);
	signal read_data_2_sig : std_logic_vector(15 downto 0);
	signal input_alu_b     : std_logic_vector(15 downto 0);
	signal sign_extended_sig : std_logic_vector(15 downto 0);
	signal instruction_sig   : std_logic_vector(15 downto 0);
	signal program_count_sig : std_logic_vector(15 downto 0);
	signal write_data_sig : std_logic_vector(15 downto 0);
	signal write_addr_sig : std_logic_vector(3 downto 0);
	signal read_data_mem_sig : std_logic;
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
	signal PC_sig         : std_logic(6 downto 0);
	

begin


		Instruciton memory : entity work.instruction_mem(behavioral)
      port map( Read_address => PC_sig,
				Instruction => instruction_sig,
				clk => Clk;
	
		mux1 : entity work.mux_4(behavioral)
	  port map( in_1 => instruction_sig(7 downto 4),
				in_2 => instruction_sig(3 downto 0),
				sel => RegDst_sig,
				out_mux => write_addr_sig);
				
				
		sign extend : entity work.sign_extend(behavioral)
	  port map( len_4 => instruction_sig(3 downto 0),
				len_16 => sign_extended_sig(15 downto 0));

		reg : entity work.reg_file(behavioral)
      port map( Rd => write_addr_sig,
				Rs => instruction_sig(11 downto 8),
				Rt => instruction_sig(7 downto 4),
				busW => write_data_sig,
				RegWr => RegWrite_sig,
				clk => Clk,
				busA => read_data_1_sig,
				busB => read_data_2_sig);
				
		mux2 : entity work.mux_16(behavioral)
	  port map( in_1 => read_data_2_sig,
				in_2 => sign_extended_sig,
				sel => ALUSrc_sig,
				out_mux => input_alu_b);
				
				
		alu : entity work.alu(behavioral)
      port map( busA => read_data_1_sig,
				busB => input_alu_b,
				mode => ALUctr,     --learn whats happening here. leave for now
				Overflow => Overflow,
				Cout => Carryout,
				Result => result_sig,
				Zero => Zero);
	
	
		data memory : entity work.data_memory(behavioral)
      port map( address => result_sig(7 downto 0),
				Write_data => read_data_2_sig,
				Read_data => read_data_mem_sig,
				MemWrite => MemWrite_sig,
				MemRead => MemRead_sig,
				clk => Clk);
				
		mux3 : entity work.mux_16(behavioral)
	  port map( in_1 => read_data_mem_sig,
				in_2 => result_sig,
				sel => MemtoReg_sig,
				out_mux => write_data_sig);
				
		control : entity work.control_unit(behavioral)
	  port map( instr_op => instruction(15 downto 12), 
				RegDst => RegDst_sig,
				Jump => Jump_sig,
				Branch => Branch_sig,
				MemRead => MemRead_sig,
				MemtoReg => MemtoReg_sig,
				ALUSrc => ALUSrc_sig,
				MemWrite => MemWrite_sig,
				ALUOP => ALUOp_sig,
				RegWrite => RegWrite_sig);
				
		
	
end behavioral;
			
			
	