-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\control_path_sim\cp_wideband_gammatone_filter\cp_wideband_gammatone_filter_Third_Order_IIR_Filter.vhd
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: cp_wideband_gammatone_filter_Third_Order_IIR_Filter
-- Source Path: cp_wideband_gammatone_filter/Third Order IIR Filter
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY cp_wideband_gammatone_filter_Third_Order_IIR_Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_1024_0                      :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_1024_1                      :   IN    std_logic;
        Signal_In_re                      :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        Signal_In_im                      :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        wbgain                            :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        tauwb                             :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        Signal_Out_re                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
        Signal_Out_im                     :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END cp_wideband_gammatone_filter_Third_Order_IIR_Filter;


ARCHITECTURE rtl OF cp_wideband_gammatone_filter_Third_Order_IIR_Filter IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT cp_wideband_gammatone_filter_nfp_add_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  COMPONENT cp_wideband_gammatone_filter_nfp_gain_pow2_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_in2                         :   IN    std_logic;  -- ufix1
          nfp_in3                         :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  COMPONENT cp_wideband_gammatone_filter_nfp_div_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  COMPONENT cp_wideband_gammatone_filter_nfp_mul_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  COMPONENT cp_wideband_gammatone_filter_nfp_sub_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : cp_wideband_gammatone_filter_nfp_add_single
    USE ENTITY work.cp_wideband_gammatone_filter_nfp_add_single(rtl);

  FOR ALL : cp_wideband_gammatone_filter_nfp_gain_pow2_single
    USE ENTITY work.cp_wideband_gammatone_filter_nfp_gain_pow2_single(rtl);

  FOR ALL : cp_wideband_gammatone_filter_nfp_div_single
    USE ENTITY work.cp_wideband_gammatone_filter_nfp_div_single(rtl);

  FOR ALL : cp_wideband_gammatone_filter_nfp_mul_single
    USE ENTITY work.cp_wideband_gammatone_filter_nfp_mul_single(rtl);

  FOR ALL : cp_wideband_gammatone_filter_nfp_sub_single
    USE ENTITY work.cp_wideband_gammatone_filter_nfp_sub_single(rtl);

  -- Signals
  SIGNAL Delay3_out1_re                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay3_out1_im                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
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
  SIGNAL c1LP_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum2_out1_im                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay_out1_im                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product6_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum2_out1_re                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum2_out1_im_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay_bypass_reg_re              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay_bypass_reg_im              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum2_out1_re_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay_out1_re                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product6_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_2                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product7_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_2                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product7_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum4_out1_im                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay1_out1_im                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product2_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_3                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_3                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum4_out1_re                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum4_out1_im_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay1_bypass_reg_re             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay1_bypass_reg_im             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum4_out1_re_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay1_out1_re                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product2_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_4                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product8_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_4                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product8_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum6_out1_im                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product9_Im                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_im_5                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum6_out1_re                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum6_out1_im_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay2_bypass_reg_re             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay2_bypass_reg_im             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Sum6_out1_re_1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Product9_Re                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL nfp_out_1_re_5                   : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_nfp_add_comp : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Signal_In_re,  -- ufix32
              nfp_in2 => Delay3_out1_re,  -- ufix32
              nfp_out => nfp_out_1_re  -- ufix32
              );

  u_nfp_gain_pow2_single : cp_wideband_gammatone_filter_nfp_gain_pow2_single
    PORT MAP( nfp_in1 => tauwb,  -- ufix32
              nfp_in2 => pw2_sign_const,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const),  -- ufix9
              nfp_out => Product3_out1  -- ufix32
              );

  u_nfp_div_comp : cp_wideband_gammatone_filter_nfp_div_single
    PORT MAP( nfp_in1 => Product3_out1,  -- ufix32
              nfp_in2 => Constant2_out1,  -- ufix32
              nfp_out => dtmp  -- ufix32
              );

  u_nfp_add_comp_1 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => dtmp,  -- ufix32
              nfp_in2 => Constant3_out1,  -- ufix32
              nfp_out => Add_out1  -- ufix32
              );

  u_nfp_div_comp_1 : cp_wideband_gammatone_filter_nfp_div_single
    PORT MAP( nfp_in1 => Constant5_out1,  -- ufix32
              nfp_in2 => Add_out1,  -- ufix32
              nfp_out => c2LP  -- ufix32
              );

  u_nfp_mul_comp : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => c2LP,  -- ufix32
              nfp_in2 => wbgain,  -- ufix32
              nfp_out => Product5_out1  -- ufix32
              );

  u_nfp_mul_comp_1 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_re,  -- ufix32
              nfp_in2 => Product5_out1,  -- ufix32
              nfp_out => Product4_Re  -- ufix32
              );

  u_nfp_add_comp_2 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Signal_In_im,  -- ufix32
              nfp_in2 => Delay3_out1_im,  -- ufix32
              nfp_out => nfp_out_1_im  -- ufix32
              );

  u_nfp_mul_comp_2 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_im,  -- ufix32
              nfp_in2 => Product5_out1,  -- ufix32
              nfp_out => Product4_Im  -- ufix32
              );

  u_nfp_sub_comp : cp_wideband_gammatone_filter_nfp_sub_single
    PORT MAP( nfp_in1 => dtmp_1,  -- ufix32
              nfp_in2 => Constant4_out1,  -- ufix32
              nfp_out => Subtract_out1  -- ufix32
              );

  u_nfp_div_comp_2 : cp_wideband_gammatone_filter_nfp_div_single
    PORT MAP( nfp_in1 => Subtract_out1,  -- ufix32
              nfp_in2 => Add_out1,  -- ufix32
              nfp_out => c1LP  -- ufix32
              );

  u_nfp_mul_comp_3 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => Delay_out1_im,  -- ufix32
              nfp_in2 => c1LP,  -- ufix32
              nfp_out => Product6_Im  -- ufix32
              );

  u_nfp_add_comp_3 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Product4_Im,  -- ufix32
              nfp_in2 => Product6_Im,  -- ufix32
              nfp_out => nfp_out_1_im_1  -- ufix32
              );

  u_nfp_mul_comp_4 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => Delay_out1_re,  -- ufix32
              nfp_in2 => c1LP_1,  -- ufix32
              nfp_out => Product6_Re  -- ufix32
              );

  u_nfp_add_comp_4 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Product4_Re,  -- ufix32
              nfp_in2 => Product6_Re,  -- ufix32
              nfp_out => nfp_out_1_re_1  -- ufix32
              );

  u_nfp_add_comp_5 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_re_1,  -- ufix32
              nfp_in2 => Delay_out1_re,  -- ufix32
              nfp_out => nfp_out_1_re_2  -- ufix32
              );

  u_nfp_mul_comp_5 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_re_2,  -- ufix32
              nfp_in2 => Product5_out1,  -- ufix32
              nfp_out => Product7_Re  -- ufix32
              );

  u_nfp_add_comp_6 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_im_1,  -- ufix32
              nfp_in2 => Delay_out1_im,  -- ufix32
              nfp_out => nfp_out_1_im_2  -- ufix32
              );

  u_nfp_mul_comp_6 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_im_2,  -- ufix32
              nfp_in2 => Product5_out1,  -- ufix32
              nfp_out => Product7_Im  -- ufix32
              );

  u_nfp_mul_comp_7 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => Delay1_out1_im,  -- ufix32
              nfp_in2 => c1LP,  -- ufix32
              nfp_out => Product2_Im  -- ufix32
              );

  u_nfp_add_comp_7 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Product7_Im,  -- ufix32
              nfp_in2 => Product2_Im,  -- ufix32
              nfp_out => nfp_out_1_im_3  -- ufix32
              );

  u_nfp_mul_comp_8 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => Delay1_out1_re,  -- ufix32
              nfp_in2 => c1LP,  -- ufix32
              nfp_out => Product2_Re  -- ufix32
              );

  u_nfp_add_comp_8 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Product7_Re,  -- ufix32
              nfp_in2 => Product2_Re,  -- ufix32
              nfp_out => nfp_out_1_re_3  -- ufix32
              );

  u_nfp_add_comp_9 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_re_3,  -- ufix32
              nfp_in2 => Delay1_out1_re,  -- ufix32
              nfp_out => nfp_out_1_re_4  -- ufix32
              );

  u_nfp_mul_comp_9 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_re_4,  -- ufix32
              nfp_in2 => Product5_out1,  -- ufix32
              nfp_out => Product8_Re  -- ufix32
              );

  u_nfp_add_comp_10 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => nfp_out_1_im_3,  -- ufix32
              nfp_in2 => Delay1_out1_im,  -- ufix32
              nfp_out => nfp_out_1_im_4  -- ufix32
              );

  u_nfp_mul_comp_10 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => nfp_out_1_im_4,  -- ufix32
              nfp_in2 => Product5_out1,  -- ufix32
              nfp_out => Product8_Im  -- ufix32
              );

  u_nfp_mul_comp_11 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => Sum6_out1_im,  -- ufix32
              nfp_in2 => c1LP,  -- ufix32
              nfp_out => Product9_Im  -- ufix32
              );

  u_nfp_add_comp_11 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Product8_Im,  -- ufix32
              nfp_in2 => Product9_Im,  -- ufix32
              nfp_out => nfp_out_1_im_5  -- ufix32
              );

  u_nfp_mul_comp_12 : cp_wideband_gammatone_filter_nfp_mul_single
    PORT MAP( nfp_in1 => Sum6_out1_re_1,  -- ufix32
              nfp_in2 => c1LP,  -- ufix32
              nfp_out => Product9_Re  -- ufix32
              );

  u_nfp_add_comp_12 : cp_wideband_gammatone_filter_nfp_add_single
    PORT MAP( nfp_in1 => Product8_Re,  -- ufix32
              nfp_in2 => Product9_Re,  -- ufix32
              nfp_out => nfp_out_1_re_5  -- ufix32
              );

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1_re <= X"00000000";
      Delay3_out1_im <= X"00000000";
    ELSIF rising_edge(clk) THEN
      IF enb_1_1024_0 = '1' THEN
        Delay3_out1_re <= Signal_In_re;
        Delay3_out1_im <= Signal_In_im;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Constant5_out1 <= X"3f800000";

  pw2_sign_const <= '0';

  pw2_shift_const <= to_signed(16#001#, 9);

  Constant2_out1 <= X"37aec33e";

  Constant3_out1 <= X"3f800000";

  dtmp_1 <= dtmp;

  Constant4_out1 <= X"3f800000";

  c1LP_1 <= c1LP;

  Delay_out1_im <= Sum2_out1_im;

  crp_out_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Sum2_out1_re <= X"00000000";
      Sum2_out1_im_1 <= X"00000000";
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        Sum2_out1_re <= nfp_out_1_re_1;
        Sum2_out1_im_1 <= nfp_out_1_im_1;
      END IF;
    END IF;
  END PROCESS crp_out_delay_process;


  Delay_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_bypass_reg_re <= X"00000000";
      Delay_bypass_reg_im <= X"00000000";
    ELSIF rising_edge(clk) THEN
      IF enb_1_1024_1 = '1' THEN
        Delay_bypass_reg_im <= Sum2_out1_im_1;
        Delay_bypass_reg_re <= Sum2_out1_re;
      END IF;
    END IF;
  END PROCESS Delay_bypass_process;

  
  Sum2_out1_re_1 <= Sum2_out1_re WHEN enb_1_1024_1 = '1' ELSE
      Delay_bypass_reg_re;
  
  Sum2_out1_im <= Sum2_out1_im_1 WHEN enb_1_1024_1 = '1' ELSE
      Delay_bypass_reg_im;

  Delay_out1_re <= Sum2_out1_re_1;

  Delay1_out1_im <= Sum4_out1_im;

  crp_out_delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Sum4_out1_re <= X"00000000";
      Sum4_out1_im_1 <= X"00000000";
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        Sum4_out1_re <= nfp_out_1_re_3;
        Sum4_out1_im_1 <= nfp_out_1_im_3;
      END IF;
    END IF;
  END PROCESS crp_out_delay1_process;


  Delay1_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_bypass_reg_re <= X"00000000";
      Delay1_bypass_reg_im <= X"00000000";
    ELSIF rising_edge(clk) THEN
      IF enb_1_1024_1 = '1' THEN
        Delay1_bypass_reg_im <= Sum4_out1_im_1;
        Delay1_bypass_reg_re <= Sum4_out1_re;
      END IF;
    END IF;
  END PROCESS Delay1_bypass_process;

  
  Sum4_out1_re_1 <= Sum4_out1_re WHEN enb_1_1024_1 = '1' ELSE
      Delay1_bypass_reg_re;
  
  Sum4_out1_im <= Sum4_out1_im_1 WHEN enb_1_1024_1 = '1' ELSE
      Delay1_bypass_reg_im;

  Delay1_out1_re <= Sum4_out1_re_1;

  Delay2_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_bypass_reg_re <= X"00000000";
      Delay2_bypass_reg_im <= X"00000000";
    ELSIF rising_edge(clk) THEN
      IF enb_1_1024_1 = '1' THEN
        Delay2_bypass_reg_im <= Sum6_out1_im_1;
        Delay2_bypass_reg_re <= Sum6_out1_re;
      END IF;
    END IF;
  END PROCESS Delay2_bypass_process;

  
  Sum6_out1_re_1 <= Sum6_out1_re WHEN enb_1_1024_1 = '1' ELSE
      Delay2_bypass_reg_re;
  
  Sum6_out1_im <= Sum6_out1_im_1 WHEN enb_1_1024_1 = '1' ELSE
      Delay2_bypass_reg_im;

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Sum6_out1_re <= X"00000000";
      Sum6_out1_im_1 <= X"00000000";
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        Sum6_out1_re <= nfp_out_1_re_5;
        Sum6_out1_im_1 <= nfp_out_1_im_5;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Signal_Out_re <= Sum6_out1_re;

  Signal_Out_im <= Sum6_out1_im_1;

END rtl;

