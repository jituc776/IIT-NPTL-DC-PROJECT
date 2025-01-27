library ieee;
use ieee.std_logic_1164.all;
package Gates is
	
	component encoder4x2 is
   port (A: in std_logic_vector(3 downto 0); Y: out std_logic_vector(1 downto 0));
   end component encoder4x2;

	component shifter_1 is
   port (A: in std_logic_vector(7 downto 0); Y: out std_logic_vector(7 downto 0));
	end component shifter_1;
	
	component shifter_2 is
   port (A: in std_logic_vector(7 downto 0); Y: out std_logic_vector(7 downto 0));
	end component shifter_2;
	
	component adder_8 is
	port(
		a,b : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		Cout: out std_logic;
		Y: out std_logic_vector(7 downto 0)
	);
	END component;
	
	component adder_full is
	port(A,B,Cin	: in STD_LOGIC;Y,Cout: OUT STD_LOGIC);
	END component;
	
	component mux2x1_8 is
   port (A: in std_logic_vector(7 downto 0); B: in std_logic_vector(7 downto 0); S: in std_logic; Y: out std_logic_vector(7 downto 0));
	end component mux2x1_8;
	
	component mux2x1 is
   port (A: in std_logic; B: in std_logic; S: in std_logic; Y: out std_logic);
  end component mux2x1;
  
  component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;

  component AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component AND_2;

  component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NAND_2;

  component OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component OR_2;

  component NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NOR_2;

  component XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XOR_2;

  component XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XNOR_2;

  component HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
  end component HALF_ADDER;

end package Gates;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;
entity mux2x1 is
   port (A: in std_logic; B: in std_logic; S: in std_logic; Y: out std_logic);
end entity mux2x1;
architecture logic of mux2x1 is
signal e,f,sbar: std_logic;
begin
	i0: inverter port map(A=>s,y=>sbar);
	i1: and_2 port map(A=>A,B=>Sbar,Y=>e);
	i2: and_2 port map(A=>B,B=>S,Y=>f);
	i3: or_2 port map(A=>e,B=>f,y=>y);
end logic;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;
entity mux2x1_8 is
   port (A: in std_logic_vector(7 downto 0); B: in std_logic_vector(7 downto 0); S: in std_logic; Y: out std_logic_vector(7 downto 0));
end entity mux2x1_8;
architecture logic of mux2x1_8 is
signal e,f: std_logic_vector(7 downto 0);
begin
	i0: mux2x1 port map(A=>A(0),B=>B(0),S=>S,Y=>y(0));
	i1: mux2x1 port map(A=>A(1),B=>B(1),S=>S,Y=>y(1));
	i2: mux2x1 port map(A=>A(2),B=>B(2),S=>S,Y=>y(2));
	i3: mux2x1 port map(A=>A(3),B=>B(3),S=>S,Y=>y(3));
	i4: mux2x1 port map(A=>A(4),B=>B(4),S=>S,Y=>y(4));
	i5: mux2x1 port map(A=>A(5),B=>B(5),S=>S,Y=>y(5));
	i6: mux2x1 port map(A=>A(6),B=>B(6),S=>S,Y=>y(6));
	i7: mux2x1 port map(A=>A(7),B=>B(7),S=>S,Y=>y(7));
end logic;

library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
   port (A: in std_logic; Y: out std_logic);
end entity INVERTER;

architecture Equations of INVERTER is
begin
   Y <= not A;
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity AND_2;

architecture Equations of AND_2 is
begin
   Y <= A and B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NAND_2;

architecture Equations of NAND_2 is
begin
   Y <= not (A and B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity OR_2;

architecture Equations of OR_2 is
begin
   Y <= A or B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NOR_2;

architecture Equations of NOR_2 is
begin
   Y <= not (A or B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XOR_2;

architecture Equations of XOR_2 is
begin
   Y <= A xor B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XNOR_2;

architecture Equations of XNOR_2 is
begin
   Y <= not (A xor B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
end entity HALF_ADDER;

architecture Equations of HALF_ADDER is
begin
   S <= (A xor B);
   C <= (A and B);
end Equations;
 
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;

entity adder_full is
	port(
		A,B,Cin	: in STD_LOGIC;
		Y,Cout: OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE logic of adder_full is
signal e,f,g: std_logic;
begin
inst0: XOR_2 port map(a=>a,b=>b,y=>e);
inst1: AND_2 port map(a=>a,b=>b,y=>f);
inst2: AND_2 port map(a=>e,b=>cin,y=>g);
inst3: XOR_2 port map(a=>e,b=>cin,Y=>y);
inst4: OR_2 port map(a=>g,b=>f,y=>cout);

end architecture;
  
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;

entity adder_8 is
	port(
		a,b : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		Cout: out std_logic;
		Y: out std_logic_vector(7 downto 0)
	);
END ENTITY;

ARCHITECTURE logic of adder_8 is
signal c1,c2,c3,c4,c5,c6,c7: std_logic;
begin

i0: adder_full port map(a=>a(0),b=>b(0),cin=>cin,y=>y(0),cout=>c1);
i1: adder_full port map(a=>a(1),b=>b(1),cin=>c1,y=>y(1),cout=>c2);
i2: adder_full port map(a=>a(2),b=>b(2),cin=>c2,y=>y(2),cout=>c3);
i3: adder_full port map(a=>a(3),b=>b(3),cin=>c3,y=>y(3),cout=>c4);
i4: adder_full port map(a=>a(4),b=>b(4),cin=>c4,y=>y(4),cout=>c5);
i5: adder_full port map(a=>a(5),b=>b(5),cin=>c5,y=>y(5),cout=>c6);
i6: adder_full port map(a=>a(6),b=>b(6),cin=>c6,y=>y(6),cout=>c7);
i7: adder_full port map(a=>a(7),b=>b(7),cin=>c7,y=>y(7),cout=>cout);


end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;

entity shifter_1 is
   port (A: in std_logic_vector(7 downto 0); Y: out std_logic_vector(7 downto 0));
end entity shifter_1;

ARCHITECTURE logic of shifter_1 is
begin
Y(0)<='0';
Y(1)<=A(0);
Y(2)<=A(1);
Y(3)<=A(2);
Y(4)<=A(3);
Y(5)<=A(4);
Y(6)<=A(5);
Y(7)<=A(6);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;

entity shifter_2 is
   port (A: in std_logic_vector(7 downto 0); Y: out std_logic_vector(7 downto 0));
end entity shifter_2;

ARCHITECTURE logic of shifter_2 is
begin
Y(0)<='0';
Y(1)<='0';
Y(2)<=A(0);
Y(3)<=A(1);
Y(4)<=A(2);
Y(5)<=A(3);
Y(6)<=A(4);
Y(7)<=A(5);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;

entity encoder4x2 is
   port (A: in std_logic_vector(3 downto 0); Y: out std_logic_vector(1 downto 0));
end entity encoder4x2;

architecture logic of encoder4x2 is
begin
i1: or_2 port map(a=>a(3),b=>a(1),y=>y(0));
i2: or_2 port map(a=>a(3),b=>a(2),y=>y(1));
end architecture;

