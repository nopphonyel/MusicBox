----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:18 11/13/2017 
-- Design Name: 
-- Module Name:    musicBox - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity musicBox is
    Port ( pb1 : in  STD_LOGIC;
           pb2 : in  STD_LOGIC;
           pb3 : in  STD_LOGIC;
           pb4 : in  STD_LOGIC;
           pb5 : in  STD_LOGIC;
           dipsw : in  STD_LOGIC_VECTOR(3 downto 0));
end musicBox;

architecture Behavioral of musicBox is
signal add1 : STD_LOGIC := '0';
signal add5 : STD_LOGIC := '0';
signal add10 : STD_LOGIC := '0';
signal returnChange : STD_LOGIC := '0';
signal test : INTEGER := '0';

signal 
begin 




end Behavioral;



-- STATE = 0 is wait state
signal STATE : INTEGER := 0;
signal test : INTEGER := '0';
signal test2 : INTEGER := '0';

signal 