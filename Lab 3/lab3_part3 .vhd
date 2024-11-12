----------------------------------------------------------------------------------
-- Company:     University of Alberta
-- Engineer:    Behdad Goodarzy
-- 
-- Create Date: 10/18/2021 09:43:23 AM
-- Design Name: ECE210 - lab3 parts 3 & 4
-- Module Name: SevenSegments - Behavioral
-- Project Name: 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY SevenSegments2digits IS
    PORT (
        clk      : IN STD_LOGIC;                       --clk
        CC       : OUT STD_LOGIC;                      --Common cathode input to select respective 7-segment digit.
        out_7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)); --Other 7 inputs for 7-segment digits
END SevenSegments2digits;

ARCHITECTURE Behavioral OF SevenSegments2digits IS
    --constants
    CONSTANT clk_divider_forOneHz : POSITIVE := 128000000;  --128000000 for implementation 	--3 for simulation
															--used for generating 1Hz from internal clk for counter
															
    CONSTANT clk_divider_for7seg  : POSITIVE := 640000;     --640000 for implementation  	--1 for simulation		
															--used for generating 100Hz from internal clk for SevenSegments
															
    CONSTANT countwidth           : POSITIVE := 32;         --32 for implementation 	--8 for simulation
    CONSTANT max_SevenSeg_Count   : POSITIVE := 20;         --last 2 digits of your student ID (If less than 10, choose another number >= 10)
    --signals
    SIGNAL count                  : STD_LOGIC_VECTOR(countwidth - 1 DOWNTO 0); --for generating 1Hz from internal clk for up counting
    SIGNAL count_7seg             : STD_LOGIC_VECTOR(countwidth - 1 DOWNTO 0); --for generating 100Hz from internal clk for 7segments
    SIGNAL clk_out_7seg           : STD_LOGIC := '0';                          --Clock used as the control signal for 
    SIGNAL SevenSeg_Count         : INTEGER RANGE 0 TO max_SevenSeg_Count;
    SIGNAL SevenSeg_show          : STD_LOGIC_VECTOR(7 DOWNTO 0); --8-bit vector, 4 MSBs would be the first digit and 4 LSBs would be the second digit counter in decimal

BEGIN

    CLK_Gen : PROCESS (clk) --Process will generate Clocks used for up counting 1Hz and 7Segmant CC 128Hz
        --SevenSeg_Count every (clk_divider_forOneHz) should increase. If SevenSeg_Count is equal to max_SevenSeg_Count it should go back to 0
    BEGIN
        IF rising_edge(clk) THEN

            IF (count < clk_divider_forOneHz) THEN --dividing internal clk by 2*clk_divider_forOneHz
                count <= count + '1';
            ELSE
                count <= (OTHERS => '0');                     --1 second has passed
                IF (SevenSeg_Count < max_SevenSeg_Count) THEN --up counting from 0 to last 2-digits of your student ID
                    -- Write code to count up SevenSeg_Count
                ELSE
                    -- Reset SevenSeg_count
                END IF;
            END IF;

            IF (count_7seg < clk_divider_for7seg) THEN --dividing internal clk by 2*clk_divider_for7seg
                count_7seg <= count_7seg + '1';
            ELSE
                count_7seg <= (OTHERS => '0'); --5ms has passed
                --write your code here
                -- toggle 'clk_out_7seg' which will be assigned to 'CC' later in code
            END IF;

        END IF;
    END PROCESS;

    decimal_to_binary : PROCESS (SevenSeg_Count) --SevenSeg_show is 8 bits, write a code to show 4 MSBs on the left 7segment and 4 LSBs on right 7segment.
        --SevenSeg_Count is an integer that needs to be converted to a vector format
    BEGIN
        SevenSeg_show(7 DOWNTO 4) <= STD_LOGIC_VECTOR(to_unsigned(SevenSeg_Count / 10, 4));   --first digit of the last 2-digits of student ID is assigned to SevenSeg_show(7 downto 4)
        SevenSeg_show(3 DOWNTO 0) <= STD_LOGIC_VECTOR(to_unsigned(SevenSeg_Count REM 10, 4)); --second digit of the last 2-digits of student ID is assigned to SevenSeg_show(7 downto 4)
    END PROCESS;

    Decoder_8bitsto2SevenSegments : PROCESS (clk_out_7seg, SevenSeg_show)
        --SevenSeg_show is 8 bits, write a code to show 4 MSBs on the left 7segment and 4 LSBs on right 7segment.
        --Hint: While clk_out_7seg is '1' you are displaying 4 digits on one segment and while it is '0' you are displaying on the other one.
    BEGIN --Here students can call a component from part 2 of the lab or reuse their code

        IF (clk_out_7seg = '0') THEN
            -- Write code to display the left digit
        ELSE
            -- Write code to display the right digit            
        END IF;

    END PROCESS;

    -- Assigning CC signal
    CC <= clk_out_7seg;

END Behavioral;
