library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Juan Pablo Ortega
entity DespaRefrescos2 is
    port  (CLK,  MONEDA,  MP,  PRECIO,  LC,  LS:  in  std_logic; 
	 CAP,  LIMPIA,  SIRVE,  CAMBIO,  DEC,  IM,  Q2,  Ql,  QO:  out  std_logic); 
end DespaRefrescos2;

architecture Behavioral of DespaRefrescos2 is
   type  estados  is  (A,B,C,D,E,F,G,H,I); 
	signal  pres,fut:  estados;
   begin
	primer: process(pres,MONEDA,MP,PRECIO,LC,LS)  
	begin 
	case pres is
	when A => CAP<='0'; LIMPIA <= '0'; SIRVE <= '0'; CAMBIO <='0'; DEC<='0'; IM<='1'; Q2<='0'; Ql<='0'; QO<='0';
				 if MONEDA = '1' then
				   fut <= B;
			    else
				   fut <= A;
				 end if;
	when B => CAP<='0'; LIMPIA <= '0'; SIRVE <= '0'; CAMBIO <='0'; DEC<='0'; IM<='0';
	          Q2<='0'; Ql<='0'; QO<='1';
				 if MONEDA = '0' then
				   fut <= C;
			    else
				   fut <= B;
				 end if;
	when C => CAP<='0'; LIMPIA <= '0'; SIRVE <= '0'; CAMBIO <='0'; DEC<='0'; IM<='0';
	          Q2<='0'; Ql<='1'; QO<='0';
				 if MP = '0' then
				   fut <= D;
			    else
				   fut <= A;
				 end if;
  when D => CAP<='0'; LIMPIA <= '0'; SIRVE <= '0'; CAMBIO <='0'; DEC<='0'; IM<='0';
	          Q2<='0'; Ql<='1'; QO<='1';
				 if PRECIO = '0' then
				   fut <= H;
			    else
				   fut <= E;
				 end if;
  when E => CAP<='0'; LIMPIA <= '0'; SIRVE <= '1'; CAMBIO <='0'; DEC<='0'; IM<='0';
	          Q2<='1'; Ql<='0'; QO<='0';
				 if LS = '0' then
				   fut <= E;
			    else
				   fut <= F;
				 end if;
  when F => CAP<='1'; LIMPIA <= '1'; SIRVE <= '0'; CAMBIO <='0'; DEC<='0'; IM<='0';
	          Q2<='1'; Ql<='0'; QO<='1';
				   fut <= A;
					
  when G => CAP<='0'; LIMPIA <= '0'; SIRVE <= '0'; CAMBIO <='1'; DEC<='0'; IM<='0';
	          Q2<='1'; Ql<='1'; QO<='1';
				 if LC = '0' then
				   fut <= G;
			    else
				   fut <= H;
				 end if;
  when H => CAP<='0'; LIMPIA <= '0'; SIRVE <= '0'; CAMBIO <='1'; DEC<='1'; IM<='0';
				   fut <= D;
  
  when others =>
            fut <= A;
	end case;
  end process primer;
  
  segundo: process (clk) begin
	   if(clk' event and clk='1')then 
		   pres <= fut;
		end if;
	  end process segundo;
end Behavioral;

