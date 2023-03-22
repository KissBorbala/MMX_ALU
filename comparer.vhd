----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2022 03:07:37 PM
-- Design Name: 
-- Module Name: comparer - Behavioral
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

entity comparer is
    Port (
        a, b: in STD_LOGIC_VECTOR(63 downto 0);
        sel: in STD_LOGIC_VECTOR(1 downto 0);
        res: out STD_LOGIC_VECTOR(63 downto 0));
end comparer;

architecture Behavioral of comparer is

component comp_eq_8 is
    Port ( a, b: in STD_LOGIC_VECTOR(7 downto 0);
           eq: out STD_LOGIC );
end component;

component mux_1x4 is
    Port( a, b, c, d: in STD_LOGIC;
          sel: in STD_LOGIC_VECTOR(1 downto 0);
          res: out STD_LOGIC);
end component;

component ext_8 is
    Port ( 
    a: in STD_LOGIC;
    ext: out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal equal, mux_res: STD_LOGIC_VECTOR(7 downto 0);
signal zero_three, four_sev, zero_sev: STD_LOGIC;
signal and0, and1, and2, and3: STD_LOGIC;


begin

G_1 : for i in 0 to 7 generate

  comp: comp_eq_8 port map (a((i * 8 + 7) downto (i * 8)), b((i * 8 + 7) downto (i * 8)), equal(i));

end generate;
zero_three <= equal(0) and equal(1) and equal(2) and equal(3);
four_sev <= equal(4) and equal(5) and equal(6) and equal(7);
zero_sev <= equal(0) and equal(1) and equal(2) and equal(3) and equal(4) and equal(5) and equal(6) and equal(7);
and0 <= equal(0) and equal(1);
and1 <= equal(2) and equal(3);
and2 <= equal(4) and equal(5);
and3 <= equal(6) and equal(7);


m0: mux_1x4 port map (equal(0), and0, zero_three, zero_sev, sel, mux_res(0));
m1: mux_1x4 port map (equal(1), and0, zero_three, zero_sev, sel, mux_res(1));
m2: mux_1x4 port map (equal(2), and1, zero_three, zero_sev, sel, mux_res(2));
m3: mux_1x4 port map (equal(3), and1, zero_three, zero_sev, sel, mux_res(3));
m4: mux_1x4 port map (equal(4), and2, four_sev, zero_sev, sel, mux_res(4));
m5: mux_1x4 port map (equal(5), and2, four_sev, zero_sev, sel, mux_res(5));
m6: mux_1x4 port map (equal(6), and3, four_sev, zero_sev, sel, mux_res(6));
m7: mux_1x4 port map (equal(7), and3, four_sev, zero_sev, sel, mux_res(7));

e0: ext_8 port map(mux_res(0), res(7 downto 0));
e1: ext_8 port map(mux_res(1), res(15 downto 8));
e2: ext_8 port map(mux_res(2), res(23 downto 16));
e3: ext_8 port map(mux_res(3), res(31 downto 24));
e4: ext_8 port map(mux_res(4), res(39 downto 32));
e5: ext_8 port map(mux_res(5), res(47 downto 40));
e6: ext_8 port map(mux_res(6), res(55 downto 48));
e7: ext_8 port map(mux_res(7), res(63 downto 56));



end Behavioral;
