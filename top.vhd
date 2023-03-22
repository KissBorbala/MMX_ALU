----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2023 11:26:41 PM
-- Design Name: 
-- Module Name: top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end top;

architecture Behavioral of top is

component mpg is
    Port ( btn : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           en : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component packs is
    Port (a, b: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(1 downto 0) );
end component;

component regfile is
    Port ( ra1 : in STD_LOGIC_VECTOR (4 downto 0);
           ra2 : in STD_LOGIC_VECTOR (4 downto 0);
           rd1 : out STD_LOGIC_VECTOR (63 downto 0);
           rd2 : out STD_LOGIC_VECTOR (63 downto 0);
           clk: in STD_LOGIC);
end component;

component comparer is
    Port (
        a, b: in STD_LOGIC_VECTOR(63 downto 0);
        sel: in STD_LOGIC_VECTOR(1 downto 0);
        res: out STD_LOGIC_VECTOR(63 downto 0));
end component;

component adder_subtractor is
Port ( 
        a, b: in STD_LOGIC_VECTOR(63 downto 0);
        result: out STD_LOGIC_VECTOR(63 downto 0);
        subtract: in STD_LOGIC;
        sel: in STD_LOGIC_VECTOR(6 downto 0));
end component;

component count_and_shift is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          sa: in STD_LOGIC_VECTOR(2 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(6 downto 0));
end component;

component madd is
    Port (x, y: in STD_LOGIC_VECTOR(63 downto 0);
          o: out STD_LOGIC_VECTOR(63 downto 0));
end component;

signal addr1, addr2, en: STD_LOGIC_VECTOR(4 downto 0);
signal opcode: STD_LOGIC_VECTOR(2 downto 0);
signal sel: STD_LOGIC_VECTOR(1 downto 0);
signal result0, result1, result2, result3, result4, result5, data1, data2, res: STD_LOGIC_VECTOR(63 downto 0);
signal sub: STD_LOGIC;
signal sel_adder, sel_shifter: STD_LOGIC_VECTOR(6 downto 0);
signal mux_led: STD_LOGIC_VECTOR(15 downto 0);

begin

opcode <= sw(15 downto 13);
sel <= sw(12 downto 11);
addr1 <= sw(9 downto 5);
addr2 <= sw(4 downto 0);

a1: mpg port map(btn, clk, en); 
m0: regfile port map(addr1, addr2, data1, data2, clk);

c0: packs port map(data1, data2, result0, sel);
c1: comparer port map(data1, data2, sel, result1);
c2: adder_subtractor port map(data1, data2, result2, '0', sel_adder);
c3: adder_subtractor port map(data1, data2, result3, '1', sel_adder);
c4: count_and_shift port map(data1, sw(2 downto 0), result4, sel_adder);
c5: madd port map(data1, data2, result5);

process(sw)
begin

case opcode is
    when "000" =>
        res <= result0;
    when "001" =>
        res <= result2;
    when "010" =>
        res <= result3;
    when "011" =>
        res <= result1;
    when "100" =>
        res <= result5;
    when "101" =>
        res <= result4;
    when others =>
        res <= x"FFFFFFFFFFFFFFFF";
end case;
end process;

process(en)
begin
if en(0) = '1' then
    mux_led <= res(15 downto 0);
else if en(1) = '1' then
    mux_led <= res(31 downto 16);
else if en(2) = '1' then
    mux_led <= res(47 downto 32);
else if en(3) = '1' then
    mux_led <= res(63 downto 48);
end if;
end if;
end if;
end if;
end process;

led <= mux_led;

process(sel)
begin
case sel is
    when "00" =>
        sel_adder <= "1111111";
    when "01" =>
        sel_adder <= "0101010";
    when "10" =>
        sel_adder <= "0001000";
    when "11" =>
        sel_adder <= "0000000";
    when others =>                                                                                                                 
        sel_adder <= "0000000";
end case;
end process;

end Behavioral;
