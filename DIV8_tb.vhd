library ieee;
use ieee.std_logic_1164.ALL;

entity 	DIV8_tb is
end 	   DIV8_tb;

architecture behavior OF DIV8_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component DIV8 is
          
port(   clk: in std_logic;
        out_clk: out std_logic);
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the DIV8
---------------------------------------------------------------    
signal CLK_i	 :std_logic:= '1';   -- System Clock
signal CLK_o :std_logic:= '1';
 
	
begin

---------------------------------------------------------------
-- Component Instantiation
-- Clock changes direction every 10ns
---------------------------------------------------------------
DIV8_1: DIV8
          
port map(
    clk => CLK_i,
    out_clk => CLK_o);
    	          
CLK_i <= not(CLK_i) after 5 ns;

end;