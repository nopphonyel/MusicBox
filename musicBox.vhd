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
USE ieee.std_logic_unsigned.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use work.seg7_pack.all;

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
			  clk : in  STD_LOGIC;
           dipsw : in  STD_LOGIC_VECTOR(3 downto 0);
			  digit_disp : out  STD_LOGIC_VECTOR(3 downto 0);
			  seg7_disp : out  STD_LOGIC_VECTOR(7 downto 0)
			);
end musicBox;

architecture Behavioral of musicBox is
type counterPack is array(3 downto 0) of STD_LOGIC_VECTOR(3 downto 0);
signal counterCode : counterPack := ("0000","0000","0000","0000");
signal counterTime : counterPack := ("0000","0000","0000","0000");
signal disp_scan_clk : STD_LOGIC := '0';
signal sel_disp_sig : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal another_counter : INTEGER := 0;
signal conv_clk : STD_LOGIC := '0';
signal mode : INTEGER := 0;
signal delayMode : INTEGER := 0;
signal add1 : STD_LOGIC := '0';
signal add5 : STD_LOGIC := '0';
signal add10 : STD_LOGIC := '0';
signal returnChange : STD_LOGIC := '0';

-- STATE = 0 is wait state
signal STATE : INTEGER := 0;

begin 

delay_scan_think : process(clk)
	begin
		if clk'event and clk='1' then
			another_counter <= another_counter + 1;
			if (another_counter+1) = 6250 then
				disp_scan_clk <= clk;
			elsif another_counter = 6250 then
				another_counter <= 0;
				disp_scan_clk <= not disp_scan_clk;
			end if;
	end if;
end process;

scan_think : process(disp_scan_clk)
	begin
	if disp_scan_clk'event and disp_scan_clk = '1' then
		sel_disp_sig <= sel_disp_sig + 1;
		case sel_disp_sig is
			when "00" =>
				if mode = 0 then
				seg7_disp <= display7SegDot(counterTime(0));
				else
				seg7_disp <= display7Seg(counterCode(0));
				end if;
			when "01" =>
				if mode = 0 then
				seg7_disp <= display7SegDot(counterTime(1));
				else
				seg7_disp <= display7Seg(counterCode(1));
				end if;
			when "10" =>
				if mode = 0 then
				seg7_disp <= display7SegDot(counterTime(2));
				else
				seg7_disp <= display7Seg(counterCode(2));
				end if;
			when "11" =>
				if mode = 0 then
				seg7_disp <= display7SegDot(counterTime(3));
				else
				seg7_disp <= display7Seg(counterCode(3));
				end if;
			when others =>
				if mode = 0 then
				seg7_disp <= display7SegDot(counterTime(0));
				else
				seg7_disp <= display7Seg(counterCode(0));
				end if;
		end case;
		digit_disp <= sel_disp(sel_disp_sig);
	end if;
end process;

count_think : process(conv_clk)
begin
--counterTime
if conv_clk'event and conv_clk = '1' then
	delayMode <= delayMode + 1;
   counterTime(0) <= counterTime(0) + 1;
    if counterTime(0) >= "1001" then
        counterTime(0) <= "0000";
        counterTime(1) <= counterTime(1) + 1;
			if counterTime(1) >= "0001" then
				counterTime(1) <= "0000";
				
				--change music: counterCode
				mode <= 1;
				counterCode(0) <= counterCode(0) + 1;
				if delayMode = 12500000 then
					mode <= 0;
				end if;
				if counterCode(0) >= "1001" then
						counterCode(0) <= "0000";
						counterCode(1) <= counterCode(1) + 1;
						if counterCode(1) >= "1001"then
								counterCode(1) <= "0000";
								counterCode(2) <= counterCode(2) + 1;
								if counterCode(2) >= "1001" then
										counterCode(2) <= "0000";
										counterCode(3) <= counterCode(3) + 1;
										if counterCode(3) >= "1001" then
												counterCode(3) <= "0000";
										end if;
								end if;
						end if;
				end if;
				--end change music	
			end if;
    end if;     
end if;
end process;

end Behavioral;