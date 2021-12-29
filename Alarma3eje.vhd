library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Juan Pablo Ortega
entity Alarma3eje is
    Port ( clk,fx,cont,boton: in  STD_LOGIC;
           reset,inc,activa,alarma: out STD_LOGIC);
end Alarma3eje;

architecture Behavioral of Alarma3eje is
    type  estados  is  (A,B,C,D,E,F,G,H,I,J,K,L); 
	 signal  pres,fut:  estados; 
  begin    
	  primero: process (pres,clk,fx,cont,boton)
   begin
	   case pres is
		  when A => reset <= '0'; inc <= '0'; activa<= '0'; alarma<= '0';
		     fut <= B;
			  
		  when B => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
		     if boton = '1' then
		      fut <= C;
			  else
			   fut <= B;
			  end if;
			  
		  when C => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
		     if fx = '1' then
		      fut <= D;
			  else
			   fut <= H;
           end if;
			  
        when D => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
		     if boton = '1' then
		      fut <= D;
			  else
			   fut <= E;
           end if;
			  
        when E => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
		     if cont = '1' then
		      fut <= G;
			  else
			   fut <= F;
           end if;
         
        when F => reset <= '0'; inc <= '1' ; activa<= '0'; alarma<= '0';
		     fut <= B;	
        
        when G => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
		     fut <= A;
        
        when H => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
		     if boton = '1' then
              fut <= H;
           else 
              fut <= I;
           end if;
        when I => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
 		     if cont = '1' then
              fut <= L;
           else 
              fut <= J;
           end if;
			  
		 when J => reset <= '0'; inc <= '1' ; activa<= '0'; alarma<= '0';
 		     fut <= K;
			  
		 when K => reset <= '0'; inc <= '0' ; activa<= '0'; alarma<= '0';
 		     if boton = '1' then
              fut <= H;
           else 
              fut <= K;
           end if;
			  
		when L => reset <= '0'; inc <= '1' ; activa<= '0'; alarma<= '1';
 		     fut <= A;
	 end case;
	end process primero;
  
  segundo: process (clk) begin 
    if(clk' event and clk='1')then 
		   pres <= fut;
		end if;
	  end process segundo;
end Behavioral;

