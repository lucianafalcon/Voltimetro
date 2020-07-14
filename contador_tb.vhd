library IEEE;
use IEEE.std_logic_1164.all;

entity contador_tb is
end;

architecture contador_tb_arq of contador_tb is

	component contador is 
	   port(
		  clk_i: in std_logic;
		  rst_i: in std_logic;
		  ena_i: in std_logic;
		  QA_o: out std_logic;   --puerto
		  QB_o: out std_logic;   --puerto
		  QC_o: out std_logic;   --puerto
		  QD_o: out std_logic    --puerto
	   );
	end component;
	
	signal clk_tb: std_logic := '0';    --voy a necesitar el reloj 
	signal rst_tb: std_logic := '1';   --puede tener el nombre sin el tb (solo lo pongo para saber que se generaron en este banco de pruebas)
	signal ena_tb: std_logic := '1';  -- esta es la forma de inicializar seniales que uno acaba de declarar osea con := '1' o '0'
    signal QA_tb, QB_tb, QC_tb, QD_tb: std_logic;  

begin 

   clk_tb <= not clk_tb after 20 ns;  
   rst_tb <= '0' afer 200 ns; --bajo el reset a 0 apenas empiezo, arranca reseteado y a los 200ns se va a libeerar 
   
   DUT: contador
      port map(
		  clk_i  =>   clk_tb, 
		  rst_i  =>   rst_tb,
		  ena_i  =>   ena_tb, 
		  QA_o   =>   QA_tb,
		  QB_o   =>   QB_tb,
		  QC_o   =>   QC_tb,
		  QD_o   =>   QD_tb
	  );	   
  
end;

   
	
	

