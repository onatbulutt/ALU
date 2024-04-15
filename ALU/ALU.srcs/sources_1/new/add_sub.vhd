----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 20:01:56
-- Design Name: 
-- Module Name: add_sub - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_sub is
generic(n : INTEGER);
PORT(sub_mode : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(31 downto 0);
		 b : IN STD_LOGIC_VECTOR(31 downto 0);
		 carry : OUT STD_LOGIC;
		 zero : OUT STD_LOGIC;
		 r : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
end add_sub;

architecture behavioral of add_sub IS
  SIGNAL a_nbr, b_nbr, r_nbr : unsigned(32 DOWNTO 0);
BEGIN
  a_nbr <= unsigned("0"&a);
  b_nbr <= unsigned("0"&b) WHEN sub_mode = '0' ELSE
           unsigned("0"& std_logic_vector(unsigned(not b)+ "00000000000000000000000000000001"));
  r_nbr <= a_nbr + b_nbr;

  carry <= '1' WHEN r_nbr(32) = '1' ELSE
           '0';

  zero <= '1' WHEN r_nbr(31 DOWNTO 0) = to_unsigned(0, 32) ELSE
          '0';

  r <= std_logic_vector(r_nbr(31 DOWNTO 0));
end behavioral;