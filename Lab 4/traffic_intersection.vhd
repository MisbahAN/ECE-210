----------------------------------------------------------------------------------
-- Company: University of Alberta
-- Engineer: Fudong Li
-- 
-- Create Date: 05/11/2018 11:22:20 AM
-- Design Name: 
-- Module Name: traffic_intersection - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic_intersection is
    Port ( 
            clk, EMV, Change, reset, btn:    in STD_LOGIC;       -- btn press to see traffic light status for secondary road.                            
            led6_r, led6_g ,led6_b : out STD_LOGIC:='0';         --Traffic light status             
            led:        out std_logic_vector(2 downto 0);  --Monitor states [ led(0)-led(2) ] . Three_Bit_Vector_Type is defined as STD_LOGIC_VECTOR(2 downto 0) in LAB4_PKG.
            CC :        out STD_LOGIC;                     --Common cathode input to select respective 7-segment digit.
            out_7seg :  out std_logic_vector(6 downto 0)   -- Output  signal for selected 7 Segment display. Seven_Bit_Vector_Type is defined as STD_LOGIC_VECTOR(6 downto 0) in LAB4_PKG
           );
end traffic_intersection;

architecture Behavioral of traffic_intersection is

constant count_for_1Hz: natural:=1; -- uncomment this line for simulation
--constant count_for_1Hz: natural:=62_500_000; -- uncomment this line for implementation
constant Seven_seg_0: std_logic_vector(6 downto 0) :="1111110"; 
constant Seven_seg_1: std_logic_vector(6 downto 0) :="0000110"; 
constant Seven_seg_2: std_logic_vector(6 downto 0) :="1101101"; 
constant Seven_seg_3: std_logic_vector(6 downto 0) :="1001111"; 
constant Seven_seg_4: std_logic_vector(6 downto 0) :="0010111"; 
constant Seven_seg_5: std_logic_vector(6 downto 0) :="1011011"; 
constant Seven_seg_off: std_logic_vector(6 downto 0) :="0000000";
signal clk_1Hz: std_logic:='0';
signal count : natural;
signal clk_out: std_logic:='0';

-- Use following signals to implement your FSM.
signal D: std_logic_vector(2 downto 0) :="000";  --Next state
signal Q: std_logic_vector(2 downto 0) :="000";  --Current state


-- Use CD to show digit on the display
signal CD: std_logic_vector(2 downto 0) :="000";


begin
    --1Hz clock process 
    clock_1Hz: process(clk)
    begin
        if rising_edge(clk) then
            if(count<count_for_1Hz) then --count_for_1Hz=64000000
                count<=count+1;
            else
                count<=0;
                clk_out<=not clk_out;
                clk_1Hz<=clk_out;
            end if;
        end if;
    end process;

   -- Finite State Machine Design Fulfilling Lab4 requirements.
   TrafficIntersection: process (clk, clk_1Hz)
   begin
        
--*Write  Flip-flop input and output equations --- (Hint: D <= function of Q and sw)
 
        D(2) <= 
        D(1) <= 
        D(0) <= 
        
        -----------------------------------------------
        if btn='0' then    
--*Write light status equations of Highway --- (Hint: led6 <= function of Q)
            led6_r <=
            led6_g <= 
            led6_b <= 
        else 
--*Write light status equations of secondary road --- (Hint: led6 <= function of Q)  
            led6_r <= 
            led6_g <= 
            led6_b <= 
        end if; 

--*Write the equations of Seven Segment Display --- (Hint: CD <= function of Q).
        CD(2) <= 
        CD(1) <= 
        CD(0) <= 
      
   end process;
   
   
D_flipflop : process (clk_1Hz) is
begin
        if rising_edge(clk_1Hz) then
            if reset='1' then
               Q<="000";
          else
               Q<=D;
            end if;
        end if;
       led <= Q;            -- Shows current state on LEDs.
   
end process D_flipflop;

 
    Decoder_7Segment: process (clk)
    begin
    --*Write the case statements below to implement the 7-segment decoder (this was done in lab 3)
    -- We want to show CD on one of the seven segments(out_7seg(6 downto 0))
    -- We have defined the bit patern for 0 to 5 as Seven_seg_0 to Seven_seg_5 (constants). Therefore you can simply use Seven_seg_0 instead of writing "0111111". 
    
--      case CD is 
--		  when "000" =>
--		      out_7seg <= Seven_seg_0;
--		  when

--	  end case;           
  
    end process;
--*Don't forget the CC signal.
    CC <= '0';
        
end Behavioral;
