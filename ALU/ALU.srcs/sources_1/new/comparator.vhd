----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 20:05:33
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
PORT(carry : IN STD_LOGIC;
		 zero : IN STD_LOGIC;
		 a_31 : IN STD_LOGIC;
		 b_31 : IN STD_LOGIC;
		 diff_31 : IN STD_LOGIC;
		 op : IN STD_LOGIC_VECTOR(2 downto 0);
		 r : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
end comparator;

architecture Behavioral of comparator is
signal result : STD_LOGIC;
begin

  process(a_31,b_31,op,zero,carry,diff_31)
     begin
       if op = "001" then
         if((a_31 ='0')and(b_31 ='1')) then
           result<= '1';
         elsif((a_31=b_31) and diff_31='0') then
            result<= '1';
         else
             result  <='0';   
         end if;    
       elsif op = "010" then
         if((a_31 ='1')and(b_31 ='0')) then
           result<= '1';
         elsif((a_31=b_31) and diff_31='1') then
            result<= '1';
         else
             result  <='0';   
         end if;    
       elsif op = "011" then
          if zero='0' then
            result<= '1';
          else
            result  <='0'; 
          end if;
       elsif op = "100" then
          if zero='0' then
            result<= '0';
          else
            result  <='1'; 
          end if;
       elsif op = "101" then  
          if carry='1' then
            result<= '1';
          else
            result  <='0'; 
          end if;
       elsif op = "110" then  
         if carry='1' then
            result<= '0';
          else
            result  <='1'; 
          end if;
       end if;      
     end process;
r<= "0000000000000000000000000000000" & result;
end Behavioral;
