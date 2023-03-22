----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2022 03:16:06 PM
-- Design Name: 
-- Module Name: mux_1x4 - Behavioral
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

entity mux_1x4 is
    Port( a, b, c, d: in STD_LOGIC;
          sel: in STD_LOGIC_VECTOR(1 downto 0);
          res: out STD_LOGIC);
end mux_1x4;

architecture Behavioral of mux_1x4 is

begin

process(a, b, c, d, sel)
begin

case sel is
    when "00" => res <= a;
    when "01" => res <= b;
    when "10" => res <= c;
    when "11" => res <= d;
    when others => res <= a;
end case;
end process;

end Behavioral;
