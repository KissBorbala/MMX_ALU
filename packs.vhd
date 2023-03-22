----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2022 12:30:33 AM
-- Design Name: 
-- Module Name: packs - Behavioral
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

entity packs is
    Port (a, b: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(1 downto 0) );
end packs;

architecture Behavioral of packs is

component pack_saturated is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(1 downto 0) );
end component;

signal res_a, res_b: STD_LOGIC_VECTOR(63 downto 0);

begin


p0: pack_saturated port map(a, res_a, sel);
p1: pack_saturated port map(b, res_b, sel);

res <= res_a(31 downto 0) & res_b(31 downto 0);

end Behavioral;
