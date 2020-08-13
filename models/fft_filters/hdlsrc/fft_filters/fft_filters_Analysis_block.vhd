-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_Analysis_block.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_Analysis_block
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Right/Analysis
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_Analysis_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_262144_1                    :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2048_0                      :   IN    std_logic;
        enb_1_262144_0                    :   IN    std_logic;
        enb_1_2048_1                      :   IN    std_logic;
        Signal_in                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
        Passthrough                       :   IN    std_logic;
        filter_select                     :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        FFT_data_re                       :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
        FFT_data_im                       :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
        FFT_valid                         :   OUT   std_logic;
        FFT_frame_pulse                   :   OUT   std_logic;
        passthrough_1                     :   OUT   std_logic;
        filter_select_out                 :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
        );
END fft_filters_Analysis_block;


ARCHITECTURE rtl OF fft_filters_Analysis_block IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT fft_filters_FFT_Frame_Buffering_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_262144_1                  :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2048_0                    :   IN    std_logic;
          enb_1_262144_0                  :   IN    std_logic;
          enb_1_2048_1                    :   IN    std_logic;
          Sample_Data_in                  :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          passthrough_in                  :   IN    std_logic;
          filter_select                   :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          Data_to_FFT                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          Valid_to_FFT                    :   OUT   std_logic;
          FFT_Frame_Start_Pulse           :   OUT   std_logic;
          passthrough                     :   OUT   std_logic;
          filter_select_out               :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  COMPONENT fft_filters_FFT_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2048_0                    :   IN    std_logic;
          dataIn                          :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En23
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
          dataOut_im                      :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
          validOut                        :   OUT   std_logic;
          ready                           :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : fft_filters_FFT_Frame_Buffering_block
    USE ENTITY work.fft_filters_FFT_Frame_Buffering_block(rtl);

  FOR ALL : fft_filters_FFT_block
    USE ENTITY work.fft_filters_FFT_block(rtl);

  -- Signals
  SIGNAL FFT_Frame_Buffering_out1         : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL FFT_Frame_Buffering_out2         : std_logic;
  SIGNAL FFT_Frame_Buffering_out3         : std_logic;
  SIGNAL FFT_Frame_Buffering_out4         : std_logic;
  SIGNAL FFT_Frame_Buffering_out5         : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL FFT_Frame_Buffering_out2_1       : std_logic;
  SIGNAL FFT_out1_re                      : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL FFT_out1_im                      : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL FFT_out2                         : std_logic;
  SIGNAL FFT_out3                         : std_logic;

BEGIN
  -- The ready signal is ignored by design
  -- since data won't be sent while FFT
  -- engine is busy.

  u_FFT_Frame_Buffering : fft_filters_FFT_Frame_Buffering_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_262144_1 => enb_1_262144_1,
              enb => enb,
              enb_1_2048_0 => enb_1_2048_0,
              enb_1_262144_0 => enb_1_262144_0,
              enb_1_2048_1 => enb_1_2048_1,
              Sample_Data_in => Signal_in,  -- sfix24_En23
              passthrough_in => Passthrough,
              filter_select => filter_select,  -- ufix2
              Data_to_FFT => FFT_Frame_Buffering_out1,  -- sfix24_En23
              Valid_to_FFT => FFT_Frame_Buffering_out2,
              FFT_Frame_Start_Pulse => FFT_Frame_Buffering_out3,
              passthrough => FFT_Frame_Buffering_out4,
              filter_select_out => FFT_Frame_Buffering_out5  -- ufix2
              );

  u_FFT : fft_filters_FFT_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2048_0 => enb_1_2048_0,
              dataIn => FFT_Frame_Buffering_out1,  -- sfix24_En23
              validIn => FFT_Frame_Buffering_out2_1,
              dataOut_re => FFT_out1_re,  -- sfix31_En23
              dataOut_im => FFT_out1_im,  -- sfix31_En23
              validOut => FFT_out2,
              ready => FFT_out3
              );

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      FFT_Frame_Buffering_out2_1 <= '0';
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        FFT_Frame_Buffering_out2_1 <= FFT_Frame_Buffering_out2;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  FFT_data_re <= FFT_out1_re;

  FFT_data_im <= FFT_out1_im;

  FFT_valid <= FFT_out2;

  FFT_frame_pulse <= FFT_Frame_Buffering_out3;

  passthrough_1 <= FFT_Frame_Buffering_out4;

  filter_select_out <= FFT_Frame_Buffering_out5;

END rtl;

