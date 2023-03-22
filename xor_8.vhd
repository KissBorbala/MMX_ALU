----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2022 03:58:54 PM
-- Design Name: 
-- Module Name: xor_8 - Behavioral
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

entity xor_8 is
Port ( 
        a: in STD_LOGIC_VECTOR(7 downto 0);
        b: in STD_LOGIC;
        res: out STD_LOGIC_VECTOR( 7 downto 0));
end xor_8;

architecture Behavioral of xor_8 is

begin
    
process(a, b)
begin
    if b = '1' then
        res <= a xor "11111111";
    else 
        res <= a xor "00000000";
    end if;
end process;
    
end Behavioral;
