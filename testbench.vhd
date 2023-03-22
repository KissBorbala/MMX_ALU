----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2022 03:52:47 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    signal x_in, y_in, result_out: std_logic_vector(7 downto 0);
    signal cin_in, cout_out, subtract_in, xor_2, eq: std_logic;
    signal a_in, b_in, res_out: std_logic_vector(63 downto 0);
    signal sel: std_logic_vector(6 downto 0);
    signal sel2: std_logic_vector(1 downto 0);
    signal sa: std_logic_vector(2 downto 0);
    signal m, q: std_logic_vector(15 downto 0);
    signal mul_res: std_logic_vector(31 downto 0);
    
component full_adder_8 is
Port ( 
    x: in std_logic_vector(7 downto 0);
    y: in std_logic_vector(7 downto 0);
    cin: in std_logic;
    cout: out std_logic;
    result: out std_logic_vector(7 downto 0));
end component;   

component adder_subtractor is
Port ( 
        a, b: in STD_LOGIC_VECTOR(63 downto 0);
        result: out STD_LOGIC_VECTOR(63 downto 0);
        subtract: in STD_LOGIC;
        sel: in STD_LOGIC_VECTOR(6 downto 0));
end component;

component xor_8 is
Port ( 
        a: in STD_LOGIC_VECTOR(7 downto 0);
        b: in STD_LOGIC;
        res: out STD_LOGIC_VECTOR( 7 downto 0));
end component;

component comp_eq_8 is
    Port ( a, b: in STD_LOGIC_VECTOR(7 downto 0);
           eq: out STD_LOGIC );
end component;

component comparer is
    Port (
        a, b: in STD_LOGIC_VECTOR(63 downto 0);
        sel: in STD_LOGIC_VECTOR(1 downto 0);
        res: out STD_LOGIC_VECTOR(63 downto 0));
end component;

component shifter is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(6 downto 0));
end component;

component count_and_shift is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          sa: in STD_LOGIC_VECTOR(2 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(6 downto 0));
end component;


component pack_saturated is
    Port (a: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(1 downto 0) );
end component;

component packs is
    Port (a, b: in STD_LOGIC_VECTOR(63 downto 0);
          res: out STD_LOGIC_VECTOR(63 downto 0);
          sel: in STD_LOGIC_VECTOR(1 downto 0) );
end component;

component multiplier is
    Port (
        x, y: in STD_LOGIC_VECTOR(15 downto 0);
        o: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component madd is
    Port (x, y: in STD_LOGIC_VECTOR(63 downto 0);
          o: out STD_LOGIC_VECTOR(63 downto 0));
end component;

begin


--Xorer: xor_8 port map(x_in, xor_2, result_out);
--x_in <= "10100110", "11111111" after 10 ns, "11110000" after 30 ns;
--xor_2 <= '1', '0' after 30 ns;



--Adder_8: full_adder_8 port map(x_in, y_in, cin_in, cout_out, result_out);
--x_in <= "01101101", "11111111" after 10 ns, "00010011" after 20 ns;
--y_in <= "00010011", "10001000" after 10ns, "01110111" after 20 ns;
--cin_in <= '0', '1' after 10ns, '0' after 20ns;



--Add_sub: adder_subtractor port map(a_in, b_in, res_out, subtract_in, sel);
--a_in <= x"FFFFFFFFFFFFFFFC";
--b_in <= x"0000000000000002", x"FFFFFFFFFFFFFFFD" after 10 ns;
--sel <= "0000000", "0101010" after 20 ns, "1111111" after 40 ns;
--subtract_in <= '0',  '1' after 60 ns;



--Comp_eq: comp_eq_8 port map(x_in, y_in, eq);
--x_in <= "11101110", "0000000" after 10 ns, "00000001" after 20 ns, "11111111" after 30 ns;
--y_in <= "11101110", "00000000" after 10 ns, "11110000" after 30 ns;



--Compare: comparer port map (a_in, b_in, sel2, res_out);
--a_in <= x"123456789abcdef0", x"1111222233334444" after 20 ns;
--b_in <= x"123456789abcdef0", x"1111222233934455" after 20 ns;
--sel2 <= "11", "00" after 10 ns, "01" after 20 ns, "10" after 30 ns, "00" after 40ns;



--shift_right: shifter port map (a_in, res_out, sel);
--a_in <= x"213564aaa4132111";
--sel <= "1111111", "1110111" after 10 ns, "1010101" after 20ns, "0000000" after 30ns;

--shift_count: count_and_shift port map (a_in, sa, res_out, sel);
--a_in <= x"213564aaa4132111";
--sel <= "1111111", "1110111" after 100 ns, "1010101" after 200ns, "0000000" after 300ns;
--sa <= "100", "111" after 200 ns;


--pack: pack_saturated port map (a_in, res_out, sel2);
--a_in <= x"001200321254d364", x"00003245d3215498" after 10 ns, x"000010001000000" after 20 ns;
--b_in <= x"a20019d200008132";
--sel2 <= "00", "01" after 10 ns, "10" after 20ns;


--packss: packs port map (a_in, b_in, res_out, sel2);
--a_in <= x"001200321254d364", x"00003245d3215498" after 10 ns, x"000010001000000" after 20 ns;
--b_in <= x"d012101000aa00bb", x"a000000080000000" after 20 ns;
--sel2 <= "00", "01" after 10 ns, "10" after 20ns;

--multiply: multiplier port map(m, q, mul_res);
--m <= x"FFFD";
--q <= x"FFFC", x"0004" after 30 ns;

madd_op: madd port map(a_in, b_in, res_out);
a_in <= x"0001FFFE0003FFFC", x"0000000100010000" after 20 ns;
b_in <= x"0005FFFEFFFDFFFE";

end Behavioral;
