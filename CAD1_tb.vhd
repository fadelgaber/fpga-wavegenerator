library ieee;
use ieee.std_logic_1164.ALL;

entity 	CAD1_tb is
end 	   CAD1_tb;

architecture behavior OF CAD1_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component cad1 is
          
port(
         mclk : in STD_LOGIC;
         CLR : in STD_LOGIC;
         shifter_input : in std_logic_vector(3 downto 0);
         sclk : out std_logic;
         cs : out std_logic;
         data_1 : out std_logic;
         data_2 : out std_logic
         );
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the CAD1 top-level design
---------------------------------------------------------------    
signal CLK_i	 :std_logic:= '1';   -- System Clock
signal res_signal : std_logic:='0';
signal shifter : std_logic_vector(3 downto 0):="0011";
signal out_signal_1 :std_logic;
signal out_signal_2 :std_logic;
signal sclk	 :std_logic:= '0';   -- System Clock
signal cs	 :std_logic:= '0';   -- System Clock

 
	
begin

---------------------------------------------------------------
-- Component Instantiation
-- Clock changes direction every 5ns
---------------------------------------------------------------
cad1_declared: cad1
          
port map(
    mclk => CLK_i,
    CLR => res_signal,
    shifter_input => shifter,
    sclk => sclk,
    cs => cs,
    data_1=>out_signal_1,
    data_2=>out_signal_2);
    	          
CLK_i <= not(CLK_i) after 5 ns;

end;