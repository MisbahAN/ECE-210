----------------------------------------------------------------------------------
-- Company: University of Alberta
-- Engineer: Behdad Goodarzy
-- 
-- Create Date: 06/29/2018 11:33:37 AM
-- Design Name: 
-- Module Name: lab1_tb - Behavioral
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

entity lab1_tb is
--  Port ( );
end lab1_tb;

architecture Behavioral of lab1_tb is

component lab1 is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);   -- For inputs: input(0)[A], input(1)[B], input(C)[2], input(3)[D].
           led : out STD_LOGIC_VECTOR (1 downto 0)  -- For outputs:  output(0)[F1], output(1)[F2].
           );                    
end component;

signal sw:   std_logic_vector (3 downto 0):="0000"; 
signal led:   std_logic_vector (1 downto 0):="00"; 

begin
    --Instantiate components
    tut1: lab1 port map
          (
            sw=>sw,
            led=>led
          );

    Test_Cases: process           --Test cases testing our design
    begin
        --Test cases lab1 ECE210 UoA
        sw<="0000";
        wait for 2 ns;
        sw<="0001";
        wait for 2 ns;
        sw<="0010";
        wait for 2 ns;
        sw<="0011";
        wait for 2 ns;
        sw<="0100";
        wait for 2 ns;
        sw<="0101";
        wait for 2 ns;
        sw<="0110";
        wait for 2 ns;
        sw<="0111";
        wait for 2 ns;
        sw<="1000";
        wait for 2 ns;
        sw<="1001";
        wait for 2 ns;
        sw<="1010";
        wait for 2 ns;
        sw<="1011";
        wait for 2 ns;
        sw<="1100";
        wait for 2 ns;
        sw<="1101";
        wait for 2 ns;
        sw<="1110";
        wait for 2 ns;
        sw<="1111";
        wait for 2 ns;
        
    end process;

end Behavioral;