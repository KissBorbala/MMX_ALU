----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 11:02:37 PM
-- Design Name: 
-- Module Name: or_8 - Behavioral
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

entity or_8 is
     Port (a: in STD_LOGIC_VECTOR(7 downto 0);
           res: out STD_LOGIC );
end or_8;

architecture Behavioral of or_8 is

begin

    res <= a(7) or a(6) or a(5) or a(4) or a(3) or a(2) or a(1) or a(0);
    
end Behavioral;
