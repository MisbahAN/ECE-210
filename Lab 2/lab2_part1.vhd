----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/29/2020 06:26:28 PM
-- Design Name: 
-- Module Name: lab2_part1 - Behavioral
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

entity lab2_part1 is
    Port ( 
            I: in STD_LOGIC_VECTOR (2 downto 0);
             S : in STD_LOGIC_VECTOR (1 downto 0);
              DS : in STD_LOGIC_VECTOR (1 downto 0);
              EI: out STD_LOGIC_VECTOR (2 downto 0):="000";
              O: out STD_LOGIC_VECTOR (2 downto 0):="000"
          );           
           
end lab2_part1;

architecture Behavioral of lab2_part1 is

signal M : std_logic;


begin

--Write your code here


end Behavioral;
