----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 11:24:23 PM
-- Design Name: 
-- Module Name: or_64 - Behavioral
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

entity or_64 is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_vector(7 downto 0) );
end or_64;

architecture Behavioral of or_64 is

component or_8 is
     Port (a: in STD_LOGIC_VECTOR(7 downto 0);
           res: out STD_LOGIC );
end component;

begin

G_1 : for i in 0 to 7 generate

  comp: or_8 port map (a((i * 8 + 7) downto (i * 8)), res(i));

end generate;

end Behavioral;
