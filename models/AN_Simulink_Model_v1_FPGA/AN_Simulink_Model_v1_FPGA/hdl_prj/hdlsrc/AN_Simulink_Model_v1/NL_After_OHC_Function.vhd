-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\AN_Simulink_Model_v1\NL_After_OHC_Function.vhd
-- Created: 2020-04-16 16:05:26
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: NL_After_OHC_Function
-- Source Path: AN_Simulink_Model_v1/Auditory Nerve Model/Subsystem1/NL After OHC Function
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY NL_After_OHC_Function IS
  PORT( stimulus                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        output                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END NL_After_OHC_Function;


ARCHITECTURE rtl OF NL_After_OHC_Function IS

  -- Component Declarations
  COMPONENT nfp_abs_single
    PORT( nfp_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_div_single
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

  COMPONENT nfp_exp_single
    PORT( nfp_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

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

  COMPONENT nfp_relop_single_block1
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out1                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT nfp_relop_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out1                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : nfp_abs_single
    USE ENTITY work.nfp_abs_single(rtl);

  FOR ALL : nfp_div_single
    USE ENTITY work.nfp_div_single(rtl);

  FOR ALL : nfp_uminus_single
    USE ENTITY work.nfp_uminus_single(rtl);

  FOR ALL : nfp_exp_single
    USE ENTITY work.nfp_exp_single(rtl);

  FOR ALL : nfp_mul_single
    USE ENTITY work.nfp_mul_single(rtl);

  FOR ALL : nfp_add_single
    USE ENTITY work.nfp_add_single(rtl);

  FOR ALL : nfp_relop_single_block1
    USE ENTITY work.nfp_relop_single_block1(rtl);

  FOR ALL : nfp_relop_single
    USE ENTITY work.nfp_relop_single(rtl);

  -- Signals
  SIGNAL x1                               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant15_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant12_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract4_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant5_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide1_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain2_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Exp_out1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product3_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add3_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product4_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Upperlimit_out                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LowerRelop_out                   : std_logic;
  SIGNAL Lowerlimit_out                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL UpperRelop_out                   : std_logic;
  SIGNAL Switch1_out                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Saturation_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  -- Ensuring Time Constant Falls within Range
  -- 
  -- Nonlinear Exponential Function

  u_nfp_abs_comp : nfp_abs_single
    PORT MAP( nfp_in => stimulus,  -- single
              nfp_out => x1  -- single
              );

  u_nfp_div_comp : nfp_div_single
    PORT MAP( nfp_in1 => x1,  -- single
              nfp_in2 => Constant5_out1,  -- single
              nfp_out => Divide1_out1  -- single
              );

  u_nfp_uminus_comp : nfp_uminus_single
    PORT MAP( nfp_in => Divide1_out1,  -- single
              nfp_out => Gain2_out1  -- single
              );

  u_nfp_exp_comp : nfp_exp_single
    PORT MAP( nfp_in => Gain2_out1,  -- single
              nfp_out => Exp_out1  -- single
              );

  u_nfp_mul_comp : nfp_mul_single
    PORT MAP( nfp_in1 => Subtract4_out1,  -- single
              nfp_in2 => Exp_out1,  -- single
              nfp_out => Product3_out1  -- single
              );

  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => Constant12_out1,  -- single
              nfp_in2 => Product3_out1,  -- single
              nfp_out => Add3_out1  -- single
              );

  u_nfp_mul_comp_1 : nfp_mul_single
    PORT MAP( nfp_in1 => Constant15_out1,  -- single
              nfp_in2 => Add3_out1,  -- single
              nfp_out => Product4_out1  -- single
              );

  u_nfp_relop_comp : nfp_relop_single_block1
    PORT MAP( nfp_in1 => Product4_out1,  -- single
              nfp_in2 => Upperlimit_out,  -- single
              nfp_out1 => LowerRelop_out
              );

  u_nfp_relop_comp_1 : nfp_relop_single
    PORT MAP( nfp_in1 => Product4_out1,  -- single
              nfp_in2 => Lowerlimit_out,  -- single
              nfp_out1 => UpperRelop_out
              );

  Constant15_out1 <= X"3b4557bf";

  Constant12_out1 <= X"3d4ccccd";

  Subtract4_out1 <= X"3f733333";

  Constant5_out1 <= X"3e164fe1";

  Upperlimit_out <= X"3b4557bf";

  Lowerlimit_out <= X"39f2ccc5";

  
  Switch1_out <= Product4_out1 WHEN UpperRelop_out = '0' ELSE
      Lowerlimit_out;

  
  Saturation_out1 <= Switch1_out WHEN LowerRelop_out = '0' ELSE
      Upperlimit_out;

  output <= Saturation_out1;

END rtl;
