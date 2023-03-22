----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 02:33:14 PM
-- Design Name: 
-- Module Name: multiplier - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port (
        x, y: in STD_LOGIC_VECTOR(15 downto 0);
        o: out STD_LOGIC_VECTOR(31 downto 0));
end multiplier;

architecture Behavioral of multiplier is



begin

process(x, y)
variable cnt: STD_LOGIC_VECTOR(4 downto 0);
variable m, q: STD_LOGIC_VECTOR(15 downto 0);
variable a: STD_LOGIC_VECTOR(31 downto 0);
variable sign: STD_LOGIC;

begin
a := x"00000000";
if x(15) = '1' then
    m := not x + 1;
else
    m := x;
end if;
if y(15) = '1' then
    q := not y + 1;
else
    q := y;
end if;

sign := x(15) xor y(15);

cnt := "10000";
while cnt > 0 loop

if q(0) = '1' then
    a := a + m;
end if;
q := a(0) & q(15 downto 1);
a := '0' & a(31 downto 1);
cnt := cnt - 1;

end loop;

if sign = '1' then
    o <= (sign & not a(14 downto 0) & not q) + 1;
else
    o <= sign & a(14 downto 0) & q;
end if;

end process;




end Behavioral;
