-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\AN_Simulink_Model_v1\Get_C1_Coefficients.vhd
-- Created: 2020-04-16 16:05:25
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Get_C1_Coefficients
-- Source Path: AN_Simulink_Model_v1/Auditory Nerve Model/C1 Chirp Filter/Get C1 Coefficients
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Get_C1_Coefficients IS
  PORT( rsigma                            :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        b0_5                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b0_3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b0_1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b1_5                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b1_3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b1_1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b2_5                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b2_3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        b2_1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        a2_5                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        a2_3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        a2_1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        a1_1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        a1_3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        a1_5                              :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END Get_C1_Coefficients;


ARCHITECTURE rtl OF Get_C1_Coefficients IS

  -- Component Declarations
  COMPONENT nfp_sub_single
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

  COMPONENT nfp_div_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_atan_single
    PORT( nfp_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_add2_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_gain_pow2_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic;  -- ufix1
          nfp_in3                         :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix9
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_add_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_tan_single
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

  -- Component Configuration Statements
  FOR ALL : nfp_sub_single
    USE ENTITY work.nfp_sub_single(rtl);

  FOR ALL : nfp_uminus_single
    USE ENTITY work.nfp_uminus_single(rtl);

  FOR ALL : nfp_div_single
    USE ENTITY work.nfp_div_single(rtl);

  FOR ALL : nfp_atan_single
    USE ENTITY work.nfp_atan_single(rtl);

  FOR ALL : nfp_add2_single
    USE ENTITY work.nfp_add2_single(rtl);

  FOR ALL : nfp_gain_pow2_single
    USE ENTITY work.nfp_gain_pow2_single(rtl);

  FOR ALL : nfp_add_single
    USE ENTITY work.nfp_add_single(rtl);

  FOR ALL : nfp_tan_single
    USE ENTITY work.nfp_tan_single(rtl);

  FOR ALL : nfp_mul_single
    USE ENTITY work.nfp_mul_single(rtl);

  -- Signals
  SIGNAL Constant49_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add3_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant32_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL p5real                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain3_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract3_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide4_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Trigonometric_Function_out1      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide1_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Trigonometric_Function3_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract6_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add2_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant33_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL p3real                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain2_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract4_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add1_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant31_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL p1real                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain1_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract5_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide6_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Trigonometric_Function2_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide3_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Trigonometric_Function5_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract8_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant47_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const                   : std_logic;  -- ufix1
  SIGNAL pw2_shift_const                  : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL Gain5_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide5_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Trigonometric_Function1_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide2_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Trigonometric_Function4_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract7_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add4_op_stage2                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const_1                 : std_logic;  -- ufix1
  SIGNAL pw2_shift_const_1                : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL Gain4_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL phase                            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract9_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant46_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain6_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant48_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Divide7_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Trigonometric_Function6_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rzero                            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL rzero_1                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL b0                               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL b0_2                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant62_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL p5real_1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract11_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product37_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product33_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL temp_5                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL temp_5_1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant63_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL p3real_1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract12_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product38_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product32_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL temp_3                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant64_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL p1real_1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract13_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product39_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product31_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL temp_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const_2                 : std_logic;  -- ufix1
  SIGNAL pw2_shift_const_2                : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL b1                               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL b1_2                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant51_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL b2                               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL b2_2                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant53_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add6_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product29_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL a2_5_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant54_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add7_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product28_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL a2_3_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant55_out1                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add8_out1                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product30_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL a2_1_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product27_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add12_op_stage2                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product34_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add12_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain10_out1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const_3                 : std_logic;  -- ufix1
  SIGNAL pw2_shift_const_3                : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL a1_1_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL temp_1_1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add13_op_stage2                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product35_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add13_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain9_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const_4                 : std_logic;  -- ufix1
  SIGNAL pw2_shift_const_4                : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL a1_3_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL temp_3_1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add14_op_stage2                  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product36_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add14_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Gain14_out1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const_5                 : std_logic;  -- ufix1
  SIGNAL pw2_shift_const_5                : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL a1_5_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  -- Calculate Phase from Pole Locations
  -- 
  -- Shift the Real Part of the Pole Locations according to rsigma
  -- 
  -- Add Initial Phase
  -- 
  -- Calculate rzero
  -- 
  -- Convert Poles to Digital Spcae and Find Associated Filter Coefficients
  -- 
  -- C1 Coefficients at the Output (Note that there are only three sets of second order coefficients for the five second 
  -- order sections. This is due to the fact that two sets are used twice in the C1 filter

  u_nfp_sub_comp : nfp_sub_single
    PORT MAP( nfp_in1 => Constant32_out1,  -- single
              nfp_in2 => rsigma,  -- single
              nfp_out => p5real  -- single
              );

  u_nfp_uminus_comp : nfp_uminus_single
    PORT MAP( nfp_in => p5real,  -- single
              nfp_out => Gain3_out1  -- single
              );

  u_nfp_div_comp : nfp_div_single
    PORT MAP( nfp_in1 => Add3_out1,  -- single
              nfp_in2 => Gain3_out1,  -- single
              nfp_out => Divide4_out1  -- single
              );

  u_nfp_atan_comp : nfp_atan_single
    PORT MAP( nfp_in => Divide4_out1,  -- single
              nfp_out => Trigonometric_Function_out1  -- single
              );

  u_nfp_div_comp_1 : nfp_div_single
    PORT MAP( nfp_in1 => Subtract3_out1,  -- single
              nfp_in2 => Gain3_out1,  -- single
              nfp_out => Divide1_out1  -- single
              );

  u_nfp_atan_comp_1 : nfp_atan_single
    PORT MAP( nfp_in => Divide1_out1,  -- single
              nfp_out => Trigonometric_Function3_out1  -- single
              );

  u_nfp_add2_comp : nfp_add2_single
    PORT MAP( nfp_in1 => Trigonometric_Function_out1,  -- single
              nfp_in2 => Trigonometric_Function3_out1,  -- single
              nfp_out => Subtract6_out1  -- single
              );

  u_nfp_sub_comp_1 : nfp_sub_single
    PORT MAP( nfp_in1 => Constant33_out1,  -- single
              nfp_in2 => rsigma,  -- single
              nfp_out => p3real  -- single
              );

  u_nfp_uminus_comp_1 : nfp_uminus_single
    PORT MAP( nfp_in => p3real,  -- single
              nfp_out => Gain2_out1  -- single
              );

  u_nfp_sub_comp_2 : nfp_sub_single
    PORT MAP( nfp_in1 => Constant31_out1,  -- single
              nfp_in2 => rsigma,  -- single
              nfp_out => p1real  -- single
              );

  u_nfp_uminus_comp_2 : nfp_uminus_single
    PORT MAP( nfp_in => p1real,  -- single
              nfp_out => Gain1_out1  -- single
              );

  u_nfp_div_comp_2 : nfp_div_single
    PORT MAP( nfp_in1 => Add1_out1,  -- single
              nfp_in2 => Gain1_out1,  -- single
              nfp_out => Divide6_out1  -- single
              );

  u_nfp_atan_comp_2 : nfp_atan_single
    PORT MAP( nfp_in => Divide6_out1,  -- single
              nfp_out => Trigonometric_Function2_out1  -- single
              );

  u_nfp_div_comp_3 : nfp_div_single
    PORT MAP( nfp_in1 => Subtract5_out1,  -- single
              nfp_in2 => Gain1_out1,  -- single
              nfp_out => Divide3_out1  -- single
              );

  u_nfp_atan_comp_3 : nfp_atan_single
    PORT MAP( nfp_in => Divide3_out1,  -- single
              nfp_out => Trigonometric_Function5_out1  -- single
              );

  u_nfp_add2_comp_1 : nfp_add2_single
    PORT MAP( nfp_in1 => Trigonometric_Function2_out1,  -- single
              nfp_in2 => Trigonometric_Function5_out1,  -- single
              nfp_out => Subtract8_out1  -- single
              );

  u_nfp_gain_pow2_single : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => Subtract6_out1,  -- single
              nfp_in2 => pw2_sign_const,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const),  -- sfix9
              nfp_out => Gain5_out1  -- single
              );

  u_nfp_div_comp_4 : nfp_div_single
    PORT MAP( nfp_in1 => Add2_out1,  -- single
              nfp_in2 => Gain2_out1,  -- single
              nfp_out => Divide5_out1  -- single
              );

  u_nfp_atan_comp_4 : nfp_atan_single
    PORT MAP( nfp_in => Divide5_out1,  -- single
              nfp_out => Trigonometric_Function1_out1  -- single
              );

  u_nfp_div_comp_5 : nfp_div_single
    PORT MAP( nfp_in1 => Subtract4_out1,  -- single
              nfp_in2 => Gain2_out1,  -- single
              nfp_out => Divide2_out1  -- single
              );

  u_nfp_atan_comp_5 : nfp_atan_single
    PORT MAP( nfp_in => Divide2_out1,  -- single
              nfp_out => Trigonometric_Function4_out1  -- single
              );

  u_nfp_add2_comp_2 : nfp_add2_single
    PORT MAP( nfp_in1 => Trigonometric_Function1_out1,  -- single
              nfp_in2 => Trigonometric_Function4_out1,  -- single
              nfp_out => Subtract7_out1  -- single
              );

  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => Gain5_out1,  -- single
              nfp_in2 => Subtract7_out1,  -- single
              nfp_out => Add4_op_stage2  -- single
              );

  u_nfp_gain_pow2_single_1 : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => Subtract8_out1,  -- single
              nfp_in2 => pw2_sign_const_1,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const_1),  -- sfix9
              nfp_out => Gain4_out1  -- single
              );

  u_nfp_add_comp_1 : nfp_add_single
    PORT MAP( nfp_in1 => Add4_op_stage2,  -- single
              nfp_in2 => Gain4_out1,  -- single
              nfp_out => phase  -- single
              );

  u_nfp_sub_comp_3 : nfp_sub_single
    PORT MAP( nfp_in1 => Constant47_out1,  -- single
              nfp_in2 => phase,  -- single
              nfp_out => Subtract9_out1  -- single
              );

  u_nfp_uminus_comp_3 : nfp_uminus_single
    PORT MAP( nfp_in => Constant46_out1,  -- single
              nfp_out => Gain6_out1  -- single
              );

  u_nfp_div_comp_6 : nfp_div_single
    PORT MAP( nfp_in1 => Subtract9_out1,  -- single
              nfp_in2 => Constant48_out1,  -- single
              nfp_out => Divide7_out1  -- single
              );

  u_nfp_tan_comp : nfp_tan_single
    PORT MAP( nfp_in => Divide7_out1,  -- single
              nfp_out => Trigonometric_Function6_out1  -- single
              );

  u_nfp_div_comp_7 : nfp_div_single
    PORT MAP( nfp_in1 => Gain6_out1,  -- single
              nfp_in2 => Trigonometric_Function6_out1,  -- single
              nfp_out => rzero  -- single
              );

  u_nfp_sub_comp_4 : nfp_sub_single
    PORT MAP( nfp_in1 => Constant49_out1,  -- single
              nfp_in2 => rzero_1,  -- single
              nfp_out => b0  -- single
              );

  u_nfp_sub_comp_5 : nfp_sub_single
    PORT MAP( nfp_in1 => Constant62_out1,  -- single
              nfp_in2 => p5real_1,  -- single
              nfp_out => Subtract11_out1  -- single
              );

  u_nfp_mul_comp : nfp_mul_single
    PORT MAP( nfp_in1 => Subtract11_out1,  -- single
              nfp_in2 => Subtract11_out1,  -- single
              nfp_out => Product37_out1  -- single
              );

  u_nfp_add_comp_2 : nfp_add_single
    PORT MAP( nfp_in1 => Product37_out1,  -- single
              nfp_in2 => Product33_out1,  -- single
              nfp_out => temp_5  -- single
              );

  u_nfp_div_comp_8 : nfp_div_single
    PORT MAP( nfp_in1 => b0_2,  -- single
              nfp_in2 => temp_5_1,  -- single
              nfp_out => b0_5  -- single
              );

  u_nfp_sub_comp_6 : nfp_sub_single
    PORT MAP( nfp_in1 => Constant63_out1,  -- single
              nfp_in2 => p3real_1,  -- single
              nfp_out => Subtract12_out1  -- single
              );

  u_nfp_mul_comp_1 : nfp_mul_single
    PORT MAP( nfp_in1 => Subtract12_out1,  -- single
              nfp_in2 => Subtract12_out1,  -- single
              nfp_out => Product38_out1  -- single
              );

  u_nfp_add_comp_3 : nfp_add_single
    PORT MAP( nfp_in1 => Product38_out1,  -- single
              nfp_in2 => Product32_out1,  -- single
              nfp_out => temp_3  -- single
              );

  u_nfp_div_comp_9 : nfp_div_single
    PORT MAP( nfp_in1 => b0,  -- single
              nfp_in2 => temp_3,  -- single
              nfp_out => b0_3  -- single
              );

  u_nfp_sub_comp_7 : nfp_sub_single
    PORT MAP( nfp_in1 => Constant64_out1,  -- single
              nfp_in2 => p1real_1,  -- single
              nfp_out => Subtract13_out1  -- single
              );

  u_nfp_mul_comp_2 : nfp_mul_single
    PORT MAP( nfp_in1 => Subtract13_out1,  -- single
              nfp_in2 => Subtract13_out1,  -- single
              nfp_out => Product39_out1  -- single
              );

  u_nfp_add_comp_4 : nfp_add_single
    PORT MAP( nfp_in1 => Product39_out1,  -- single
              nfp_in2 => Product31_out1,  -- single
              nfp_out => temp_1  -- single
              );

  u_nfp_div_comp_10 : nfp_div_single
    PORT MAP( nfp_in1 => b0,  -- single
              nfp_in2 => temp_1,  -- single
              nfp_out => b0_1  -- single
              );

  u_nfp_gain_pow2_single_2 : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => rzero,  -- single
              nfp_in2 => pw2_sign_const_2,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const_2),  -- sfix9
              nfp_out => b1  -- single
              );

  u_nfp_div_comp_11 : nfp_div_single
    PORT MAP( nfp_in1 => b1,  -- single
              nfp_in2 => temp_5,  -- single
              nfp_out => b1_5  -- single
              );

  u_nfp_div_comp_12 : nfp_div_single
    PORT MAP( nfp_in1 => b1,  -- single
              nfp_in2 => temp_3,  -- single
              nfp_out => b1_3  -- single
              );

  u_nfp_div_comp_13 : nfp_div_single
    PORT MAP( nfp_in1 => b1_2,  -- single
              nfp_in2 => temp_1,  -- single
              nfp_out => b1_1  -- single
              );

  u_nfp_add2_comp_3 : nfp_add2_single
    PORT MAP( nfp_in1 => rzero,  -- single
              nfp_in2 => Constant51_out1,  -- single
              nfp_out => b2  -- single
              );

  u_nfp_div_comp_14 : nfp_div_single
    PORT MAP( nfp_in1 => b2,  -- single
              nfp_in2 => temp_5,  -- single
              nfp_out => b2_5  -- single
              );

  u_nfp_div_comp_15 : nfp_div_single
    PORT MAP( nfp_in1 => b2,  -- single
              nfp_in2 => temp_3,  -- single
              nfp_out => b2_3  -- single
              );

  u_nfp_div_comp_16 : nfp_div_single
    PORT MAP( nfp_in1 => b2_2,  -- single
              nfp_in2 => temp_1,  -- single
              nfp_out => b2_1  -- single
              );

  u_nfp_add_comp_5 : nfp_add_single
    PORT MAP( nfp_in1 => Constant53_out1,  -- single
              nfp_in2 => p5real,  -- single
              nfp_out => Add6_out1  -- single
              );

  u_nfp_mul_comp_3 : nfp_mul_single
    PORT MAP( nfp_in1 => Add6_out1,  -- single
              nfp_in2 => Add6_out1,  -- single
              nfp_out => Product29_out1  -- single
              );

  u_nfp_add_comp_6 : nfp_add_single
    PORT MAP( nfp_in1 => Product33_out1,  -- single
              nfp_in2 => Product29_out1,  -- single
              nfp_out => a2_5_1  -- single
              );

  u_nfp_div_comp_17 : nfp_div_single
    PORT MAP( nfp_in1 => a2_5_1,  -- single
              nfp_in2 => temp_5,  -- single
              nfp_out => a2_5  -- single
              );

  u_nfp_add_comp_7 : nfp_add_single
    PORT MAP( nfp_in1 => Constant54_out1,  -- single
              nfp_in2 => p3real,  -- single
              nfp_out => Add7_out1  -- single
              );

  u_nfp_mul_comp_4 : nfp_mul_single
    PORT MAP( nfp_in1 => Add7_out1,  -- single
              nfp_in2 => Add7_out1,  -- single
              nfp_out => Product28_out1  -- single
              );

  u_nfp_add_comp_8 : nfp_add_single
    PORT MAP( nfp_in1 => Product32_out1,  -- single
              nfp_in2 => Product28_out1,  -- single
              nfp_out => a2_3_1  -- single
              );

  u_nfp_div_comp_18 : nfp_div_single
    PORT MAP( nfp_in1 => a2_3_1,  -- single
              nfp_in2 => temp_3,  -- single
              nfp_out => a2_3  -- single
              );

  u_nfp_add_comp_9 : nfp_add_single
    PORT MAP( nfp_in1 => Constant55_out1,  -- single
              nfp_in2 => p1real,  -- single
              nfp_out => Add8_out1  -- single
              );

  u_nfp_mul_comp_5 : nfp_mul_single
    PORT MAP( nfp_in1 => Add8_out1,  -- single
              nfp_in2 => Add8_out1,  -- single
              nfp_out => Product30_out1  -- single
              );

  u_nfp_add_comp_10 : nfp_add_single
    PORT MAP( nfp_in1 => Product31_out1,  -- single
              nfp_in2 => Product30_out1,  -- single
              nfp_out => a2_1_1  -- single
              );

  u_nfp_div_comp_19 : nfp_div_single
    PORT MAP( nfp_in1 => a2_1_1,  -- single
              nfp_in2 => temp_1,  -- single
              nfp_out => a2_1  -- single
              );

  u_nfp_sub_comp_8 : nfp_sub_single
    PORT MAP( nfp_in1 => Product27_out1,  -- single
              nfp_in2 => Product31_out1,  -- single
              nfp_out => Add12_op_stage2  -- single
              );

  u_nfp_mul_comp_6 : nfp_mul_single
    PORT MAP( nfp_in1 => p1real,  -- single
              nfp_in2 => p1real,  -- single
              nfp_out => Product34_out1  -- single
              );

  u_nfp_sub_comp_9 : nfp_sub_single
    PORT MAP( nfp_in1 => Add12_op_stage2,  -- single
              nfp_in2 => Product34_out1,  -- single
              nfp_out => Add12_out1  -- single
              );

  u_nfp_uminus_comp_4 : nfp_uminus_single
    PORT MAP( nfp_in => Add12_out1,  -- single
              nfp_out => Gain10_out1  -- single
              );

  u_nfp_gain_pow2_single_3 : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => Gain10_out1,  -- single
              nfp_in2 => pw2_sign_const_3,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const_3),  -- sfix9
              nfp_out => a1_1_1  -- single
              );

  u_nfp_div_comp_20 : nfp_div_single
    PORT MAP( nfp_in1 => a1_1_1,  -- single
              nfp_in2 => temp_1_1,  -- single
              nfp_out => a1_1  -- single
              );

  u_nfp_sub_comp_10 : nfp_sub_single
    PORT MAP( nfp_in1 => Product27_out1,  -- single
              nfp_in2 => Product32_out1,  -- single
              nfp_out => Add13_op_stage2  -- single
              );

  u_nfp_mul_comp_7 : nfp_mul_single
    PORT MAP( nfp_in1 => p3real,  -- single
              nfp_in2 => p3real,  -- single
              nfp_out => Product35_out1  -- single
              );

  u_nfp_sub_comp_11 : nfp_sub_single
    PORT MAP( nfp_in1 => Add13_op_stage2,  -- single
              nfp_in2 => Product35_out1,  -- single
              nfp_out => Add13_out1  -- single
              );

  u_nfp_uminus_comp_5 : nfp_uminus_single
    PORT MAP( nfp_in => Add13_out1,  -- single
              nfp_out => Gain9_out1  -- single
              );

  u_nfp_gain_pow2_single_4 : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => Gain9_out1,  -- single
              nfp_in2 => pw2_sign_const_4,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const_4),  -- sfix9
              nfp_out => a1_3_1  -- single
              );

  u_nfp_div_comp_21 : nfp_div_single
    PORT MAP( nfp_in1 => a1_3_1,  -- single
              nfp_in2 => temp_3_1,  -- single
              nfp_out => a1_3  -- single
              );

  u_nfp_sub_comp_12 : nfp_sub_single
    PORT MAP( nfp_in1 => Product27_out1,  -- single
              nfp_in2 => Product33_out1,  -- single
              nfp_out => Add14_op_stage2  -- single
              );

  u_nfp_mul_comp_8 : nfp_mul_single
    PORT MAP( nfp_in1 => p5real,  -- single
              nfp_in2 => p5real,  -- single
              nfp_out => Product36_out1  -- single
              );

  u_nfp_sub_comp_13 : nfp_sub_single
    PORT MAP( nfp_in1 => Add14_op_stage2,  -- single
              nfp_in2 => Product36_out1,  -- single
              nfp_out => Add14_out1  -- single
              );

  u_nfp_uminus_comp_6 : nfp_uminus_single
    PORT MAP( nfp_in => Add14_out1,  -- single
              nfp_out => Gain14_out1  -- single
              );

  u_nfp_gain_pow2_single_5 : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => Gain14_out1,  -- single
              nfp_in2 => pw2_sign_const_5,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const_5),  -- sfix9
              nfp_out => a1_5_1  -- single
              );

  u_nfp_div_comp_22 : nfp_div_single
    PORT MAP( nfp_in1 => a1_5_1,  -- single
              nfp_in2 => temp_5,  -- single
              nfp_out => a1_5  -- single
              );

  Constant49_out1 <= X"47bb3b71";

  Add3_out1 <= X"463ecc36";

  Constant32_out1 <= X"c58072f9";

  Subtract3_out1 <= X"43b1a8d0";

  Add2_out1 <= X"4641ac82";

  Constant33_out1 <= X"c50ad3b6";

  Subtract4_out1 <= X"432b3e60";

  Add1_out1 <= X"46448cd0";

  Constant31_out1 <= X"c3a60bcf";

  Subtract5_out1 <= X"c14d4e00";

  Constant47_out1 <= X"c039295e";

  pw2_sign_const <= '0';

  pw2_shift_const <= to_signed(16#001#, 9);

  pw2_sign_const_1 <= '0';

  pw2_shift_const_1 <= to_signed(16#001#, 9);

  Constant46_out1 <= X"45c4597c";

  Constant48_out1 <= X"40a00000";

  rzero_1 <= rzero;

  b0_2 <= b0;

  Constant62_out1 <= X"47bb3b71";

  p5real_1 <= p5real;

  Product33_out1 <= X"4c060c05";

  temp_5_1 <= temp_5;

  Constant63_out1 <= X"47bb3b71";

  p3real_1 <= p3real;

  Product32_out1 <= X"4c0e804e";

  Constant64_out1 <= X"47bb3b71";

  p1real_1 <= p1real;

  Product31_out1 <= X"4c1736c6";

  pw2_sign_const_2 <= '1';

  pw2_shift_const_2 <= to_signed(16#001#, 9);

  b1_2 <= b1;

  Constant51_out1 <= X"47bb3b71";

  b2_2 <= b2;

  Constant53_out1 <= X"47bb3b71";

  Constant54_out1 <= X"47bb3b71";

  Constant55_out1 <= X"47bb3b71";

  Product27_out1 <= X"5008efe5";

  pw2_sign_const_3 <= '0';

  pw2_shift_const_3 <= to_signed(16#001#, 9);

  temp_1_1 <= temp_1;

  pw2_sign_const_4 <= '0';

  pw2_shift_const_4 <= to_signed(16#001#, 9);

  temp_3_1 <= temp_3;

  pw2_sign_const_5 <= '0';

  pw2_shift_const_5 <= to_signed(16#001#, 9);

END rtl;

