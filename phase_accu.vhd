library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Takes in a 4bit vector SHIFTER which is the value that the output is added to.
--If CE is high, on the rising edge of the cycle, the "output" vector is output, and then added together to the SHIFTER and stored in "output" vector.
--This process is repeated until the 16 bit "output" vector overflows.

entity phase_accu is
     port(
         q: out std_logic_vector(15 downto 0);
         shifter: in std_logic_vector(3 downto 0);
         ce : in STD_LOGIC;
         clk : in STD_LOGIC;
         res : in std_logic
         );
end phase_accu;


architecture behav of phase_accu is
  signal res_signal : std_logic:='0';
  signal ce_signal : std_logic:='1';
  signal output : std_logic_vector(15 downto 0) :="0000000000000000";

begin
    process (clk) is
    begin
        if(rising_edge(clk)) then
            if(ce='1') then
                q <= output;
                output <= output + shifter;
            end if;
        end if;
    end process;
    
    
end behav;

