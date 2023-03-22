----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2023 11:27:41 PM
-- Design Name: 
-- Module Name: mpg - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mpg is
    Port ( btn : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           en : out STD_LOGIC_VECTOR (4 downto 0));
end mpg;

architecture Behavioral of mpg is
signal in1: STD_LOGIC_VECTOR (15 downto 0);
signal q1: STD_LOGIC_VECTOR (4 downto 0);
signal q2: STD_LOGIC_VECTOR (4 downto 0);
signal q3: STD_LOGIC_VECTOR (4 downto 0);

begin

process (clk)
begin
   if clk='1' and clk'event then
      in1 <= in1 + 1;
   end if;
end process;

process(clk)
begin 
    if rising_edge(clk)  then
        if in1 = x"FFFF" then
            q1 <= btn;
        end if;    
    end if;       
 end process;
 
process(clk)
begin 
    if rising_edge(clk)  then
        q2 <= q1;      
    end if;       
 end process; 
 
process(clk)
begin 
    if rising_edge(clk)  then
        q3 <= q2;      
    end if;       
 end process; 
 
en <= q2 and not(q3);

end Behavioral;
