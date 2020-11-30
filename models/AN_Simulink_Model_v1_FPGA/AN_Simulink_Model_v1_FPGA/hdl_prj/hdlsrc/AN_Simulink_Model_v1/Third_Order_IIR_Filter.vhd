-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\AN_Simulink_Model_v1\Third_Order_IIR_Filter.vhd
-- Created: 2020-04-16 16:05:25
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Third_Order_IIR_Filter
-- Source Path: AN_Simulink_Model_v1/Auditory Nerve Model/CP Wideband Gammatone Filter/Third Order IIR Filter
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Third_Order_IIR_Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Signal_In_re                      :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        Signal_In_im                      :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        wbgain                            :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        tauwb                             :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        Signal_Out_re                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        Signal_Out_im                     :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END Third_Order_IIR_Filter;


ARCHITECTURE rtl OF Third_Order_IIR_Filter IS

  -- Component Declarations
  COMPONENT nfp_add_single
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

  COMPONENT nfp_div_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_mul_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_sub_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : nfp_add_single
    USE ENTITY work.nfp_add_single(rtl);

  FOR ALL : nfp_gain_pow2_single
    USE ENTITY work.nfp_gain_pow2_single(rtl);

  FOR ALL : nfp_div_single
    USE ENTITY work.nfp_div_single(rtl);

  FOR ALL : nfp_mul_single
    USE ENTITY work.nfp_mul_single(rtl);

  FOR ALL : nfp_sub_single
    USE ENTITY work.nfp_sub_single(rtl);

  -- Signals
  SIGNAL Unit_Delay_out1_re               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay_out1_im               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant5_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const                   : std_logic;  -- ufix1
  SIGNAL pw2_shift_const                  : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL Product3_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant2_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL dtmp                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant3_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Add_out1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL c2LP                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product5_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product4_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product4_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL dtmp_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant4_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Subtract_out1                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL c1LP                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay1_out1_im              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product6_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay1_out1_re              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product6_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_2                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product7_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_2                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product7_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay3_out1_im              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product2_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_3                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_3                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay3_out1_re              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product2_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_4                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product8_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_4                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product8_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL c1LP_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay2_out1_im              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product9_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_5                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_5                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Unit_Delay2_out1_re              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product9_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => Signal_In_re,  -- single
              nfp_in2 => Unit_Delay_out1_re,  -- single
              nfp_out => nfp_out_1_re  -- single
              );

  u_nfp_gain_pow2_single : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => tauwb,  -- single
              nfp_in2 => pw2_sign_const,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const),  -- sfix9
              nfp_out => Product3_out1  -- single
              );

  u_nfp_div_comp : nfp_div_single
    PORT MAP( nfp_in1 => Product3_out1,  -- single
              nfp_in2 => Constant2_out1,  -- single
              nfp_out => dtmp  -- single
              );

  u_nfp_add_comp_1 : nfp_add_single
    PORT MAP( nfp_in1 => dtmp,  -- single
              nfp_in2 => Constant3_out1,  -- single
              nfp_out => Add_out1  -- single
              );

  u_nfp_div_comp_1 : nfp_div_single
    PORT MAP( nfp_in1 => Constant5_out1,  -- single
              nfp_in2 => Add_out1,  -- single
              nfp_out => c2LP  -- single
              );

  u_nfp_mul_comp : nfp_mul_single
    PORT MAP( nfp_in1 => c2LP,  -- single
              nfp_in2 => wbgain,  -- single
              nfp_out => Product5_out1  -- single
              );

  u_nfp_mul_comp_1 : nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_re,  -- single
              nfp_in2 => Product5_out1,  -- single
              nfp_out => Product4_Re  -- single
              );

  u_nfp_add_comp_2 : nfp_add_single
    PORT MAP( nfp_in1 => Signal_In_im,  -- single
              nfp_in2 => Unit_Delay_out1_im,  -- single
              nfp_out => nfp_out_1_im  -- single
              );

  u_nfp_mul_comp_2 : nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_im,  -- single
              nfp_in2 => Product5_out1,  -- single
              nfp_out => Product4_Im  -- single
              );

  u_nfp_sub_comp : nfp_sub_single
    PORT MAP( nfp_in1 => dtmp_1,  -- single
              nfp_in2 => Constant4_out1,  -- single
              nfp_out => Subtract_out1  -- single
              );

  u_nfp_div_comp_2 : nfp_div_single
    PORT MAP( nfp_in1 => Subtract_out1,  -- single
              nfp_in2 => Add_out1,  -- single
              nfp_out => c1LP  -- single
              );

  u_nfp_mul_comp_3 : nfp_mul_single
    PORT MAP( nfp_in1 => Unit_Delay1_out1_im,  -- single
              nfp_in2 => c1LP,  -- single
              nfp_out => Product6_Im  -- single
              );

  u_nfp_add_comp_3 : nfp_add_single
    PORT MAP( nfp_in1 => Product4_Im,  -- single
              nfp_in2 => Product6_Im,  -- single
              nfp_out => nfp_out_1_im_1  -- single
              );

  u_nfp_mul_comp_4 : nfp_mul_single
    PORT MAP( nfp_in1 => Unit_Delay1_out1_re,  -- single
              nfp_in2 => c1LP,  -- single
              nfp_out => Product6_Re  -- single
              );

  u_nfp_add_comp_4 : nfp_add_single
    PORT MAP( nfp_in1 => Product4_Re,  -- single
              nfp_in2 => Product6_Re,  -- single
              nfp_out => nfp_out_1_re_1  -- single
              );

  u_nfp_add_comp_5 : nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_re_1,  -- single
              nfp_in2 => Unit_Delay1_out1_re,  -- single
              nfp_out => nfp_out_1_re_2  -- single
              );

  u_nfp_mul_comp_5 : nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_re_2,  -- single
              nfp_in2 => Product5_out1,  -- single
              nfp_out => Product7_Re  -- single
              );

  u_nfp_add_comp_6 : nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_im_1,  -- single
              nfp_in2 => Unit_Delay1_out1_im,  -- single
              nfp_out => nfp_out_1_im_2  -- single
              );

  u_nfp_mul_comp_6 : nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_im_2,  -- single
              nfp_in2 => Product5_out1,  -- single
              nfp_out => Product7_Im  -- single
              );

  u_nfp_mul_comp_7 : nfp_mul_single
    PORT MAP( nfp_in1 => Unit_Delay3_out1_im,  -- single
              nfp_in2 => c1LP,  -- single
              nfp_out => Product2_Im  -- single
              );

  u_nfp_add_comp_7 : nfp_add_single
    PORT MAP( nfp_in1 => Product7_Im,  -- single
              nfp_in2 => Product2_Im,  -- single
              nfp_out => nfp_out_1_im_3  -- single
              );

  u_nfp_mul_comp_8 : nfp_mul_single
    PORT MAP( nfp_in1 => Unit_Delay3_out1_re,  -- single
              nfp_in2 => c1LP,  -- single
              nfp_out => Product2_Re  -- single
              );

  u_nfp_add_comp_8 : nfp_add_single
    PORT MAP( nfp_in1 => Product7_Re,  -- single
              nfp_in2 => Product2_Re,  -- single
              nfp_out => nfp_out_1_re_3  -- single
              );

  u_nfp_add_comp_9 : nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_re_3,  -- single
              nfp_in2 => Unit_Delay3_out1_re,  -- single
              nfp_out => nfp_out_1_re_4  -- single
              );

  u_nfp_mul_comp_9 : nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_re_4,  -- single
              nfp_in2 => Product5_out1,  -- single
              nfp_out => Product8_Re  -- single
              );

  u_nfp_add_comp_10 : nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_im_3,  -- single
              nfp_in2 => Unit_Delay3_out1_im,  -- single
              nfp_out => nfp_out_1_im_4  -- single
              );

  u_nfp_mul_comp_10 : nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_im_4,  -- single
              nfp_in2 => Product5_out1,  -- single
              nfp_out => Product8_Im  -- single
              );

  u_nfp_mul_comp_11 : nfp_mul_single
    PORT MAP( nfp_in1 => Unit_Delay2_out1_im,  -- single
              nfp_in2 => c1LP_1,  -- single
              nfp_out => Product9_Im  -- single
              );

  u_nfp_add_comp_11 : nfp_add_single
    PORT MAP( nfp_in1 => Product8_Im,  -- single
              nfp_in2 => Product9_Im,  -- single
              nfp_out => nfp_out_1_im_5  -- single
              );

  u_nfp_mul_comp_12 : nfp_mul_single
    PORT MAP( nfp_in1 => Unit_Delay2_out1_re,  -- single
              nfp_in2 => c1LP,  -- single
              nfp_out => Product9_Re  -- single
              );

  u_nfp_add_comp_12 : nfp_add_single
    PORT MAP( nfp_in1 => Product8_Re,  -- single
              nfp_in2 => Product9_Re,  -- single
              nfp_out => nfp_out_1_re_5  -- single
              );

  Unit_Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_out1_re <= X"00000000";
      Unit_Delay_out1_im <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay_out1_re <= Signal_In_re;
        Unit_Delay_out1_im <= Signal_In_im;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Constant5_out1 <= X"3f800000";

  pw2_sign_const <= '0';

  pw2_shift_const <= to_signed(16#001#, 9);

  Constant2_out1 <= X"37aec33e";

  Constant3_out1 <= X"3f800000";

  dtmp_1 <= dtmp;

  Constant4_out1 <= X"3f800000";

  Unit_Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay1_out1_re <= X"00000000";
      Unit_Delay1_out1_im <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay1_out1_re <= nfp_out_1_re_1;
        Unit_Delay1_out1_im <= nfp_out_1_im_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  Unit_Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay3_out1_re <= X"00000000";
      Unit_Delay3_out1_im <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay3_out1_re <= nfp_out_1_re_3;
        Unit_Delay3_out1_im <= nfp_out_1_im_3;
      END IF;
    END IF;
  END PROCESS Unit_Delay3_process;


  c1LP_1 <= c1LP;

  Unit_Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay2_out1_re <= X"00000000";
      Unit_Delay2_out1_im <= X"00000000";
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay2_out1_re <= nfp_out_1_re_5;
        Unit_Delay2_out1_im <= nfp_out_1_im_5;
      END IF;
    END IF;
  END PROCESS Unit_Delay2_process;


  Signal_Out_re <= nfp_out_1_re_5;

  Signal_Out_im <= nfp_out_1_im_5;

END rtl;
