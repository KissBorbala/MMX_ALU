----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2022 02:33:40 PM
-- Design Name: 
-- Module Name: comp_eq_8 - Behavioral
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

entity comp_eq_8 is
    Port ( a, b: in STD_LOGIC_VECTOR(7 downto 0);
           eq: out STD_LOGIC );
end comp_eq_8;

architecture Behavioral of comp_eq_8 is

signal temp: STD_LOGIC_VECTOR (7 downto 0);

begin

temp <= a xnor b;
eq <= temp(0) and temp(1) and temp(2) and temp(3) and temp(4) and temp(5) and temp(6) and temp(7);

end Behavioral;
