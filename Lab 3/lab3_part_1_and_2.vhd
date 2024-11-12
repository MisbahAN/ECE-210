----------------------------------------------------------------------------------
-- Company: University of Alberta

-- Design Name: 7segment - gate level
-- Module Name: lab3_part1 - Behavioral
-- Project Name: ECE210 - lab3_part1
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: Antonio Andara Lara (28-10-2024)
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SevenSegments IS
    PORT (
        sw       : IN STD_LOGIC_VECTOR(3 DOWNTO 0);    -- Input switches
        CC       : OUT STD_LOGIC;                      --Common cathode input to select respective 7-segment. 0=> first, 1=> second
        out_7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)); -- Output for 7-Segment display
END SevenSegments;

ARCHITECTURE Behavioral OF SevenSegments IS

BEGIN

    --Part I: Uncomment the code below for part I=================================

    --out_7seg(0) <= ;					--G
    --out_7seg(1) <= ;					--F
    --out_7seg(2) <= ;					--E
    --out_7seg(3) <= ;					--D
    --out_7seg(4) <= ;					--C
    --out_7seg(5) <= ;					--B
    --out_7seg(6) <= ;					--A
    --CC <= '';

    --End of part I===============================================================

    --Part II: Uncomment one of the code sections below for part II===============

    --    process(sw)   --if you prefer if-else statements
    --        begin
    --            if (sw="0000") then out_7seg <= "";
    --            elsif (sw="0001") then out_7seg <= "";
    --            elsif (sw="0010") then out_7seg <= "";
    --            elsif (sw="0011") then out_7seg <= "";
    --            elsif (sw="0100") then out_7seg <= "";
    --            elsif (sw="0101") then out_7seg <= "";
    --            elsif (sw="0110") then out_7seg <= "";
    --            elsif (sw="0111") then out_7seg <= "";
    --            elsif (sw="1000") then out_7seg <= "";
    --            elsif (sw="1001") then out_7seg <= "";
    --            elsif (sw="1010") then out_7seg <= "";
    --            elsif (sw="1011") then out_7seg <= "";
    --            elsif (sw="1100") then out_7seg <= "";
    --            elsif (sw="1101") then out_7seg <= "";
    --            elsif (sw="1110") then out_7seg <= "";
    --            elsif (sw="1111") then out_7seg <= "";
    --            else out_7seg <= "";
    --            end if;
    --    end process;
    --CC <= '';

    --    process(sw)   --if you prefer Case statements
    --        begin
    --			Case sw is
    --	           when "0000" => out_7seg <= "";
    --	           when "0001" => out_7seg <= "";
    --	           when "0010" => out_7seg <= "";
    --	           when "0011" => out_7seg <= "";
    --	           when "0100" => out_7seg <= "";
    --	           when "0101" => out_7seg <= "";
    --	           when "0110" => out_7seg <= "";
    --	           when "0111" => out_7seg <= "";
    --	           when "1000" => out_7seg <= "";
    --	           when "1001" => out_7seg <= "";
    --	           when "1010" => out_7seg <= "";
    --	           when "1011" => out_7seg <= "";
    --	           when "1100" => out_7seg <= "";
    --	           when "1101" => out_7seg <= "";
    --	           when "1110" => out_7seg <= "";
    --	           when "1111" => out_7seg <= "";
    --	           when others => out_7seg <= "";
    --       end case;
    --    end process;
    --CC <= '';

    --End of part II==============================================================

END Behavioral;
