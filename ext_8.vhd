----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2022 03:30:19 PM
-- Design Name: 
-- Module Name: ext_8 - Behavioral
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

entity ext_8 is
    Port ( 
    a: in STD_LOGIC;
    ext: out STD_LOGIC_VECTOR (7 downto 0));
end ext_8;

architecture Behavioral of ext_8 is

begin

process(a)
begin

if a = '1' then
    ext <= "11111111";
else 
    ext <= "00000000";
end if;
end process;

end Behavioral;
