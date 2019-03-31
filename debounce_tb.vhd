library ieee;
     
use ieee.std_logic_1164.ALL;

entity 	debounce_tb is
end 	   debounce_tb;

architecture behavior OF debounce_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component debounce is
          
port(   mclk: in std_logic;
        clr: in std_logic;
        res: out std_logic);
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the Debounce
---------------------------------------------------------------    
signal CLK_i	 :std_logic:= '1';   -- System Clock
signal res_o :std_logic:= '1';
signal clr_i :std_logic:='1';
 
	
begin

---------------------------------------------------------------
-- Component Instantiation
-- Clock changes direction every 5ns;
-- Clear signal changes every 50ns
---------------------------------------------------------------
debounce_1: debounce
          
port map(
    mclk => CLK_i,
    res => res_o,
    clr => clr_i);
    	          
CLK_i <= not(CLK_i) after 5 ns;
clr_i <= not(clr_i) after 50 ns;
end;
