-- Contador
library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity cont_BCD_4 is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		Q: out std_logic_vector(3 downto 0)
		);
	end;
	
architecture cont_BCD_4_arq of cont_BCD_4 is

signal D0_aux, D1_aux, D2_aux, D3_aux: std_logic;
signal Q0, Q1, Q2, Q3: std_logic;

begin
	-- Funcion D0
	D0_aux <= not Q0;
	-- Funcion D1
	D1_aux <= ((not (Q3)) and (not (Q1)) and Q0) or (Q1 and (not Q0));
	-- Funcion D2
	D2_aux <= (Q2 and ((not Q0) or (not Q1))) or ((not (Q2)) and Q1 and Q0);
	-- Funcion D3
	D3_aux <= (Q3 and (not Q0)) or (Q2 and Q1 and Q0);
	
-- flip-flop 0
ffd_0: entity work.ffd
	port map(
	clk => clk,
	rst => rst,
	ena => ena,
	D => D0_aux,
	Q => Q0
	);
-- flip-flop 1

ffd_1: entity work.ffd
port map(
	clk => clk,
	rst => rst,
	ena => ena,
	D => D1_aux,
	Q => Q1
	);
	
-- flip-flop 2
ffd_2: entity work.ffd
	port map(
	clk => clk,
	rst => rst,
	ena => ena,
	D => D2_aux,
	Q => Q2
	);
	
-- flip-flop 3
ffd_3: entity work.ffd
port map(
	clk =&gt; clk,
	rst =&gt; rst,
	ena =&gt; ena,
	D =&gt; D3_aux,
	Q =&gt; Q3
	);
Q <= Q3 & Q2 & Q1 & Q0;
end;



