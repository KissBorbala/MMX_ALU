----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2023 11:26:41 PM
-- Design Name: 
-- Module Name: regfile - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
    Port ( ra1 : in STD_LOGIC_VECTOR (4 downto 0);
           ra2 : in STD_LOGIC_VECTOR (4 downto 0);
           rd1 : out STD_LOGIC_VECTOR (63 downto 0);
           rd2 : out STD_LOGIC_VECTOR (63 downto 0);
           clk: in STD_LOGIC);
end regfile;

architecture Behavioral of regfile is

type arr_type is array (0 to 31) of std_logic_vector(63 downto 0);
signal r_name: arr_type := (x"213564aaa4132111", x"4A65B11111116FF3", x"FFFFFFFFFFFFFFFE", x"0000000000000004", x"0000000000000005", x"0000000000000006", x"0000000000000007", others=>x"0000000000000000");

begin

rd1 <= r_name(conv_integer(ra1));
rd2 <= r_name(conv_integer(ra2));

end Behavioral;