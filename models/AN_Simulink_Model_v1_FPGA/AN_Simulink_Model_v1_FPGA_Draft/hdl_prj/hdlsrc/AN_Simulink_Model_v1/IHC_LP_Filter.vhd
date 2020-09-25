-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\AN_Simulink_Model_v1\IHC_LP_Filter.vhd
-- Created: 2020-04-16 11:39:36
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IHC_LP_Filter
-- Source Path: AN_Simulink_Model_v1/Auditory Nerve Model/Subsystem/IHC LP Filter
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IHC_LP_Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        stimulus                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        output                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END IHC_LP_Filter;


ARCHITECTURE rtl OF IHC_LP_Filter IS

  -- Component Declarations
  COMPONENT nfp_mul_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_add_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_uminus_single
    PORT( nfp_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : nfp_mul_single
    USE ENTITY work.nfp_mul_single(rtl);

  FOR ALL : nfp_add_single
    USE ENTITY work.nfp_add_single(rtl);

  FOR ALL : nfp_uminus_single
    USE ENTITY work.nfp_uminus_single(rtl);

  -- Signals
  SIGNAL Constant33_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant28_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant23_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant18_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant14_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant7_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant3_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant2_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product3_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product2_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum2_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant5_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum3_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay2_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain1_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product4_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product8_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant8_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product7_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum6_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant10_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum7_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay4_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain3_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product9_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product13_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant15_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product12_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum10_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant12_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum11_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay6_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain6_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product14_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product18_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant19_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product17_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum12_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant1_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum13_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay8_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain4_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product19_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product23_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant24_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product22_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum16_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant21_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum17_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay10_out1                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain9_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product24_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product28_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant29_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product27_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum20_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant26_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum21_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay12_out1                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain12_out1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product29_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product33_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant34_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product32_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum24_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant31_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum25_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay14_out1                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain14_out1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product34_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_nfp_mul_comp : nfp_mul_single
    PORT MAP( nfp_in1 => Constant2_out1,  -- single
              nfp_in2 => stimulus,  -- single
              nfp_out => Product3_out1  -- single
              );

  u_nfp_mul_comp_1 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant3_out1,  -- single
              nfp_in2 => Unit_Delay_out1,  -- single
              nfp_out => Product2_out1  -- single
              );

  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => Product3_out1,  -- single
              nfp_in2 => Product2_out1,  -- single
              nfp_out => Sum2_out1  -- single
              );

  u_nfp_uminus_comp : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay2_out1,  -- single
              nfp_out => Gain1_out1  -- single
              );

  u_nfp_mul_comp_2 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant5_out1,  -- single
              nfp_in2 => Gain1_out1,  -- single
              nfp_out => Product4_out1  -- single
              );

  u_nfp_add_comp_1 : nfp_add_single
    PORT MAP( nfp_in1 => Sum2_out1,  -- single
              nfp_in2 => Product4_out1,  -- single
              nfp_out => Sum3_out1  -- single
              );

  u_nfp_mul_comp_3 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant7_out1,  -- single
              nfp_in2 => Sum3_out1,  -- single
              nfp_out => Product8_out1  -- single
              );

  u_nfp_mul_comp_4 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant8_out1,  -- single
              nfp_in2 => Unit_Delay2_out1,  -- single
              nfp_out => Product7_out1  -- single
              );

  u_nfp_add_comp_2 : nfp_add_single
    PORT MAP( nfp_in1 => Product8_out1,  -- single
              nfp_in2 => Product7_out1,  -- single
              nfp_out => Sum6_out1  -- single
              );

  u_nfp_uminus_comp_1 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay4_out1,  -- single
              nfp_out => Gain3_out1  -- single
              );

  u_nfp_mul_comp_5 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant10_out1,  -- single
              nfp_in2 => Gain3_out1,  -- single
              nfp_out => Product9_out1  -- single
              );

  u_nfp_add_comp_3 : nfp_add_single
    PORT MAP( nfp_in1 => Sum6_out1,  -- single
              nfp_in2 => Product9_out1,  -- single
              nfp_out => Sum7_out1  -- single
              );

  u_nfp_mul_comp_6 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant14_out1,  -- single
              nfp_in2 => Sum7_out1,  -- single
              nfp_out => Product13_out1  -- single
              );

  u_nfp_mul_comp_7 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant15_out1,  -- single
              nfp_in2 => Unit_Delay4_out1,  -- single
              nfp_out => Product12_out1  -- single
              );

  u_nfp_add_comp_4 : nfp_add_single
    PORT MAP( nfp_in1 => Product13_out1,  -- single
              nfp_in2 => Product12_out1,  -- single
              nfp_out => Sum10_out1  -- single
              );

  u_nfp_uminus_comp_2 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay6_out1,  -- single
              nfp_out => Gain6_out1  -- single
              );

  u_nfp_mul_comp_8 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant12_out1,  -- single
              nfp_in2 => Gain6_out1,  -- single
              nfp_out => Product14_out1  -- single
              );

  u_nfp_add_comp_5 : nfp_add_single
    PORT MAP( nfp_in1 => Sum10_out1,  -- single
              nfp_in2 => Product14_out1,  -- single
              nfp_out => Sum11_out1  -- single
              );

  u_nfp_mul_comp_9 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant18_out1,  -- single
              nfp_in2 => Sum11_out1,  -- single
              nfp_out => Product18_out1  -- single
              );

  u_nfp_mul_comp_10 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant19_out1,  -- single
              nfp_in2 => Unit_Delay6_out1,  -- single
              nfp_out => Product17_out1  -- single
              );

  u_nfp_add_comp_6 : nfp_add_single
    PORT MAP( nfp_in1 => Product18_out1,  -- single
              nfp_in2 => Product17_out1,  -- single
              nfp_out => Sum12_out1  -- single
              );

  u_nfp_uminus_comp_3 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay8_out1,  -- single
              nfp_out => Gain4_out1  -- single
              );

  u_nfp_mul_comp_11 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant1_out1,  -- single
              nfp_in2 => Gain4_out1,  -- single
              nfp_out => Product19_out1  -- single
              );

  u_nfp_add_comp_7 : nfp_add_single
    PORT MAP( nfp_in1 => Sum12_out1,  -- single
              nfp_in2 => Product19_out1,  -- single
              nfp_out => Sum13_out1  -- single
              );

  u_nfp_mul_comp_12 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant23_out1,  -- single
              nfp_in2 => Sum13_out1,  -- single
              nfp_out => Product23_out1  -- single
              );

  u_nfp_mul_comp_13 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant24_out1,  -- single
              nfp_in2 => Unit_Delay8_out1,  -- single
              nfp_out => Product22_out1  -- single
              );

  u_nfp_add_comp_8 : nfp_add_single
    PORT MAP( nfp_in1 => Product23_out1,  -- single
              nfp_in2 => Product22_out1,  -- single
              nfp_out => Sum16_out1  -- single
              );

  u_nfp_uminus_comp_4 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay10_out1,  -- single
              nfp_out => Gain9_out1  -- single
              );

  u_nfp_mul_comp_14 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant21_out1,  -- single
              nfp_in2 => Gain9_out1,  -- single
              nfp_out => Product24_out1  -- single
              );

  u_nfp_add_comp_9 : nfp_add_single
    PORT MAP( nfp_in1 => Sum16_out1,  -- single
              nfp_in2 => Product24_out1,  -- single
              nfp_out => Sum17_out1  -- single
              );

  u_nfp_mul_comp_15 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant28_out1,  -- single
              nfp_in2 => Sum17_out1,  -- single
              nfp_out => Product28_out1  -- single
              );

  u_nfp_mul_comp_16 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant29_out1,  -- single
              nfp_in2 => Unit_Delay10_out1,  -- single
              nfp_out => Product27_out1  -- single
              );

  u_nfp_add_comp_10 : nfp_add_single
    PORT MAP( nfp_in1 => Product28_out1,  -- single
              nfp_in2 => Product27_out1,  -- single
              nfp_out => Sum20_out1  -- single
              );

  u_nfp_uminus_comp_5 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay12_out1,  -- single
              nfp_out => Gain12_out1  -- single
              );

  u_nfp_mul_comp_17 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant26_out1,  -- single
              nfp_in2 => Gain12_out1,  -- single
              nfp_out => Product29_out1  -- single
              );

  u_nfp_add_comp_11 : nfp_add_single
    PORT MAP( nfp_in1 => Sum20_out1,  -- single
              nfp_in2 => Product29_out1,  -- single
              nfp_out => Sum21_out1  -- single
              );

  u_nfp_mul_comp_18 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant33_out1,  -- single
              nfp_in2 => Sum21_out1,  -- single
              nfp_out => Product33_out1  -- single
              );

  u_nfp_mul_comp_19 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant34_out1,  -- single
              nfp_in2 => Unit_Delay12_out1,  -- single
              nfp_out => Product32_out1  -- single
              );

  u_nfp_add_comp_12 : nfp_add_single
    PORT MAP( nfp_in1 => Product33_out1,  -- single
              nfp_in2 => Product32_out1,  -- single
              nfp_out => Sum24_out1  -- single
              );

  u_nfp_uminus_comp_6 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay14_out1,  -- single
              nfp_out => Gain14_out1  -- single
              );

  u_nfp_mul_comp_20 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant31_out1,  -- single
              nfp_in2 => Gain14_out1,  -- single
              nfp_out => Product34_out1  -- single
              );

  u_nfp_add_comp_13 : nfp_add_single
    PORT MAP( nfp_in1 => Sum24_out1,  -- single
              nfp_in2 => Product34_out1,  -- single
              nfp_out => Sum25_out1  -- single
              );

  Constant33_out1 <= X"3e281018";

  Constant28_out1 <= X"3e281018";

  Constant23_out1 <= X"3e281018";

  Constant18_out1 <= X"3e281018";

  Constant14_out1 <= X"3e281018";

  Constant7_out1 <= X"3e281018";

  Constant3_out1 <= X"3e281018";

  Constant2_out1 <= X"3e281018";

  Unit_Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay_out1 <= stimulus;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Constant5_out1 <= X"bf2bf7f4";

  Unit_Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay2_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay2_out1 <= Sum3_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay2_process;


  Constant8_out1 <= X"3e281018";

  Constant10_out1 <= X"bf2bf7f4";

  Unit_Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay4_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay4_out1 <= Sum7_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay4_process;


  Constant15_out1 <= X"3e281018";

  Constant12_out1 <= X"bf2bf7f4";

  Unit_Delay6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay6_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay6_out1 <= Sum11_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay6_process;


  Constant19_out1 <= X"3e281018";

  Constant1_out1 <= X"bf2bf7f4";

  Unit_Delay8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay8_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay8_out1 <= Sum13_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay8_process;


  Constant24_out1 <= X"3e281018";

  Constant21_out1 <= X"bf2bf7f4";

  Unit_Delay10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay10_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay10_out1 <= Sum17_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay10_process;


  Constant29_out1 <= X"3e281018";

  Constant26_out1 <= X"bf2bf7f4";

  Unit_Delay12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay12_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay12_out1 <= Sum21_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay12_process;


  Constant34_out1 <= X"3e281018";

  Constant31_out1 <= X"bf2bf7f4";

  Unit_Delay14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay14_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay14_out1 <= Sum25_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay14_process;


  output <= Sum25_out1;

END rtl;

