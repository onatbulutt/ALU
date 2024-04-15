----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 20:04:21
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
generic(n : INTEGER);
PORT(i0 : IN STD_LOGIC_VECTOR(n-1 downto 0);
		 i1 : IN STD_LOGIC_VECTOR(n-1 downto 0);
		 i2 : IN STD_LOGIC_VECTOR(n-1 downto 0);
		 i3 : IN STD_LOGIC_VECTOR(n-1 downto 0);
		 sel : IN STD_LOGIC_VECTOR(1 downto 0);
		 o : OUT STD_LOGIC_VECTOR(n-1 downto 0)
	);
end multiplexer;

architecture Behavioral of multiplexer is

begin
  process(sel, i0, i1, i2, i3)
    begin
        case sel is
            when "00" =>
                o <= i0;
            when "01" =>
                o <= i1;
            when "10" =>
                o <= i2;
            when others =>
                o <= i3;
        end case;
    end process;

end Behavioral;
