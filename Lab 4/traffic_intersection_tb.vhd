----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2018 03:32:50 PM
-- Design Name: 
-- Module Name: traffic_intersection_tb - Behavioral
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

entity traffic_intersection_tb is
--  Port ( );
end traffic_intersection_tb;

architecture Behavioral of traffic_intersection_tb is


signal clk, EMV, Change, reset, btn, CC: std_logic:='0';
signal led6_r, led6_g ,led6_b : STD_LOGIC:='0';
signal led: std_logic_vector(2 downto 0);
signal out_7seg: std_logic_vector(6 downto 0);

begin

Traffic_Int: entity work.traffic_intersection(Behavioral) port map
    (
        clk=>clk,
        Change=>Change,
        EMV => EMV,
        reset=>reset,
        btn=>btn,
        led=>led,
        led6_r=>led6_r,
        led6_g=>led6_g,
        led6_b=>led6_b,
        out_7seg=>out_7seg
    );

 Clocking: process
 begin
    clk<= '0';
    wait for 10 ns;
    clk<= '1';
    wait for 10 ns;
 end process;

 Stimulus: process 
 begin
    Change<='1';
    wait for 100 ns;
    Change<='0';     
    wait for 600 ns;
    Change<='1';
    wait for 100 ns;
    Change<='0';     
    wait for 150 ns;     
    EMV<='1';
    wait for 100 ns;
    EMV<='0';
    wait;
--    wait for 150 us;     
--    sw<="0101";
--    wait for 12000 ms;     
end process;

end Behavioral;
