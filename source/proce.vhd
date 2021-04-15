library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity proccessor is
	port(data1:in std_logic_vector(7 downto 0);
	data2:in std_logic_vector(7 downto 0) ;
	opcode:in std_logic_vector(3 downto 0)	;
	result:out std_logic_vector(7 downto 0); 
	flags: out std_logic_vector(4 downto 0));
end proccessor;
architecture proccess of proccessor is
	component decoder is
		port (A: in std_logic_vector(3 downto 0);X:out std_logic_vector (0 to 9));
	end component;
	component and_gate is	 --and component
		port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
	end component;
	component or_gate is	--or component
		port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
	end component;
	component xor_gate is	--xor component
		port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
	end component;
	component NOT_gate is	--not component
		port (a : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
	end component;
	component Toplayici is --toplayýcý
		port(a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		elde_giris : in std_logic;
		toplam : out std_logic_vector(7 downto 0);
		elde_cikis:out std_logic_vector(4 downto 0)); 
	end component;
	component Cikarici is --cikarici
		port(a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		elde_giris : in std_logic;
		toplam : out std_logic_vector(7 downto 0);
		elde_cikis:out std_logic_vector(4 downto 0));
	end component;
	component Carpma is--carpma
		port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		carpim : out std_logic_vector(15 downto 0));
	end component;
	
	signal dec:std_logic_vector(3 downto 0);  --signal for decoder
	signal cozuldu:std_logic_vector(0 to 9);
	signal elde:std_logic ;	 --first input of the toplayici and cikarici
	
	signal sonuc2:std_logic_vector (7 downto 0); --and gate
	signal sonuc3:std_logic_vector (7 downto 0); --or gate
	signal sonuc4:std_logic_vector (7 downto 0); --xor gate
	signal sonuc5:std_logic_vector (7 downto 0); --not gate
	signal sonuc6:std_logic_vector (7 downto 0); --toplayici
	signal sonuc7:std_logic_vector (7 downto 0); --cikarici
	signal sonuc8:std_logic_vector (15 downto 0); --carpma
	signal flags1:std_logic_vector (4 downto 0) ;
	signal flags2:std_logic_vector (4 downto 0) ;
	
	signal general_solution:std_logic_vector(7 downto 0) ;

begin  
	P1:decoder port map(dec,cozuldu); 
	P2:AND_Gate port map(data1,data2,sonuc2);
	P3:OR_Gate port map(data1,data2,sonuc3);
	P4:XOR_Gate port map(data1,data2,sonuc4);
	P5:NOT_Gate port map(data1,sonuc5);
	P6:Toplayici port map(data1,data2,elde,sonuc6,flags1);
	P7:Cikarici port map (data1,data2,elde,sonuc7,flags2) ;	
	P8:Carpma port map(data1,data2,sonuc8);
	general_solution(0)<=(sonuc2(0) and cozuldu(3)) or (sonuc3(0) and cozuldu(4)) or (sonuc4(0) and cozuldu(5))or (sonuc5(0)and cozuldu(6))or (sonuc6(0) and cozuldu(0))or (sonuc7(0) and cozuldu(1));
	general_solution(1)<=(sonuc2(1) and cozuldu(3)) or (sonuc3(1) and cozuldu(4)) or (sonuc4(1) and cozuldu(5))or (sonuc5(1)and cozuldu(6))or (sonuc6(1) and cozuldu(0))or (sonuc7(1) and cozuldu(1));
	general_solution(2)<=(sonuc2(2) and cozuldu(3)) or (sonuc3(2) and cozuldu(4)) or (sonuc4(2) and cozuldu(5))or (sonuc5(2)and cozuldu(6))or (sonuc6(2) and cozuldu(0))or (sonuc7(2) and cozuldu(1));
	general_solution(3)<=(sonuc2(3) and cozuldu(3)) or (sonuc3(3) and cozuldu(4)) or (sonuc4(3) and cozuldu(5))or (sonuc5(3)and cozuldu(6))or (sonuc6(3) and cozuldu(0))or (sonuc7(3) and cozuldu(1));
	general_solution(4)<=(sonuc2(4) and cozuldu(3)) or (sonuc3(4) and cozuldu(4)) or (sonuc4(4) and cozuldu(5))or (sonuc5(4)and cozuldu(6))or (sonuc6(4) and cozuldu(0))or (sonuc7(4) and cozuldu(1));
	general_solution(5)<=(sonuc2(5) and cozuldu(3)) or (sonuc3(5) and cozuldu(4)) or (sonuc4(5) and cozuldu(5))or (sonuc5(5)and cozuldu(6))or (sonuc6(5) and cozuldu(0))or (sonuc7(5) and cozuldu(1));
	general_solution(6)<=(sonuc2(6) and cozuldu(3)) or (sonuc3(6) and cozuldu(4)) or (sonuc4(6) and cozuldu(5))or (sonuc5(6)and cozuldu(6))or (sonuc6(6) and cozuldu(0))or (sonuc7(6) and cozuldu(1));
	general_solution(7)<=(sonuc2(7) and cozuldu(3)) or (sonuc3(7) and cozuldu(4)) or (sonuc4(7) and cozuldu(5))or (sonuc5(7)and cozuldu(6))or (sonuc6(7) and cozuldu(0))or (sonuc7(7) and cozuldu(1));
	
	
end proccess;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder is
port (A: in std_logic_vector(3 downto 0);X:out std_logic_vector (0 to 9));
end decoder;
architecture decode of decoder is
begin
	X(0)<=not A(3) and not A(2) and not A(1) and not A(0);
	X(1)<=not A(3) and not A(2) and not A(1) and A(0);
	X(2)<=not A(3) and not A(2) and A(1) and not A(0);
	X(3)<=not A(3) and not A(2) and A(1) and A(0);
	X(4)<=not A(3) and A(2) and not A(1) and not A(0);
	X(5)<=not A(3) and A(2) and not A(1) and A(0);
	X(6)<=not A(3) and A(2) and A(1) and not A(0);
	X(7)<=not A(3) and A(2) and A(1) and A(0);
	X(8)<=A(3) and not A(2) and not A(1) and not A(0);
	X(9)<=A(3) and not A(2) and not A(1) and A(0);	 
	
end decode;	 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity AND_Gate is
	port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
end entity AND_Gate;
Architecture dataflow of AND_Gate is
begin
	
	sonuc<=a and b;
	
end dataflow;		

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity OR_Gate is
	port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
end entity OR_Gate;
Architecture dataflow of OR_Gate is
begin
	
	sonuc<=a or b;
	
end dataflow;	

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity XOR_Gate is
	port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
end entity XOR_Gate;
Architecture dataflow of XOR_Gate is
begin
	
	sonuc<=(not a and b)or (a and not b) ;
	
end dataflow;		

 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity NOT_Gate is
	port (a : in std_logic_vector(7 downto 0);
		sonuc: out std_logic_vector(7 downto 0));
end entity NOT_Gate;
Architecture dataflow of NOT_Gate is
begin
	
	sonuc<=not a  ;
	
end dataflow;	


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity Toplayici is
port(a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector(7 downto 0);
	elde_giris : in std_logic;
	toplam : out std_logic_vector(7 downto 0);
	elde_cikis:out std_logic_vector(4 downto 0)); 
	
	
end Toplayici;
architecture dataflow of Toplayici is
signal elde:std_logic_vector(7 downto 0);
begin
	
	
	toplam(0) <= a(0) xor b(0) xor elde_giris;
	elde(0) <= (a(0) and b(0)) or (a(0) and elde_giris) or (b(0) and elde_giris);
	
	toplam(1) <= a(1) xor b(1) xor elde(0);
	elde(1) <= (a(1) and b(1)) or (a(1) and elde_giris) or (b(1) and elde_giris);  
	
	
	toplam(2) <= a(2) xor b(2) xor elde(1);
	elde(2)<= (a(2) and b(2)) or (a(2) and elde_giris) or (b(2) and elde_giris);
	
	
	toplam(3) <= a(3) xor b(3) xor elde(2);
	elde(3) <= (a(3) and b(3)) or (a(3) and elde_giris) or (b(3) and elde_giris);
	
	
	toplam(4) <= a(4) xor b(4) xor elde(3);
	elde(4) <= (a(4) and b(4)) or (a(4) and elde_giris) or (b(4) and elde_giris);
	
	
	toplam(5) <= a(5) xor b(5) xor elde(4);
	elde(5) <= (a(5) and b(5)) or (a(5) and elde_giris) or (b(5) and elde_giris);

																 
	toplam(6) <= a(6) xor b(6) xor elde(5);
	elde(6)<= (a(6) and b(6)) or (a(6) and elde_giris) or (b(6) and elde_giris);
	
	
	toplam(7) <= a(7) xor b(7) xor elde(6);
	elde(7) <= (a(7) and b(7)) or (a(7) and elde_giris) or (b(7) and elde_giris);  
	
	elde_cikis(2)<=elde(7);
	
end architecture dataflow;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity Cikarici is
port(a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector(7 downto 0);
	elde_giris : in std_logic;
	toplam : out std_logic_vector(7 downto 0);
	elde_cikis:out std_logic_vector(4 downto 0));
	
end Cikarici;
architecture dataflow of Cikarici is
signal elde:std_logic_vector(7 downto 0);
begin
	
	toplam(0)<=(a(0) and b(0) and elde_giris) or (not a(0) and not b(0) and elde_giris) or (not a(0) and b(0)and not elde_giris) or (a(0) and not b(0) and not elde_giris);
	elde(0)<=(not a(0) and b(0)) or (not a(0) and elde_giris) or (b(0) and elde_giris);
	
	toplam(1)<=(a(1) and b(1) and elde(0)) or (not a(1) and not b(1) and elde(0)) or (not a(1) and b(1)and not elde(0)) or (a(1) and not b(1) and not elde(0));
	elde(1)<=(not a(1) and b(1)) or (not a(1) and elde(0)) or (b(1) and elde(0));
	
	toplam(2)<=(a(2) and b(2) and elde(1)) or (not a(2) and not b(2) and elde(1)) or (not a(2) and b(2)and not elde(1)) or (a(2) and not b(2) and not elde(1));
	elde(2)<=(not a(2) and b(2)) or (not a(2) and elde(1)) or (b(2) and elde(1));
	
	toplam(3)<=(a(3) and b(3) and elde(2)) or (not a(3) and not b(3) and elde(2)) or (not a(3) and b(3)and not elde(2)) or (a(3) and not b(3) and not elde(2));
	elde(3)<=(not a(3) and b(3)) or (not a(3) and elde(2)) or (b(3) and elde(2));
	
	toplam(4)<=(a(4) and b(4) and elde(3)) or (not a(4) and not b(4) and elde(3)) or (not a(4) and b(4)and not elde(3)) or (a(4) and not b(4) and not elde(3));
	elde(4)<=(not a(4) and b(4)) or (not a(4) and elde(3)) or (b(4) and elde(3)); 
	
	toplam(5)<=(a(5) and b(5) and elde(4)) or (not a(5) and not b(5) and elde(4)) or (not a(5) and b(5)and not elde(4)) or (a(5) and not b(5) and not elde(4));
	elde(5)<=(not a(5) and b(5)) or (not a(5) and elde(4)) or (b(5) and elde(4));  
	
	toplam(6)<=(a(6) and b(6) and elde(5)) or (not a(6) and not b(6) and elde(5)) or (not a(6) and b(6)and not elde(5)) or (a(6) and not b(6) and not elde(5));
	elde(6)<=(not a(6) and b(6)) or (not a(6) and elde(5)) or (b(6) and elde(5));
	
	toplam(7)<=(a(7) and b(7) and elde(6)) or (not a(7) and not b(7) and elde(6)) or (not a(7) and b(7)and not elde(6)) or (a(7) and not b(7) and not elde(6));
	elde(7)<=(not a(7) and b(7)) or (not a(7) and elde(6)) or (b(7) and elde(6));
	
	elde_cikis(1)<=elde(7);--sign flag assigned
end architecture dataflow;	


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity Yari_Toplayici is
port(a : in std_logic;
	b : in std_logic;
	toplam : out std_logic;
	elde : out std_logic);
end Yari_Toplayici;
architecture dataflow of Yari_Toplayici is
begin
	toplam <= a xor b;
	elde <= a and b;
end architecture dataflow;



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity Carpma is
	port (a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		carpim : out std_logic_vector(15 downto 0));
	end Carpma;
architecture structure of Carpma is
	component Yari_Toplayici is
		port(a,b : in std_logic;
			toplam, elde : out std_logic);
	end component;
signal ara_carpim : std_logic_vector(15 downto 0);
signal elde : std_logic;
begin
	ara_carpim(0) <= a(1) and b(0);
	ara_carpim(1) <= a(0) and b(1);
	ara_carpim(2) <= a(1) and b(1);--bu carpma 2 bitte doðru çalýþýyor.yetiþtiremediðimden diðer carpimlari yazamýyorum
YT1: Yari_Toplayici
port map (a => ara_carpim(0),b => ara_carpim(1),
	toplam => carpim(1),elde => elde);
YT2: Yari_Toplayici
port map (a => ara_carpim(2),b => elde,
	toplam => carpim(2),elde => carpim(3));
end architecture structure;



