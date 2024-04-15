----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 20:05:54
-- Design Name: 
-- Module Name: logic_unit - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logic_unit is
PORT(a : IN STD_LOGIC_VECTOR(31 downto 0);
		 b : IN STD_LOGIC_VECTOR(31 downto 0);
		 op : IN STD_LOGIC_VECTOR(1 downto 0);
		 r : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
end logic_unit;

architecture Behavioral of logic_unit is

begin
process(a, b, op)
    begin
        case op is
            when "00" => r <= a nor b;  -- nor
            when "01" => r <= a and b;   -- and
            when "10" => r <= a or b;  -- or
            when "11" => r <= a xor b;    -- xor
            when others => r <= (others => '0');
        end case;
    end process;

end Behavioral;
