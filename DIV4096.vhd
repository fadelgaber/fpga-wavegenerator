library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Delays the clock by 4096 cycles.
--Similar working principle to the previous DIV circuits but count is an integer because a vector would take too much space.
--Increments count every rising edge. If count is 4096, output 1 and reset counter to 0.

entity div4096 is
     port(
         clk : in STD_LOGIC;
         out_clk : out STD_LOGIC
         );
end div4096;


architecture behav of div4096 is
  signal PoR : std_logic := '0';
  signal count : integer := 0;
begin

    process (clk) is
    begin
        if (rising_edge (clk)) then
          if(PoR='1') then
            count <= 0;
          end if;
            count <= count + 1;
            out_clk <= '0';
            if(count = 4096) then
              out_clk <= '1';
              count <= 0;
            end if;
        end if;
        
    end process;
end behav;
