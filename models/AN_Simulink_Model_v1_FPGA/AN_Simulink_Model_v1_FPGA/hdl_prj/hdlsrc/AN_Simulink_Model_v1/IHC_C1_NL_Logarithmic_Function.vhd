-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\AN_Simulink_Model_v1\IHC_C1_NL_Logarithmic_Function.vhd
-- Created: 2020-04-16 16:05:26
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IHC_C1_NL_Logarithmic_Function
-- Source Path: AN_Simulink_Model_v1/Auditory Nerve Model/Subsystem/IHC C1 NL Logarithmic Function
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IHC_C1_NL_Logarithmic_Function IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        stimulus                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        output                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END IHC_C1_NL_Logarithmic_Function;


ARCHITECTURE rtl OF IHC_C1_NL_Logarithmic_Function IS

  -- Component Declarations
  COMPONENT nfp_relop_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out1                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT nfp_abs_single
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

  COMPONENT nfp_log_single
    PORT( nfp_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT Subsystem1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          x                               :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          In2                             :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          Enable                          :   IN    std_logic;
          Out1                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : nfp_relop_single
    USE ENTITY work.nfp_relop_single(rtl);

  FOR ALL : nfp_abs_single
    USE ENTITY work.nfp_abs_single(rtl);

  FOR ALL : nfp_mul_single
    USE ENTITY work.nfp_mul_single(rtl);

  FOR ALL : nfp_add_single
    USE ENTITY work.nfp_add_single(rtl);

  FOR ALL : nfp_log_single
    USE ENTITY work.nfp_log_single(rtl);

  FOR ALL : Subsystem1
    USE ENTITY work.Subsystem1(rtl);

  -- Signals
  SIGNAL const                            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Compare_To_Zero1_out1            : std_logic;
  SIGNAL Abs1_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant1_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product3_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant2_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add1_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Log1_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant3_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product4_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subsystem1_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Switch1_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  -- Nonlinear log

  u_nfp_relop_comp : nfp_relop_single
    PORT MAP( nfp_in1 => stimulus,  -- single
              nfp_in2 => const,  -- single
              nfp_out1 => Compare_To_Zero1_out1
              );

  u_nfp_abs_comp : nfp_abs_single
    PORT MAP( nfp_in => stimulus,  -- single
              nfp_out => Abs1_out1  -- single
              );

  u_nfp_mul_comp : nfp_mul_single
    PORT MAP( nfp_in1 => Abs1_out1,  -- single
              nfp_in2 => Constant1_out1,  -- single
              nfp_out => Product3_out1  -- single
              );

  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => Product3_out1,  -- single
              nfp_in2 => Constant2_out1,  -- single
              nfp_out => Add1_out1  -- single
              );

  u_nfp_log_comp : nfp_log_single
    PORT MAP( nfp_in => Add1_out1,  -- single
              nfp_out => Log1_out1  -- single
              );

  u_nfp_mul_comp_1 : nfp_mul_single
    PORT MAP( nfp_in1 => Log1_out1,  -- single
              nfp_in2 => Constant3_out1,  -- single
              nfp_out => Product4_out1  -- single
              );

  u_Subsystem1 : Subsystem1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              x => stimulus,  -- single
              In2 => Product4_out1,  -- single
              Enable => Compare_To_Zero1_out1,
              Out1 => Subsystem1_out1  -- single
              );

  const <= X"00000000";

  Constant1_out1 <= X"44fa0000";

  Constant2_out1 <= X"3f800000";

  Constant3_out1 <= X"3dcccccd";

  
  Switch1_out1 <= Product4_out1 WHEN Compare_To_Zero1_out1 = '0' ELSE
      Subsystem1_out1;

  output <= Switch1_out1;

END rtl;

