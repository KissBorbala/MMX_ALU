----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 11:50:11 PM
-- Design Name: 
-- Module Name: mux_40_2 - Behavioral
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

entity mux_40_2 is
    Port (i0, i1, i2, i3: in STD_LOGIC_VECTOR(43 downto 0);
          res: out STD_LOGIC_VECTOR(43 downto 0);
          sel: in STD_LOGIC_vector(1 downto 0));
end mux_40_2;

architecture Behavioral of mux_40_2 is

begin

process(i0, i1, i2, i3, sel)
begin
  case sel is
    when "00" => res <= i0;
    when "01" => res <= i1;
    when "10" => res <= i2;
    when others => res <= i0;
end case;
end process;  

end Behavioral;
