--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package seg7_pack is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

constant C : std_logic_vector (7 downto 0) := "10011100";
constant o : std_logic_vector (7 downto 0) := "00111010";
constant i : std_logic_vector (7 downto 0) := "00100000";
constant n : std_logic_vector (7 downto 0) := "00101011";

constant zero_seg : std_logic_vector (7 downto 0) := "11111100";
constant one_seg : std_logic_vector (7 downto 0) := "01100000";
constant two_seg : std_logic_vector (7 downto 0) := "11011010";
constant three_seg : std_logic_vector (7 downto 0) := "11110010";
constant four_seg : std_logic_vector (7 downto 0) := "01100110";
constant five_seg : std_logic_vector (7 downto 0) := "10110110";
constant six_seg : std_logic_vector (7 downto 0) := "10111110";
constant seven_seg : std_logic_vector (7 downto 0) := "11100000";
constant eight_seg : std_logic_vector (7 downto 0) := "11111110";
constant nine_seg : std_logic_vector (7 downto 0) := "11110110";
constant dash_seg : std_logic_vector (7 downto 0) := "00000010";

constant dot_seg : std_logic_vector (7 downto 0) := "00000001";
constant zero_dot_seg : std_logic_vector (7 downto 0) := "11111101";
constant one_dot_seg : std_logic_vector (7 downto 0) := "01100001";
constant two_dot_seg : std_logic_vector (7 downto 0) := "11011011";
constant three_dot_seg : std_logic_vector (7 downto 0) := "11110011";
constant four_dot_seg : std_logic_vector (7 downto 0) := "01100111";
constant five_dot_seg : std_logic_vector (7 downto 0) := "10110111";
constant six_dot_seg : std_logic_vector (7 downto 0) := "10111111";
constant seven_dot_seg : std_logic_vector (7 downto 0) := "11100001";
constant eight_dot_seg : std_logic_vector (7 downto 0) := "11111111";
constant nine_dot_seg : std_logic_vector (7 downto 0) := "11110111";

function displayCoin (signal digit : IN STD_LOGIC_VECTOR(1 downto 0)) return STD_LOGIC_VECTOR;
function display7SegDot (signal value : IN INTEGER) return STD_LOGIC_VECTOR;
function display7Seg (signal value : IN INTEGER) return STD_LOGIC_VECTOR;
function sel_disp (signal selector : in std_logic_vector (1 downto 0)) return std_logic_vector;

end seg7_pack;
 
package body seg7_pack is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;

--For Coin
function displayCoin (signal digit : IN STD_LOGIC_VECTOR(1 downto 0)) return STD_LOGIC_VECTOR is
begin
	case digit is
		when "11" => return C;
		when "10" => return o;
		when "01" => return i;
		when "00" => return n;
		when others => return dash_seg;
	end case;
end displayCoin;

--For Dot
function display7SegDot (signal value : IN INTEGER) return STD_LOGIC_VECTOR is
begin
	case value is
		when 0 => return zero_dot_seg;
		when 1 => return one_dot_seg;
		when 2 => return two_dot_seg;
		when 3 => return three_dot_seg;
		when 4 => return four_dot_seg;
		when 5 => return five_dot_seg;
		when 6 => return six_dot_seg;
		when 7 => return seven_dot_seg;
		when 8 => return eight_dot_seg;
		when 9 => return nine_dot_seg;
		when others => return dot_seg;
	end case;
end display7SegDot;

--For No Dot
function display7Seg (signal value : IN INTEGER) return STD_LOGIC_VECTOR is
begin
	case value is
		when 0 => return zero_seg;
		when 1 => return one_seg;
		when 2 => return two_seg;
		when 3 => return three_seg;
		when 4 => return four_seg;
		when 5 => return five_seg;
		when 6 => return six_seg;
		when 7 => return seven_seg;
		when 8 => return eight_seg;
		when 9 => return nine_seg;
		when others => return dash_seg;
	end case;
end disPlay7seg;

function sel_disp (signal selector : in std_logic_vector (1 downto 0)) return std_logic_vector is
	begin
		case selector is
			when "00" =>
				return "1110";
			when "01" =>
				return "1101";
			when "10" =>
				return "1011";
			when "11" =>
				return "0111";
			when others =>
				return "1110";
		end case;
end sel_disp;

 
end seg7_pack;
