----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 10:56:01 PM
-- Design Name: 
-- Module Name: pack_saturated - Behavioral
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

entity pack_saturated is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(1 downto 0) );
end pack_saturated;

architecture Behavioral of pack_saturated is

component or_64 is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_vector(7 downto 0) );
end component;

component mux_40_2 is
    Port (i0, i1, i2, i3: in STD_LOGIC_VECTOR(43 downto 0);
          res: out STD_LOGIC_VECTOR(43 downto 0);
          sel: in STD_LOGIC_vector(1 downto 0));
end component;

component mux_8_3 is
    Port (i0, i1, i2, i3, i4, i5, i6, i7: in STD_LOGIC_VECTOR(7 downto 0);
          res: out STD_LOGIC_VECTOR(7 downto 0);
          sel: in STD_LOGIC_VECTOR(2 downto 0));
end component;

signal or_res: STD_LOGIC_VECTOR(7 downto 0);
signal i0, i1, i2: STD_LOGIC_VECTOR(11 downto 0);
signal val0, val1, val2: STD_LOGIC_VECTOR(31 downto 0);
signal mux_in0, mux_in1, mux_in2, mux_out: STD_LOGIC_VECTOR(43 downto 0);

begin

o: or_64 port map (a, or_res);

i0(11) <= or_res(1);
i0(8) <= or_res(3);
i0(5) <= or_res(5);
i0(2) <= or_res(7);
i1(11) <= or_res(2) or or_res(3);
i1(8) <= or_res(2) or or_res(3);
i1(5) <= or_res(6) or or_res(7);
i1(2) <= or_res(6) or or_res(7);
i2(11) <= or_res(4) or or_res(5) or or_res(6) or or_res(7);
i2(8) <= or_res(4) or or_res(5) or or_res(6) or or_res(7);
i2(5) <= or_res(4) or or_res(5) or or_res(6) or or_res(7);
i2(2) <= or_res(4) or or_res(5) or or_res(6) or or_res(7);

i0(10) <= a(15);
i0(7) <= a(31);
i0(4) <= a(47);
i0(1) <= a(63);
i1(10) <= a(31);
i1(7) <= a(31);
i1(4) <= a(63);
i1(1) <= a(63);
i2(10) <= a(63);
i2(7) <= a(63);
i2(4) <= a(63);
i2(1) <= a(63);

i0(9) <= '0';
i0(6) <= '0';
i0(3) <= '0';
i0(0) <= '0';
i1(9) <= '1';
i1(6) <= '0';
i1(3) <= '1';
i1(0) <= '0';
i2(9) <= '1';
i2(6) <= '1';
i2(3) <= '1';
i2(0) <= '0';

val0 <= a(7 downto 0) & a(23 downto 16) & a(39 downto 32) & a (55 downto 48);
val1 <= a(7 downto 0)& a(15 downto 8)  & a(39 downto 32) & a (47 downto 40);
val2 <= a(7 downto 0)& a(15 downto 8)  & a(23 downto 16) & a (31 downto 24);

mux_in0 <= i0 & val0;
mux_in1 <= i1 & val1;
mux_in2 <= i2 & val2;

m0: mux_40_2 port map (mux_in0, mux_in1, mux_in2, mux_in0, mux_out, sel);
m1: mux_8_3 port map (mux_out(31 downto 24), mux_out(31 downto 24), mux_out(31 downto 24), mux_out(31 downto 24), "01111111", "11111111", "10000000", "00000000", res(7 downto 0), mux_out(43 downto 41));
m2: mux_8_3 port map (mux_out(23 downto 16), mux_out(23 downto 16), mux_out(23 downto 16), mux_out(23 downto 16), "01111111", "11111111", "10000000", "00000000", res(15 downto 8), mux_out(40 downto 38));
m3: mux_8_3 port map (mux_out(15 downto 8), mux_out(15 downto 8), mux_out(15 downto 8), mux_out(15 downto 8), "01111111", "11111111", "10000000", "00000000", res(23 downto 16), mux_out(37 downto 35));
m4: mux_8_3 port map (mux_out(7 downto 0), mux_out(7 downto 0), mux_out(7 downto 0), mux_out(7 downto 0), "01111111", "11111111", "10000000", "00000000", res(31 downto 24), mux_out(34 downto 32));

end Behavioral;