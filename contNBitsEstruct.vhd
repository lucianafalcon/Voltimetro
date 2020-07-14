library IEEE;
use IEEE.std_logic_1164.all;

entity contNBitsEstruct is  
   port(
      clk_i: in std_logic;
      rst_i: in std_logic;
      ena_i: in std_logic;
      Q_o: out std_logic_vector (N-1 downto 0);
	  MaxCount: out std_logic
   );
end;

architecture contNBitsEstruct_arq of contNBitsEstruct is  
   signal salComp, salOr: std_logic;   --declaro la senial
   signal salInc, salReg: std_logic_vector (N-1 downto0);
begin

	reg_inst: entity work.reg   
		generic map(
			N => N 
		)	
		port map(
		clk_i   =>   clk_i,  
		rst_i   =>   salOr,   
		ena_i   =>   ena_i,   
		D_i     =>   salInc,
		Q_o     =>   salReg    
		);
		
	salInc <= std_logic_vector (unsigned (salReg) + 1);

	salOr <= rst_i or salComp;
	
	salComp <= '1' when (unsigned(salReg) = MAX_COUNT) else '0';
	maxCount <= salComp;
	
	Q_o <= salReg;

end;

