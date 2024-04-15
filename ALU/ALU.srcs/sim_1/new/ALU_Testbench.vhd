----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 20:08:23
-- Design Name: 
-- Module Name: ALU_Testbench - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Testbench is
end entity ALU_Testbench;

architecture tb_arch of ALU_Testbench is
    -- Component declaration
    component ALU
        generic (
            n : integer := 32
        );
        port (
            a   : in  std_logic_vector(31 downto 0);
            b   : in  std_logic_vector(31 downto 0);
            op  : in  std_logic_vector(5 downto 0);
            s   : out std_logic_vector(31 downto 0)
        );
    end component ALU;

    -- Testbench signals
    signal a_tb     : std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
    signal b_tb     : std_logic_vector(31 downto 0) := "00000000000000000000000000000010";
    signal op_tb    : std_logic_vector(5 downto 0)  := "000000";
    signal s_tb     : std_logic_vector(31 downto 0);

begin

    -- Instantiate the ALU module
    uut: ALU
    generic map (
        n => 32  -- If different bit width is desired, change it here
    )
    port map (
        a  => a_tb,
        b  => b_tb,
        op => op_tb,
        s  => s_tb
    );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1: Add operation
        a_tb <= "00000000000000000000000000000001";
        b_tb <= "00000000000000000000000000000010";
        op_tb <= "000000";
        wait for 50 ns;
        
        -- Test case 2: Sub Operation
        a_tb <= "10000000000000000000000000000101";
        b_tb <= "10000000000000000000000000000011";
        op_tb <= "001000";
        wait for 50 ns;
        
        -- Test case 3: greater and equal Operation(signed)
        a_tb <= "00000000000000000000000000010000";
        b_tb <= "10000000000000000001000000010000";
        op_tb <= "011001";
        wait for 50 ns;
        
         -- Test case 4: less than Operation(signed)
        a_tb <= "00000100000000000000000000010000";
        b_tb <= "10100000000100000000000000000000";
        op_tb <= "011010";
        wait for 50 ns;
        
          -- Test case 5: not equal Operation
        a_tb <= "00000000000000000000000000000001";
        b_tb <= "00000000000000000100000000000001";
        op_tb <= "011011";
        wait for 50 ns;
        
        -- Test case 6: equal Operation
        a_tb <= "00000000000000000000000000000001";
        b_tb <= "00000000000000000000000000000001";
        op_tb <= "011100";
        wait for 50 ns;
        
        -- Test case 7: greater and equal Operation(unsigned)
        a_tb <= "00000100000000000000000000010000";
        b_tb <= "00000000000100000000000000000000";
        op_tb <= "011101";
        wait for 50 ns;
        
        -- Test case 8: less than Operation(unsigned)
        a_tb <= "00000100000000000000000000010000";
        b_tb <= "00100000000100000000000000000000";
        op_tb <= "011110";
        wait for 50 ns;
        
        -- Test case 9: Nor Operation
        a_tb <= "00000000000000000000000000000101";
        b_tb <= "00000000000000000000000000000011";
        op_tb <= "100000";
        wait for 50 ns;
        
        -- Test case 10: And Operation
        a_tb <= "00000000000000000000000000000101";
        b_tb <= "00000000000000000000000000000011";
        op_tb <= "100001";
        wait for 50 ns;
        
        -- Test case 11: Or Operation
        a_tb <= "00000000000000000000000000000101";
        b_tb <= "00000000000000000000000000000011";
        op_tb <= "100010";
        wait for 50 ns;
        
         -- Test case 12: xOr Operation
        a_tb <= "00000000000000000000000000000101";
        b_tb <= "00000000000000000000000000000011";
        op_tb <= "100011";
        wait for 50 ns;
       
       -- Test case 13: rol Operation
        a_tb <= "10000000000000000000000000000101";
        b_tb <= "00000000000000000000000000000001";
        op_tb <= "110000";
        wait for 50 ns;
       
       -- Test case 14: ror Operation
        a_tb <= "10000000000000000000000000000101";
        b_tb <= "00000000000000000000000000000001";
        op_tb <= "110001";
        wait for 50 ns;
       
       -- Test case 15: sll Operation
        a_tb <= "11110000000000000000000000000001";
        b_tb <= "00000000000000000000000000000011";
        op_tb <= "110010";
        wait for 50 ns;
       
       -- Test case 16: srl Operation
        a_tb <= "11110000000000000000000000000001";
        b_tb <= "00000000000000000000000000000011";
        op_tb <= "110011";
        wait for 50 ns;
             
        -- Test case 17: sra Operation
        a_tb <= "11110000000000000000000000000001";
        b_tb <= "00000000000000000000000000000011";
        op_tb <= "111111";
        wait for 50 ns;
        
        wait;
    end process;

end architecture tb_arch;
