----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2023 07:53:26 PM
-- Design Name: 
-- Module Name: count_and_shift - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity count_and_shift is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          sa: in STD_LOGIC_VECTOR(2 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(6 downto 0));
end count_and_shift;

architecture Behavioral of count_and_shift is

component shifter is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(6 downto 0));
end component;

type ARRAY_TYPE is array (0 to 8) of std_logic_vector(63 downto 0);
signal partial_in: ARRAY_TYPE;
signal clk: STD_LOGIC;

begin

partial_in(0) <= a;
G_1 : for i in 0 to 7 generate

  shifting: shifter port map (partial_in(i), partial_in(i+1), sel); 
    
end generate;

process(sa, a, sel)
begin
case sa is
    when "000" =>
        res <= partial_in(0);
    when "001" =>
        res <= partial_in(1);
    when "010" =>
        res <= partial_in(2);
    when "011" =>
        res <= partial_in(3);
    when "100" =>
        res <= partial_in(4);
    when "101" =>
        res <= partial_in(5);
    when "110" =>
        res <= partial_in(6);
    when "111" =>
        res <= partial_in(7);  
    when others =>
        res <= partial_in(0); 
end case;
end process;

end Behavioral;
