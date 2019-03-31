library ieee;  
use ieee.std_logic_1164.ALL;

entity 	wave_gen_tb is
end 	   wave_gen_tb;

architecture behavior OF wave_gen_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component wave_gen is
          
port(
    D: in std_logic_vector(15 downto 0);
    Q: out std_logic_vector(11 downto 0)
  );
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the Wave Generator
---------------------------------------------------------------    
signal d_signal :std_logic_vector(15 downto 0):="0000000000000100";
signal out_signal :std_logic_vector(11 downto 0);

 
	
begin

---------------------------------------------------------------
-- Component Instantiation
---------------------------------------------------------------
wave_gen_1: wave_gen
          
port map(
    D => d_signal,
    Q => out_signal);

end;
