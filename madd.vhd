----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2023 03:39:47 PM
-- Design Name: 
-- Module Name: madd - Behavioral
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

entity madd is
    Port (x, y: in STD_LOGIC_VECTOR(63 downto 0);
          o: out STD_LOGIC_VECTOR(63 downto 0));
end madd;

architecture Behavioral of madd is

component multiplier is
    Port (
        x, y: in STD_LOGIC_VECTOR(15 downto 0);
        o: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component adder_subtractor is
Port ( 
        a, b: in STD_LOGIC_VECTOR(63 downto 0);
        result: out STD_LOGIC_VECTOR(63 downto 0);
        subtract: in STD_LOGIC;
        sel: in STD_LOGIC_VECTOR(6 downto 0));
end component;

signal a, b: STD_LOGIC_VECTOR(63 downto 0);
begin

m0: multiplier port map(x(15 downto 0), y(15 downto 0), a(31 downto 0));
m1: multiplier port map(x(31 downto 16), y(31 downto 16), b(31 downto 0));
m2: multiplier port map(x(47 downto 32), y(47 downto 32), a(63 downto 32));
m3: multiplier port map(x(63 downto 48), y(63 downto 48), b(63 downto 32));

add_s: adder_subtractor port map(a, b, o, '0', "0001000");


end Behavioral;
