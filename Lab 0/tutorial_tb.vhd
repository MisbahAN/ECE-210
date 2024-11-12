----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2018 11:33:37 AM
-- Design Name: 
-- Module Name: tutorial_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tutorial_tb is
--  Port ( );
end tutorial_tb;

architecture Behavioral of tutorial_tb is

component tutorial is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);   -- For switch inputs: sw0, sw1, sw2 and sw3.
           led : out STD_LOGIC_VECTOR (3 downto 0); -- For led outputs: led0, led1, led2, led3.
           btn0 : in STD_LOGIC);                    -- For selecting encoder or decoder circuit.
end component;

signal sw, led:   std_logic_vector (3 downto 0):="0000";    
signal btn0: std_logic:='0';

begin
    --Instantiate components
    tut1: tutorial port map
          (
            sw=>sw,
            led=>led,
            btn0=>btn0
          );
    
    button_0: process
    begin
        btn0<=not btn0;
        wait for 1 ns;
    end process;

    Test_Cases: process           --Test cases testing our design
    begin
        --Test cases for decoder and encoder circuits, only least two bits matters for decoder circuit.
        sw<="0000";
        wait for 2 ns;
        sw<="0001";
        wait for 2 ns;
        sw<="0010";
        wait for 2 ns;
        sw<="0011";
        wait for 2 ns;
        
        --Test cases for encoder circuit only.
        sw<="0100";
        wait for 2 ns;
        sw<="1000";
        wait for 2 ns;

    end process;

end Behavioral;
