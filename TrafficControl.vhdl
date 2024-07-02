library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.gates.all;

entity trafficcontroller is
	port(
		clk: in std_logic;
		rst: in std_logic;
		y: out std_logic_vector(7 downto 0)
	);
end entity;

architecture logic of trafficcontroller is
signal n,e,s,w : std_logic_vector(2 downto 0);
begin
	process(clk,rst)
	variable tmp : integer range 0 to 50e6 := 0;
	variable count : integer range 0 to 24 := 0;
	begin
	
		if rst = '1' then
			count := 0;
		elsif rising_edge(clk) then
			tmp := tmp+1;
--			if tmp = 50e6 then
				count := count+1;
--				tmp := 0;
--			else 
--				count := count;
--				tmp := tmp;
--			end if;
		else
			count := count;
			tmp := tmp;
		end if;
		count := count mod 24;
		
		if count < 5 then
-- 		y<="01111111";
			n<="001";
			e<="100";
			s<="100";
			w<="100";
		elsif count=5 then
--			y<="10101111";
			n<="010";
			e<="010";
			s<="100";
			w<="100";
		elsif count > 5 and count <11 then
--			y<="11011111";
			n<="100";
			e<="001";
			s<="100";
			w<="100";
		elsif count=11 then
--			y<="11101011";
			n<="100";
			e<="010";
			s<="010";
			w<="100";
		elsif count > 11 and count < 17 then
--			y<="11110111";
			n<="100";
			e<="100";
			s<="001";
			w<="100";
		elsif count=17 then
--			y<="11111010";
			n<="100";
			e<="100";
			s<="010";
			w<="010";
		elsif count > 17 and count < 23 then
--			y<="11111101";
			n<="100";
			e<="100";
			s<="100";
			w<="001";
		else 
-- 		y<="10111110";
			n<="010";
			e<="100";
			s<="100";
			w<="010";
		end if;
	end process;
	
		north: encoder4x2 port map(a(3 downto 1)=>n,a(0)=>'0',y=>y(1 downto 0));
		east: encoder4x2 port map(a(3 downto 1)=>e,a(0)=>'0',y=>y(3 downto 2));
		south: encoder4x2 port map(a(3 downto 1)=>s,a(0)=>'0',y=>y(5 downto 4));
		west: encoder4x2 port map(a(3 downto 1)=>w,a(0)=>'0',y=>y(7 downto 6));
		
end architecture;