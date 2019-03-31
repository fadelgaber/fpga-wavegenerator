library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--This is a parallel to serial converter with 4bits used for setup.
--The 4 bits are 0000 (normal operation) which are added to the front of the 12 bit data input when CE is high.
--Afterwards, the MSB is output with every risign edge of the clock and the register is shifted to the left by one bit.

entity DAC_INTERFACE is
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
end DAC_INTERFACE;

architecture behav of DAC_INTERFACE is
  signal last_4bits: std_logic_vector(3 downto 0) := "0000";
  signal register_16bits: std_logic_vector(15 downto 0);
  
  begin
  cs <= CE;
  sclk <= CLK;
  
  process(CLK)
    begin
    if(CE='1') then
        register_16bits <= last_4bits & data_in;
      end if;
    if(rising_edge(CLK)) then  
      if(RES='1') then
        register_16bits<="0000000000000000";
      end if;
      data_1 <= register_16bits(15);
      data_2 <= register_16bits(15);
      register_16bits <= register_16bits(14 downto 0) & '0';
    end if;
  end process;
end behav;