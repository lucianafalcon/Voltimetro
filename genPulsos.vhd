library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity genPulsos is  
   port(
      N: natural := 10;
      MAX_COUNT: natural := 800;
      P_A: natural := 120;
	  P_D: natural := 126
   );
   port(
		clk_i: in std_logic;  
		rst_i: in std_logic;  
		Q_o: out std_logic;
        maxCount: out std_logic 		
		);
end;

architecture genPulsos_arq of genPulsos is  
   signal , rstOr: std_logic;   --declaro la senial
   signal enaSignal: std_logic;
   signal salComp1, salComp2: std_logic;
   signal cuenta: std_logic_vector (N-1 downto 0);
   
begin

	ffd_inst: entity work.ffd   
		port map(
		clk_i   =>   clk_i,  
		rst_i   =>   rstOr,   
		ena_i   =>   salComp1,   
		D_i     =>   '1',
		Q_o     =>   Q_o    
		);
			
	salOr <= salComp1 or salComp2;
	salXOr <= salOr xor salQ;
	
	salComp1 <= '1' when (unsigned(cuenta) = to_unsigned(P_A, N) else '0';
	salComp2 <= '1' when (unsigned(cuenta) = P_D else '0';
	
	cont_inst: entity work.contNBitsEstuct
		generic map(
			N 			=> N,
			MAX_COUNT 	=> MAX_COUNT
		)
		port map(
		clk_i  	 =>   clk_i,  
		rst_i 	 =>   rst_i,   
		ena_i  	 =>   '1',   
		Q_o    	 =>   cuenta,
		MAXcOUNT =>	  maxCount
		);
		
	Q_o <= salQ;
end;

