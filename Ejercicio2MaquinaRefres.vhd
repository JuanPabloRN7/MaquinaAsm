library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ejercicio2MaquinaRefres is
    port(CLK, MONEDA, MP, PRECIO, LC, LS: in  std_logic;
	 CAP,LIMPIA,SIRVE,CAMBIO,DEC,IM,Q2,Ql,QO: out  std_logic); 
end Ejercicio2MaquinaRefres;

architecture Behavioral of Ejercicio2MaquinaRefres is
    type  estados  is  (A,B,C,D,E,F,G,H,I);  
	 signal  pres,fut:  estados; 
begin


end Behavioral;

