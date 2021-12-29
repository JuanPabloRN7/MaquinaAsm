library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Juan Pablo Ortega
entity Ejercicio1ControlTren is
    Port ( tiempo,sensor,clk,sp : in  STD_LOGIC;
           PA,PC,PARO,AVANCE : out  STD_LOGIC;
			  q1,q0: inout STD_LOGIC);
end Ejercicio1ControlTren;

architecture Behavioral of Ejercicio1ControlTren is
     type estados is (A,B,C,D);
	  signal pres,fut: estados;
begin    
    primerproceso: process (pres,tiempo,sensor,sp)
begin
	case pres is 
	 when A => PA <= '1'; PC <= '0'; PARO <= '0'; AVANCE <= '0'; Q1<='0'; Q0<='0';
	  if tiempo = '1' then
	   fut <= B;
	  else
	   fut <= A;
	  end if;
	 
	 when B => PA <= '0'; PC <= '1'; PARO <= '0'; AVANCE <= '0'; Q1<='0'; Q0<='1';
	  if SP = '1' then
	   fut <= C;
	  else
	   fut <= B;
	  end if;
	 
	  when C => PA <= '0'; PC <= '0'; PARO <= '0'; AVANCE <= '1'; Q1<='1'; Q0<='0';
	  if sensor = '1' then
	   fut <= D;
	  else
	   fut <= C;
	  end if;
	  
	  when D => PA <= '0'; PC <= '0'; PARO <= '1'; AVANCE <= '0'; Q1<='1'; Q0<='1';
	   fut <= A;
	end case;
  end process primerproceso;

   segundoproceso: process (clk) begin
	   if(clk' event and clk='1')then 
		   pres <= fut;
		end if;
	  end process segundoproceso;
end Behavioral;

