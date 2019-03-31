library ieee;
use ieee.std_logic_1164.ALL;

entity 	phase_accu_tb is
end 	   phase_accu_tb;

architecture behavior OF phase_accu_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component phase_accu is
          
port(    q: out std_logic_vector(15 downto 0);
         shifter: in std_logic_vector(3 downto 0);
         ce : in STD_LOGIC;
         clk : in STD_LOGIC;
         res : in std_logic);
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the Phase Accumulator
---------------------------------------------------------------    
signal CLK_i	 :std_logic:= '1';   -- System Clock
signal res_signal : std_logic:='0';
signal ce_signal : std_logic:='1';
signal d_signal :std_logic_vector(15 downto 0):="0000000000000000";
signal out_signal :std_logic_vector(15 downto 0);
signal d_adder: std_logic_vector(3 downto 0) := "0011"; --SHIFTER input

 
	
begin

---------------------------------------------------------------
-- Component Instantiation
-- Clock changes direction every 5ns
---------------------------------------------------------------
phase_accu_1: phase_accu
          
port map(
    q => out_signal,
    shifter => d_adder,
    ce => ce_signal,
    clk => CLK_i,
    res => res_signal);
    	          
CLK_i <= not(CLK_i) after 5 ns;

end;