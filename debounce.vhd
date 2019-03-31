library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Simple debouncer circuit that delays the output of RES by a clock cycle.

entity debounce is
     port(
         mclk : in STD_LOGIC;
         clr : in STD_LOGIC;
         res : out std_logic
         );
end debounce;


architecture behav of debounce is
  signal q : std_logic := '0';
begin

    process (mclk) is
    begin
        if (rising_edge (mclk)) then
         q <= clr;
         res <= q;
       end if;
    end process;
end behav;

