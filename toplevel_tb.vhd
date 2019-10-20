library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity toplevel_tb is
end toplevel_tb;

architecture behavioral of toplevel_tb is

	type reg_input_array is array (0 to 31) of std_logic_vector(15 downto 0);
	constant reg_in : reg_input_array := (x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"F46F",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF",
										  x"3838", x"FFFF");

	
	-- type rd_address_array is array (0 to 35) of std_logic_vector(4 downto 0);
	-- constant Rd_array : rd_address_array := (x"00", x"01",x"02",
											 -- x"03", x"04",x"05",
											 -- x"06", x"07",x"08",
											 -- x"09", x"0A",x"0B",
											 -- x"0C", x"0D",x"0E",
											 -- x"0F", x"10",x"11",
											 -- x"12", x"13",x"14",
											 -- x"15", x"16",x"17",
											 -- x"18", x"19",x"1A",
											 -- x"1B", x"1C",x"1D",
											 -- x"1E", x"1F");
											 
	signal busW : std_logic_vector(31 downto 0);
	signal Rd, Rs, Rt       : std_logic_vector(4 downto 0);
	signal RegWr            : std_logic;
	signal ALUctr          : std_logic_vector(2 downto 0);
	signal Result     : std_logic_vector(15 downto 0);
	signal Zero : std_logic;
	signal Carryout : std_logic;
	signal Overflow : std_logic;
	signal Clk : std_logic := '1';
	constant Tperiod : time := 2 ns;
	
begin

	process(Clk)
      begin
        Clk <= not Clk after Tperiod/2;
    end process;
	
--	process	
--	  begin	
--		for i in 0 to 31 loop
--		  busW <= reg_in(i);
--		  Rd <= std_logic_vector(to_unsigned(i, Rd'length));
--		  wait for 5 ns;
--		end loop;
--		wait;
	--end process;
	
	Rs <= "00000";
	Rt <= "00001";
	Rd <= "00010";
	RegWr <= '1';
	  
	DUT : entity work.l3_top(behavioral)
      port map( --busW => busW,
				RegWr => RegWr,
				Rd => Rd,
				Rs => Rs,
				Rt => Rt,
				clk => Clk,
				ALUctr => ALUctr,
				Result => Result,
				Zero => Zero,
				Overflow => Overflow,
				Carryout => Carryout);
end behavioral;
				
	