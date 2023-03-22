----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2022 12:30:01 AM
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(6 downto 0));
end shifter;

architecture Behavioral of shifter is

component mux_1 is
    Port( a, b, sel: in STD_LOGIC;
          res: out STD_LOGIC);
end component;

component shift_8 is
    Port (a: in STD_LOGIC_VECTOR(7 downto 0);
          res: out STD_LOGIC_VECTOR(7 downto 0);
          value: in STD_LOGIC);
end component;

signal mux: STD_LOGIC_VECTOR(7 downto 0);
signal result: STD_LOGIC_VECTOR(63 downto 0);
begin

    

G_1 : for i in 0 to 6 generate

  m: mux_1 port map (a(i * 8 + 7), a(i * 8 + 8), sel(i), mux(i));

end generate;

mux(7) <= a(63);

G_2 : for i in 0 to 7 generate

  comp: shift_8 port map (a((i * 8 + 7) downto (i * 8)),  res((i * 8 + 7) downto (i * 8)), mux(i));

end generate;

end Behavioral;
