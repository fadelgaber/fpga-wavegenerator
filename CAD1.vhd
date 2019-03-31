library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--This VHD file contains the top-level design of all the components previously written to create the final DDS design.
--The output of every component goes to a local signal, this local signal is then used as an input for the next component.

entity CAD1 is
     port(
         mclk : in STD_LOGIC;
         CLR : in STD_LOGIC;
         shifter_input : in std_logic_vector(3 downto 0);
         sclk : out std_logic;
         cs : out std_logic;
         data_1 : out std_logic;
         data_2 : out std_logic
         );
end CAD1;

architecture toplevel_behav of CAD1 is --declarations of all the component outputs
  signal CLK : std_logic;
  signal MS: std_logic;
  signal CE: std_logic;
  signal RES: std_logic;
  signal accumulator_q: std_logic_vector(15 downto 0);
  signal waveform_q: std_logic_vector(11 downto 0);
  
  component DIV8 is
    port(
         clk : in STD_LOGIC;
         out_clk : out STD_LOGIC
         );
   end component;
   
   component DIV4096 is
      port(
         clk : in STD_LOGIC;
         out_clk : out STD_LOGIC
         );
    end component;
    
    component DIV16 is
      port(
         clk : in STD_LOGIC;
         out_clk : out STD_LOGIC
       );
    end component;
    
    component DEBOUNCE is
      port(
         mclk : in STD_LOGIC;
         clr : in STD_LOGIC;
         res : out std_logic
         );
   end component;
   
   component phase_accu is
     port(
         q: out std_logic_vector(15 downto 0);
         shifter: in std_logic_vector(3 downto 0);
         ce : in STD_LOGIC;
         clk : in STD_LOGIC;
         res : in std_logic
         );
  end component;
  
  component wave_gen is
    port(
    D: in std_logic_vector(15 downto 0);
    Q: out std_logic_vector(11 downto 0)
  );
  end component;
  
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
      
      
        
  begin
    DIV8_declared: div8 port map(clk => mclk, out_clk => CLK);
    DIV16_declared: div16 port map(clk=>CLK, out_clk=>CE);
    DIV4096_declared: DIV4096 port map(clk=>CLK, out_clk => MS);
    
    DEBOUNCE_declared: debounce port map(mclk=>CLK, clr=>CLR, res=>RES);
    phase_accumulator_declared: phase_accu port map(shifter=>shifter_input, clk=>CLK, ce=>CE, res=>RES, q=>accumulator_q);
    wave_generator_declared: wave_gen port map(D=>accumulator_q, Q=>waveform_q);
    dac_interface_declared: dac_interface port map(data_in => waveform_q,
                                                   RES => RES,
                                                   CE => CE,
                                                   CLK => CLK,
                                                   cs => cs,
                                                   sclk => sclk,
                                                   data_1 => data_1,
                                                   data_2 => data_2);
  end toplevel_behav;
  