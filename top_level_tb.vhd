library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_level_tb is
end entity;

architecture behavior of top_level_tb is
  constant TIME_DELAY : time := 20 ns;
  constant NUM_VALS : integer := 15;

  type RegWr_array is array(0 to (NUM_VALS - 1)) of std_logic;
  type Rd_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(4 downto 0);
  type Rs_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(4 downto 0);
  type Rt_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(4 downto 0);
  type ALUctr_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(2 downto 0);
  type Zero_array is array(0 to (NUM_VALS - 1)) of std_logic;
  type Overflow_array is array(0 to (NUM_VALS - 1)) of std_logic;
  type Carryout_array is array(0 to (NUM_VALS - 1)) of std_logic;
  type Result_array is array(0 to (NUM_VALS - 1)) of std_logic_vector(15 downto 0);

  -- Expected input and output data.
  constant RegWr_vals : RegWr_array := ('1','1','1','1','1', 
										'1','1','1','1','1', 
										'1','1','1','1','1');
  constant Rd_vals : Rd_array := ("11111","11110", "11101", 
								  "11100","11011", "11010", 
								  "11001","11000", "10111",
								  "11001","11000", "10111",
								  "11001","11000", "10111");--"11100", "11011", "11010");
  constant Rs_vals : Rs_array := ("00000","00001", "00100",
								  "00001","01000", "00110",
								  "00111","00011", "00011",
								  "00011","00011", "01000",
								  "01000","01000", "00000");
  constant Rt_vals : Rt_array := ("00010","00011", "00101",
								  "00001","01001", "01000",
								  "00011","00000", "01010",
								  "00000","01010", "00000",
								  "00000","01010", "00000");
  constant ALUctr_vals : ALUctr_array := ("000","001","000",
										  "001","000","010",
										  "011","100","100",
										  "101","101","110",
										  "111","111","101");


  signal clk_sig : std_logic := '0';
  signal RegWr_sig : std_logic;
  signal Rd_sig : std_logic_vector(4 downto 0);
  signal Rs_sig : std_logic_vector(4 downto 0);
  signal Rt_sig : std_logic_vector(4 downto 0);
  signal ALUctr_sig : std_logic_vector(2 downto 0);
  signal Zero_sig : std_logic;
  signal Overflow_sig : std_logic;
  signal Carryout_sig : std_logic;
  signal Result_sig : std_logic_vector(15 downto 0);

begin

  DUT : entity work.l3_top(behavioral)
    port map(Clk => clk_sig,
             RegWr => RegWr_sig,
             Rd => Rd_sig,
             Rs => Rs_sig,
             Rt => Rt_sig,
             ALUctr => ALUctr_sig,
             Zero => Zero_sig,
             Overflow => Overflow_sig,
             Carryout => Carryout_sig,
             Result => Result_sig);

  clock : process
  begin
    for i in 0 to 2 * (NUM_VALS) loop
      clk_sig <= NOT clk_sig;
      wait for TIME_DELAY/2;
    end loop;
    wait;
  end process clock;

  stimulus : process
  begin
    for i in 0 to (NUM_VALS - 1) loop
      RegWr_sig <= RegWr_vals(i);
      Rd_sig <= Rd_vals(i);
      Rs_sig <= Rs_vals(i);
      Rt_sig <= Rt_vals(i);
      ALUctr_sig <= ALUctr_vals(i);
      wait for TIME_DELAY;
    end loop;
    wait;
  end process stimulus;


end behavior;
