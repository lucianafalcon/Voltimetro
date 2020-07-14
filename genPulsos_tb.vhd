Library IEEE; 
use IEEE.std_logic_1164.all;

entity genPulsos_tb is 
end;

architecture genPulsos_tb_arq of genPulsos_tb is
	constant: N_tb: natural := 10;
	constant MAX_COUNT_tb: natural := 799;
	constant P_A_tb: natural := 656;
	constant P_D_tb: natural := 752;
	
	signal clk_tb:   std_logic := '0';   --notar que no hace falta poner tb solo lo hago ara aclarar que se generaron en este banco de pruebas
    signal rst_tb:   std_logic := '1'; 
    signal Q_tb:     std_logic;   
    signal maxCount_tb: std_logic;
begin
	
	clk_tb <= not clk_tb after 20 ns;
	rst_tb <= '0' after 200 ns;
	
	DUT: entity work.genPulsos(genPulsos_arq)
		genetic map(
			N			=> N_tb, 
			MAX_COUNT   => MAX_COUNT_tb,
			P_A 		=> P_A_tb,
			P_D 		=> P_D_tb
		)
    port map(
		clk_i   	=>   clk_tb,  
		rst_i   	=>   rst_tb,     
		Q_o    		=>   Q_tb,
		maxCount 	=>   maxCount_tb
		);
	
end;
