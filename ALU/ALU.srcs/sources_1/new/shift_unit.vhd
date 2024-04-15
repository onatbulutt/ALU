----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 20:06:15
-- Design Name: 
-- Module Name: shift_unit - Behavioral
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
use IEEE.std_logic_arith;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_unit is
generic(n : INTEGER);
PORT(a : IN STD_LOGIC_VECTOR(31 downto 0);
		 b : IN STD_LOGIC_VECTOR(4 downto 0);
		 op : IN STD_LOGIC_VECTOR(2 downto 0);
		 r : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
end shift_unit;

architecture Behavioral of shift_unit is
begin
    process(a, b, op)
        variable b_int    : integer range 0 to 31;
        variable result   : std_logic_vector(31 downto 0);
    begin
        b_int := to_integer(unsigned(b(4 downto 0)));
        case op is
            when "000" =>
                -- A rol B
                result := std_logic_vector(shift_left(unsigned(a), b_int)) 
                           or 
                           std_logic_vector(shift_right(unsigned(a), 32 - b_int));            
            when "001" =>
                -- A ror B
                result := std_logic_vector(shift_right(unsigned(a), b_int)) 
                           or 
                           std_logic_vector(shift_left(unsigned(a), 32 - b_int)); 
            when "010" =>
                -- A sll B
                result := std_logic_vector(shift_left(unsigned(a), b_int));  
            when "011" =>
                -- A srl B
                 result := std_logic_vector(shift_right(unsigned(a), b_int));       
            when "111" =>
                -- A sra B
                 if a(31) = '0' then
                   result := std_logic_vector(shift_right(unsigned(a), b_int));
                 else
                    result := std_logic_vector(shift_right(signed(a), b_int));  
                 end if;   
            when others =>
                -- Default behavior
                result := a;
        end case;
        
        r <= result;
    end process;
end Behavioral;