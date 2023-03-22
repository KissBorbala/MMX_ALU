----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2022 12:04:02 AM
-- Design Name: 
-- Module Name: shift_8 - Behavioral
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

entity shift_8 is
    Port (a: in STD_LOGIC_VECTOR(7 downto 0);
          res: out STD_LOGIC_VECTOR(7 downto 0);
          value: in STD_LOGIC);
end shift_8;

architecture Behavioral of shift_8 is
begin

res <= value & a(7 downto 1);

end Behavioral;
