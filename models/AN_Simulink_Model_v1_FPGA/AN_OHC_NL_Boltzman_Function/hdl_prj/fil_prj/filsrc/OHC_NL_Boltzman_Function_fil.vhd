
-- ----------------------------------------------
-- File Name: OHC_NL_Boltzman_Function_fil.vhd
-- Created:   15-Apr-2020 17:35:04
-- Copyright  2020 MathWorks, Inc.
-- ----------------------------------------------

 LIBRARY altera_mf;
 USE altera_mf.altera_mf_components.all;
 USE altera_mf.all;



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


ENTITY OHC_NL_Boltzman_Function_fil IS 
PORT (
      sysrst                          : IN  std_logic;
      sysclk                          : IN  std_logic
);
END OHC_NL_Boltzman_Function_fil;

ARCHITECTURE rtl of OHC_NL_Boltzman_Function_fil IS

COMPONENT MWClkMgr IS 
PORT (
      RXCLK_IN                        : IN  std_logic;
      RESET_IN                        : IN  std_logic;
      CLK_IN                          : IN  std_logic;
      RESET_OUT                       : OUT std_logic;
      TXCLK                           : OUT std_logic;
      MACTXCLK                        : OUT std_logic;
      DUTCLK                          : OUT std_logic;
      MACRXCLK                        : OUT std_logic
);
END COMPONENT;

COMPONENT FILCore IS 
PORT (
      clk                             : IN  std_logic;
      reset                           : IN  std_logic;
      txclk_en                        : IN  std_logic;
      rxclk_en                        : IN  std_logic;
      CLK125                          : IN  std_logic
);
END COMPONENT;

  SIGNAL dutClk                           : std_logic; -- boolean
  SIGNAL rst                              : std_logic; -- boolean
  SIGNAL ClkIn                            : std_logic; -- boolean
  SIGNAL rxclk                            : std_logic; -- boolean
  SIGNAL txclk                            : std_logic; -- boolean
  SIGNAL rxd                              : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL txd                              : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL txclk_en                         : std_logic; -- boolean
  SIGNAL rxclk_en                         : std_logic; -- boolean
  SIGNAL dcm_reset                        : std_logic; -- boolean
  SIGNAL Bit0                             : std_logic; -- boolean
  SIGNAL ref_clk                          : std_logic; -- boolean
  SIGNAL clk5                             : std_logic_vector(6 DOWNTO 0); -- std7
  SIGNAL clk1                             : std_logic; -- boolean
  SIGNAL clk2                             : std_logic; -- boolean
  SIGNAL clk3                             : std_logic; -- boolean
  SIGNAL LOCKED                           : std_logic; -- boolean
  SIGNAL notLocked                        : std_logic; -- boolean
  SIGNAL clkin_vector                     : std_logic_vector(1 DOWNTO 0); -- std2
  SIGNAL clkin_tmp                        : std_logic; -- boolean
  SIGNAL zero                             : std_logic; -- boolean
  SIGNAL tmp                              : std_logic; -- boolean
  SIGNAL dut_rst                          : std_logic; -- boolean
  SIGNAL dut_din                          : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL dut_dinvld                       : std_logic; -- boolean
  SIGNAL dut_dinrdy                       : std_logic; -- boolean
  SIGNAL simcycle                         : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL dut_dout                         : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL dut_doutvld                      : std_logic; -- boolean
  SIGNAL dut_doutrdy                      : std_logic; -- boolean

BEGIN

u_ClockManager: MWClkMgr 
PORT MAP(
        RESET_OUT            => rst,
        RXCLK_IN             => Bit0,
        RESET_IN             => dcm_reset,
        TXCLK                => OPEN,
        MACTXCLK             => ref_clk,
        CLK_IN               => ClkIn,
        DUTCLK               => dutClk,
        MACRXCLK             => OPEN
);

u_FILCore: FILCore 
PORT MAP(
        clk                  => dutClk,
        reset                => rst,
        txclk_en             => txclk_en,
        rxclk_en             => rxclk_en,
        CLK125               => ref_clk
);

ClkIn <= sysclk;

txclk_en <= '1';
rxclk_en <= '1';
dcm_reset <= sysrst;

Bit0 <= '0';

END;
