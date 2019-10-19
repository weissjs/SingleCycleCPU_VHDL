library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port( busA   : in std_logic_vector(15 downto 0);
		  busB   : in std_logic_vector(15 downto 0);
		  mode   : in std_logic_vector(2 downto 0);
		  Overflow : out std_logic;
		  Cout   : out std_logic;
		  Result : out std_logic_vector(15 downto 0);
		  Zero   : out std_logic);
end alu;

architecture behavioral of alu is
  
	--signal Cin_sig : std_logic := '0';
	signal c_sig : std_logic_vector(16 downto 0) := "00000000000000000";
	signal add_1 : std_logic_vector(15 downto 0) := x"0001";
	signal busB_sig : std_logic_vector(15 downto 0);
	signal result_twos : std_logic_vector (15 downto 0);
	signal c_sig_twos :  std_logic_vector (16 downto 0) := "00000000000000000";
	signal mode_sig : std_logic_vector (2 downto 0);
	signal c_sig_sub : std_logic_vector(16 downto 0)  := "00000000000000000";
	signal busA_sig   : std_logic_vector(16 downto 0);
	signal busA_sig_lsr : std_logic_vector(16 downto 0);
	signal busA_sig_asr : std_logic_vector(16 downto 0);
	
	
	signal Result_add : std_logic_vector(15 downto 0);
	signal Cout_add   : std_logic;
	signal Overflow_add : std_logic;
	signal Zero_add     : std_logic;
	
	signal Result_sub : std_logic_vector(15 downto 0);
	signal Cout_sub   : std_logic;
	signal Overflow_sub : std_logic;
	signal Zero_sub     : std_logic;
	
	signal Result_lsl : std_logic_vector(15 downto 0);
	signal Cout_lsl  : std_logic;
	signal Overflow_lsl : std_logic;
	signal Zero_lsl     : std_logic;
	
	signal Overflow_lsa : std_logic;
	
	signal Result_lsr : std_logic_vector(15 downto 0);
	signal Cout_lsr : std_logic;
	signal Overflow_lsr : std_logic;
	
	signal Result_asr : std_logic_vector(15 downto 0);
	signal Cout_asr : std_logic;
	signal Overflow_asr : std_logic;
	
	signal Result_sig : std_logic_vector(15 downto 0);
	
	signal shift_amt  : integer := 0;
	
	signal Result_inv : std_logic_vector(15 downto 0);
begin

	process(mode, Result_add, Result_lsl, Result_sub, Result_lsr) 
	begin
		case mode is
		  when "000" =>
			Result_sig <= Result_add;
			Overflow <= Overflow_add;
			Cout <= Cout_add;
		  when "001" =>
			Result_sig <= Result_sub;
			Overflow <= Overflow_sub;
			Cout <= Cout_sub;
		  when "010" =>
			Result_sig <= busA AND busB;
			Overflow <= '0';
			Cout <= '0';
		  when "011" =>
			Result_sig <= busA OR busB;
			Overflow <= '0';
			Cout <= '0';
		  when "100" =>
		    Result_sig <= Result_lsl;
			Overflow <= '0';
			Cout <= Cout_lsl;
		  when "101" =>
			Result_sig <= Result_lsr;
			Overflow <= '0';
			Cout <= Cout_lsr;
		  when "110" =>
			Result_sig <= Result_lsl;
			Overflow <= Overflow_lsa;
			Cout <= Cout_lsl;
		  when "111" =>
		    Result_sig <= Result_asr;
			Overflow <= '0';
			Cout <= Cout_asr;
		  when others =>
		    Result_sig <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
		end case;
	end process;

	Result <= Result_sig;
	Result_inv <= NOT Result_sig; 
	
	process(Result_inv)
	begin
		Zero <= Result_inv(0) AND Result_inv(1) AND
				Result_inv(2) AND Result_inv(3) AND
				Result_inv(4) AND Result_inv(5) AND
				Result_inv(6) AND Result_inv(7) AND
				Result_inv(8) AND Result_inv(9) AND
				Result_inv(10) AND Result_inv(11) AND
				Result_inv(12) AND Result_inv(13) AND
				Result_inv(14) AND Result_inv(15);
	end process;
	
    add_16 : for i in 0 to 15 generate 
	
	    U0 : entity work.full_add(behavioral)
        port map( A => busA(i),
				B => busB(i),
				sum => Result_add(i),
				Cin => C_sig(i),
				Cout => c_sig(i+1));
				
	    end generate add_16;
	
	   Cout_add <= c_sig(16);
	   Overflow_add <= c_sig(15) XOR c_sig(16);
	
	   busB_sig <= NOT busB;
	   
	sub_16 : for i in 0 to 15 generate 
	
	    U0 : entity work.full_add(behavioral)
        port map( A => busB_sig(i),
				B => add_1(i),
				sum => result_twos(i),
				Cin => c_sig_twos(i),
				Cout => c_sig_twos(i+1));		
	  
	    U1 : entity work.full_add(behavioral)
		port map( A => busA(i),
				  B => result_twos(i),
				  sum => Result_sub(i),
				  Cin => c_sig_sub(i),
				  Cout => c_sig_sub(i+1));
		end generate sub_16; 
		
		Cout_sub <= c_sig(16);
		Overflow_sub <= c_sig(15) XOR c_sig(16);
	
	shift_amt <= to_integer(unsigned(busB));
	
	busA_sig <= busA & '0';
	busA_sig_lsr <= '0' & busA;
	busA_sig_asr <= busA(15) & busA;
	
	lsl_16 : for i in 1 to 16 generate
		U2 : entity work.mux(behavioral)
		port map( a => busA_sig(i),
				  b => busA_sig(i - 1),
				  s => busB(0),
				  y => Result_lsl(i -1));
		end generate lsl_16;
		
	Cout_lsl <= busA(15) AND busB(0);
	lsr_16 : for i in 0 to 15 generate
		U2 : entity work.mux(behavioral)
		port map( a => busA_sig_lsr(i),
				  b => busA_sig_lsr(i + 1),
				  s => busB(0),
				  y => Result_lsr(i));
		end generate lsr_16;
	Overflow_lsa <= busB(0) AND busA(15);
	Cout_lsr <= busA(0) AND busB(0);
	asr_16 : for i in 0 to 15 generate
		U2 : entity work.mux(behavioral)
		port map( a => busA_sig_asr(i),
				  b => busA_sig_asr(i + 1),
				  s => busB(0),
				  y => Result_asr(i));
		end generate asr_16;
	
	Cout_asr <= busA(0) AND busB(0);
		
		

end behavioral;
			
			
	
	


