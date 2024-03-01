----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 07:44:51 PM
-- Design Name: 
-- Module Name: alu_tester_tb - Behavioral
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

entity ripple_adder_tb is
 -- Port ( );
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is
    signal tb_A,tb_B : std_logic_vector(3 downto 0):= (others=>'0');
    signal tb_sum : std_logic_vector(3 downto 0):= (others=>'0'); 
    signal tb_carry : std_logic; 
    component ripple_adder is
        Port (
            A,B:in std_logic_vector(3 downto 0);
            C0 : in std_logic;
            C4 : out std_logic;
            S : out std_logic_vector(3 downto 0)
        );
    end component;


begin

    
    A_gen: process
    begin

        wait for 4 ns;
        tb_A <= std_logic_vector (unsigned(tb_A)+1);

    end process A_gen;

    B_gen: process
    begin

        wait for 8 ns;
        tb_B <= std_logic_vector (unsigned(tb_B)+1);

    end process B_gen;
    
    adder: ripple_adder
        port map(
            A=>tb_A,
            B=> tb_B,
            C4=>tb_carry,
            C0=>'0',
            S=>tb_sum     
            );

end Behavioral;
