library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Delays the clock by 8 cycles.
--A 3 bit vector is created that starts from "000".
--Every rising edge, the count is incremented and the MSB is output.
--If the count reaches 8, that means the MSB becomes 1 and so the output is high, afterwards the vector overflows (resets to 000).

entity div8 is
     port(
         clk : in STD_LOGIC;
         out_clk : out STD_LOGIC
         );
end div8;


architecture behav of div8 is
  signal PoR : std_logic := '0';
begin

    process (clk) is
    variable count : std_logic_vector (2 downto 0) := "000";
    begin
        if (rising_edge (clk)) then
          if(PoR='1') then
            count := "000";
          end if;
            count := count + 1;
        end if;
        out_clk <= count(2);
    end process;
end behav;