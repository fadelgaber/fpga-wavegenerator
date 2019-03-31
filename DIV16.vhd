library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Delays the clock by 16 cycles.
--Similar principle to the DIV8 code but has an if statement to check if the value is 16, and output high.

entity div16 is
     port(
         clk : in STD_LOGIC;
         out_clk : out STD_LOGIC
         );
end div16;


architecture behav of div16 is
  signal PoR : std_logic := '0'; --Reset signal which is set to 0 upon power-up.
begin

    process (clk) is
    variable count : std_logic_vector (3 downto 0) := "0000";
    begin
        if (rising_edge (clk)) then
          if(PoR='1') then
            count := "0000";
          end if;
            count := count + 1;
            out_clk <= '0';
            if(count = "1111") then
              out_clk <= '1';
            end if;
        end if;
        
    end process;
end behav;
