----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2022 06:05:07 PM
-- Design Name: 
-- Module Name: full_adder_8 - Behavioral
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

entity full_adder_8 is
Port ( 
    x: in std_logic_vector(7 downto 0);
    y: in std_logic_vector(7 downto 0);
    cin: in std_logic;
    cout: out std_logic;
    result: out std_logic_vector(7 downto 0));
end full_adder_8;

architecture Behavioral of full_adder_8 is

component full_adder is Port(
    x: in std_logic;
    y: in std_logic;
    cin: in std_logic;
    s: out std_logic;
    cout: out std_logic);
end component;
    signal carry: std_logic_vector(8 downto 0);
begin

carry(0) <= cin;
   
G_1 : for i in 0 to 7 generate

  Adder: full_adder port map  (x(i), y(i), carry(i), result(i), carry(i + 1));

end generate;

cout <= carry(8);

end Behavioral;
