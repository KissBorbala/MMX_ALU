----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2022 04:02:17 PM
-- Design Name: 
-- Module Name: adder_subtractor - Behavioral
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

entity adder_subtractor is
Port ( 
        a, b: in STD_LOGIC_VECTOR(63 downto 0);
        result: out STD_LOGIC_VECTOR(63 downto 0);
        subtract: in STD_LOGIC;
        sel: in STD_LOGIC_VECTOR(6 downto 0));
end adder_subtractor;

architecture Behavioral of adder_subtractor is

component full_adder_8 is
Port ( 
    x: in std_logic_vector(7 downto 0);
    y: in std_logic_vector(7 downto 0);
    cin: in std_logic;
    cout: out std_logic;
    result: out std_logic_vector(7 downto 0));
end component;

component mux_1 is
    Port( a, b, sel: in STD_LOGIC;
          res: out STD_LOGIC);
end component;

component xor_8 is
Port ( 
        a: in STD_LOGIC_VECTOR(7 downto 0);
        b: in STD_LOGIC;
        res: out STD_LOGIC_VECTOR( 7 downto 0));
end component;

signal carry: std_logic_vector(8 downto 0);
signal carry_out: std_logic_vector(7 downto 0);
signal xored: std_logic_vector(63 downto 0);
signal sel_extended: std_logic_vector(7 downto 0);

begin
carry(0) <= subtract;
sel_extended <= '0' & sel;
    
G_1 : for i in 0 to 7 generate

  Xorer: xor_8 port map(b((i * 8 + 7) downto (i * 8)), subtract, xored((i * 8 + 7) downto (i * 8)));
  Adder: full_adder_8 port map  (a((i * 8 + 7) downto (i * 8)), xored((i * 8 + 7) downto (i * 8)), carry(i), carry_out(i), result((i * 8 + 7) downto (i * 8)));
  Mux: mux_1 port map (carry_out(i), subtract, sel_extended(i), carry(i+1));

end generate;

end Behavioral;
