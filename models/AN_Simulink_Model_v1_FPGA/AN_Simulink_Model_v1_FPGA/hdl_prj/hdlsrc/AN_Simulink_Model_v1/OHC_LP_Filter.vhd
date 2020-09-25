-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\AN_Simulink_Model_v1\OHC_LP_Filter.vhd
-- Created: 2020-04-16 16:05:26
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: OHC_LP_Filter
-- Source Path: AN_Simulink_Model_v1/Auditory Nerve Model/Subsystem1/OHC LP Filter
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY OHC_LP_Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        stimulus                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        output                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END OHC_LP_Filter;


ARCHITECTURE rtl OF OHC_LP_Filter IS

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
  SIGNAL Constant3_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant1_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant2_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product3_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product2_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay1_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum1_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum2_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant9_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant10_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay2_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay3_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain2_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product1_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum3_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain1_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product4_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum_out1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant4_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product7_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant5_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant11_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product8_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product5_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum5_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum6_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant13_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay4_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay5_out1                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain5_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product6_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum7_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain3_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product9_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum4_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_nfp_mul_comp : nfp_mul_single
    PORT MAP( nfp_in1 => Constant_out1,  -- single
              nfp_in2 => stimulus,  -- single
              nfp_out => Product3_out1  -- single
              );

  u_nfp_mul_comp_1 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant1_out1,  -- single
              nfp_in2 => Unit_Delay_out1,  -- single
              nfp_out => Product2_out1  -- single
              );

  u_nfp_mul_comp_2 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant2_out1,  -- single
              nfp_in2 => Unit_Delay1_out1,  -- single
              nfp_out => Product_out1  -- single
              );

  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => Product2_out1,  -- single
              nfp_in2 => Product_out1,  -- single
              nfp_out => Sum1_out1  -- single
              );

  u_nfp_add_comp_1 : nfp_add_single
    PORT MAP( nfp_in1 => Product3_out1,  -- single
              nfp_in2 => Sum1_out1,  -- single
              nfp_out => Sum2_out1  -- single
              );

  u_nfp_uminus_comp : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay3_out1,  -- single
              nfp_out => Gain2_out1  -- single
              );

  u_nfp_mul_comp_3 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant10_out1,  -- single
              nfp_in2 => Gain2_out1,  -- single
              nfp_out => Product1_out1  -- single
              );

  u_nfp_uminus_comp_1 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay2_out1,  -- single
              nfp_out => Gain1_out1  -- single
              );

  u_nfp_mul_comp_4 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant9_out1,  -- single
              nfp_in2 => Gain1_out1,  -- single
              nfp_out => Product4_out1  -- single
              );

  u_nfp_add_comp_2 : nfp_add_single
    PORT MAP( nfp_in1 => Product4_out1,  -- single
              nfp_in2 => Product1_out1,  -- single
              nfp_out => Sum_out1  -- single
              );

  u_nfp_add_comp_3 : nfp_add_single
    PORT MAP( nfp_in1 => Sum2_out1,  -- single
              nfp_in2 => Sum_out1,  -- single
              nfp_out => Sum3_out1  -- single
              );

  u_nfp_mul_comp_5 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant4_out1,  -- single
              nfp_in2 => Unit_Delay2_out1,  -- single
              nfp_out => Product7_out1  -- single
              );

  u_nfp_mul_comp_6 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant3_out1,  -- single
              nfp_in2 => Sum3_out1,  -- single
              nfp_out => Product8_out1  -- single
              );

  u_nfp_mul_comp_7 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant5_out1,  -- single
              nfp_in2 => Unit_Delay3_out1,  -- single
              nfp_out => Product5_out1  -- single
              );

  u_nfp_add_comp_4 : nfp_add_single
    PORT MAP( nfp_in1 => Product7_out1,  -- single
              nfp_in2 => Product5_out1,  -- single
              nfp_out => Sum5_out1  -- single
              );

  u_nfp_add_comp_5 : nfp_add_single
    PORT MAP( nfp_in1 => Product8_out1,  -- single
              nfp_in2 => Sum5_out1,  -- single
              nfp_out => Sum6_out1  -- single
              );

  u_nfp_uminus_comp_2 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay5_out1,  -- single
              nfp_out => Gain5_out1  -- single
              );

  u_nfp_mul_comp_8 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant13_out1,  -- single
              nfp_in2 => Gain5_out1,  -- single
              nfp_out => Product6_out1  -- single
              );

  u_nfp_uminus_comp_3 : nfp_uminus_single
    PORT MAP( nfp_in => Unit_Delay4_out1,  -- single
              nfp_out => Gain3_out1  -- single
              );

  u_nfp_mul_comp_9 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant11_out1,  -- single
              nfp_in2 => Gain3_out1,  -- single
              nfp_out => Product9_out1  -- single
              );

  u_nfp_add_comp_6 : nfp_add_single
    PORT MAP( nfp_in1 => Product9_out1,  -- single
              nfp_in2 => Product6_out1,  -- single
              nfp_out => Sum4_out1  -- single
              );

  u_nfp_add_comp_7 : nfp_add_single
    PORT MAP( nfp_in1 => Sum6_out1,  -- single
              nfp_in2 => Sum4_out1,  -- single
              nfp_out => Sum7_out1  -- single
              );

  Constant3_out1 <= X"3d1ac58c";

  Constant1_out1 <= X"3d1ac58c";

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


  Constant2_out1 <= X"00000000";

  Constant_out1 <= X"3d1ac58c";

  Unit_Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay1_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay1_out1 <= Unit_Delay_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  Constant9_out1 <= X"bf6ca74e";

  Constant10_out1 <= X"00000000";

  Unit_Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay3_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay3_out1 <= Unit_Delay2_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay3_process;


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


  Constant4_out1 <= X"3d1ac58c";

  Constant5_out1 <= X"00000000";

  Constant11_out1 <= X"bf6ca74e";

  Constant13_out1 <= X"00000000";

  Unit_Delay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay5_out1 <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay5_out1 <= Unit_Delay4_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay5_process;


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


  output <= Sum7_out1;

END rtl;

