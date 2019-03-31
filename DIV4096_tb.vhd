library ieee;
use ieee.std_logic_1164.ALL;

entity 	DIV4096_tb is
end 	   DIV4096_tb;

architecture behavior OF DIV4096_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component DIV4096 is
          
port(   clk: in std_logic;
        out_clk: out std_logic);
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the DIV4096
---------------------------------------------------------------    
signal CLK_i	 :std_logic:= '1';   -- System Clock
signal CLK_o :std_logic:= '0';
 
	
begin

---------------------------------------------------------------
-- Component Instantiation
-- Clock changes direction every 5ns
---------------------------------------------------------------
DIV4096_1: DIV4096
          
port map(
    clk => CLK_i,
    out_clk => CLK_o);
    	          
CLK_i <= not(CLK_i) after 5 ns;

end;
