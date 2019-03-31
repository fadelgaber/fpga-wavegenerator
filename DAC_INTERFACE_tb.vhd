library ieee;     
use ieee.std_logic_1164.ALL;

entity 	DAC_INTERFACE_tb is
end 	   DAC_INTERFACE_tb;

architecture behavior OF DAC_INTERFACE_tb is 

---------------------------------------------------------------
-- Component Description
---------------------------------------------------------------
component dac_interface is
          
  port(
         data_in : in STD_LOGIC_vector(11 downto 0);
         RES : in STD_LOGIC;
         CE : in std_logic;
         CLK : in std_logic;
         cs : out std_logic;
         sclk : out std_logic;
         data_1 : out std_logic;
         data_2 : out std_logic
         );
    	          
end component;
          
---------------------------------------------------------------
-- signal declarations
-- All inputs and outputs of the DAC Interface
---------------------------------------------------------------    
signal CLK_i	 :std_logic:= '1';   -- System Clock
signal res_signal : std_logic:='0';
signal ce_signal : std_logic:='1';
signal d_signal :std_logic_vector(11 downto 0):="110000011011";
signal out_signal :std_logic;
signal out_signal_2 :std_logic;
signal cs_output : std_logic:='0';
signal sclk_output : std_logic:='0';

 
	
begin

---------------------------------------------------------------
-- Component Instantiation
-- Clock changes direction every 5ns
-- CE signal (used as a setup signal) starts high and goes low after 50ns
---------------------------------------------------------------
dac_interface_declared: dac_interface
          
port map(
    data_1 => out_signal,
    data_2 => out_signal_2,
    CE => ce_signal,
    CLK => CLK_i,
    RES => res_signal,
    data_in => d_signal,
    cs => cs_output,
    sclk => sclk_output);
    	          
CLK_i <= not(CLK_i) after 5 ns;
ce_signal <= '0' after 50 ns;

end;
