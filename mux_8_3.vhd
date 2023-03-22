----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 11:54:03 PM
-- Design Name: 
-- Module Name: mux_8_3 - Behavioral
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

entity mux_8_3 is
    Port (i0, i1, i2, i3, i4, i5, i6, i7: in STD_LOGIC_VECTOR(7 downto 0);
          res: out STD_LOGIC_VECTOR(7 downto 0);
          sel: in STD_LOGIC_VECTOR(2 downto 0));
end mux_8_3;

architecture Behavioral of mux_8_3 is

begin

process(i0, i1, i2, i3, i4, i5, i6, i7, sel)
begin
  case sel is
    when "000" => res <= i0;
    when "001" => res <= i1;
    when "010" => res <= i2;
    when "011" => res <= i3;
    when "100" => res <= i4;
    when "101" => res <= i5;
    when "110" => res <= i6;
    when "111" => res <= i7;
    when others => res <= i0;
end case;
end process;  

end Behavioral;
