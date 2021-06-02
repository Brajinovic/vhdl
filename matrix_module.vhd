library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity matrix_module is
	port(
		--ulazi su CP za signal takta i binComb za visebitnu komb slike koja se zeli prikazati
		binComb: in std_logic_vector(63 downto 0);
		CP: in std_logic;
		--izlazi su rowComb koji daje na izlaz visebitnu kombinaciju za odabir reda koji ce moci svijetliti
		--i colComb koji daje na izlazu visebintu kombinaciju za odabir stupca koji ce moci svijetliti
		rowComb: out std_logic_vector(2 downto 0);
		colComb: out std_logic_vector(2 downto 0);
		works: out std_logic
	);
end matrix_module;

architecture Behavioral of matrix_module is
	signal temp_r: std_logic_vector(2 downto 0);
	signal temp_s: std_logic_vector(2 downto 0);
	signal CLK: std_logic;
--	signal binComb : std_logic_vector(63 downto 0);
	
	begin
		--binComb <= "0010010000100100000110000001100011111111000110000011110000111100";
		djelj_frekv: entity work.freqDivGen generic map(1_000) port map(CP, CLK);	
		process(CLK)
			variable r: integer range 0 to 8;
			variable s:	integer range 0 to 8;
			
			begin
			works <= '0';--omoguci svjetljenje LED
			if(CLK'event and CLK='1')then
				if(r = 8)then
					r := 0;--resetiraj redove
					temp_r <= "000";
				else
				
					if(s = 8)then
						s := 0;--resetiraj stupce
						temp_s <= "000";
					else
						
						if(binComb(r * 8 + s) = '1')then
							rowComb <= conv_std_logic_vector(r, 3);--osvjetli odgovarajucu LED
							colComb <= conv_std_logic_vector(s, 3);--pretvaranje iz dek u bin
						end if;
						
						s := s + 1;--inkrementiraj stupce
						temp_s <= temp_s + 1; 
						
					end if;
					
					r := r + 1;--inkrementiraj redove
					temp_r <= temp_r + 1;
				end if;
			end if;
		end process;
end Behavioral;

