library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--This circuit takes in a 16 bit vector input and cuts it down to the first 5 bits (from LSB).
--These 5 bits are used in multiplexer logic where the output is represented in hexadecimal values. These values are the values of the sine wave calculated in the excel spreadsheet.
--The Sin(x)+Sin(3x) curve is mapped onto 32 binary codes which are output in order.

entity wave_gen is
  port(
    D: in std_logic_vector(15 downto 0);
    Q: out std_logic_vector(11 downto 0)
  );
end wave_gen;

architecture behav of wave_gen is
  signal d_5bit: std_logic_vector(4 downto 0);
  
begin
  
  d_5bit <= D(4 downto 0);

Q <=
		x"400"	when d_5bit = "00000" else
		x"B01"	when d_5bit = "00001" else
		x"D3A"	when d_5bit = "00010" else
		x"E25"	when d_5bit = "00011" else
		x"DA8"	when d_5bit = "00100" else
		x"C1B"	when d_5bit = "00101" else
		x"A2A"	when d_5bit = "00110" else
		x"899"	when d_5bit = "00111" else
		x"800"  when d_5bit = "01000" else
		x"899"	when d_5bit = "01001" else
		x"A2A"	when d_5bit = "01010" else
		x"C1B"	when d_5bit = "01011" else
		x"DA8"	when d_5bit = "01100" else
		x"E25"	when d_5bit = "01101" else
		x"D3A"	when d_5bit = "01110" else
		x"B01"	when d_5bit = "01111" else
		x"800"	when d_5bit = "10000" else
		x"4FF"	when d_5bit = "10001" else
		x"2C6"	when d_5bit = "10010" else
		x"1DB"	when d_5bit = "10011" else
		x"258"	when d_5bit = "10100" else
		x"3E5"	when d_5bit = "10101" else
		x"5D6"	when d_5bit = "10110" else
		x"767"	when d_5bit = "10111" else
		x"800"	when d_5bit = "11000" else
		x"767"	when d_5bit = "11001" else
		x"5D6"	when d_5bit = "11010" else
		x"3E5"	when d_5bit = "11011" else
		x"258"	when d_5bit = "11100" else
		x"1DB"	when d_5bit = "11101" else
		x"2C6"	when d_5bit = "11110" else
		x"4FF"	when d_5bit = "11111";

end behav;