library ieee;
     
use ieee.std_logic_1164.ALL;

entity 	DIV16_tb is
end 	   DIV16_tb;

architecture behavior OF DIV16_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component DIV16 is
          
port(   clk: in std_logic;
        out_clk: out std_logic);
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the DIV16
---------------------------------------------------------------    
signal CLK_i	 :std_logic:= '1';   -- System Clock
signal CLK_o :std_logic:= '1';
 
	
begin

---------------------------------------------------------------
-- Component Instantiation
-- Clock changes direction every 5ns
---------------------------------------------------------------
DIV16_1: DIV16
          
port map(
    clk => CLK_i,
    out_clk => CLK_o);
    	          
CLK_i <= not(CLK_i) after 5 ns;

end;
