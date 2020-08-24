-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_Synthesis_block.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_Synthesis_block
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Right/Synthesis
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_Synthesis_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2048_0                      :   IN    std_logic;
        enb_1_16_1                        :   IN    std_logic;
        enb_1_2048_1                      :   IN    std_logic;
        enb_1_2048_33                     :   IN    std_logic;
        modified_FFT_data_re              :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
        modified_FFT_data_im              :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
        FFT_valid                         :   IN    std_logic;
        FFT_frame_pulse                   :   IN    std_logic;
        synthesized_signal                :   OUT   std_logic_vector(23 DOWNTO 0)  -- sfix24_En23
        );
END fft_filters_Synthesis_block;


ARCHITECTURE rtl OF fft_filters_Synthesis_block IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT fft_filters_iFFT_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
          dataIn_im                       :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT fft_filters_Overlap_and_Add_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2048_0                    :   IN    std_logic;
          enb_1_16_1                      :   IN    std_logic;
          enb_1_2048_1                    :   IN    std_logic;
          enb_1_2048_33                   :   IN    std_logic;
          IFFT_Data                       :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
          iFFT_Valid                      :   IN    std_logic;
          FFT_Frame_Pulse                 :   IN    std_logic;
          signal_out                      :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33_En23
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : fft_filters_iFFT_block
    USE ENTITY work.fft_filters_iFFT_block(rtl);

  FOR ALL : fft_filters_Overlap_and_Add_block
    USE ENTITY work.fft_filters_Overlap_and_Add_block(rtl);

  -- Signals
  SIGNAL iFFT_out1_re                     : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL iFFT_out2                        : std_logic;
  SIGNAL Get_Real_out1                    : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL Overlap_and_Add_out1             : std_logic_vector(32 DOWNTO 0);  -- ufix33
  SIGNAL Overlap_and_Add_out1_signed      : signed(32 DOWNTO 0);  -- sfix33_En23
  SIGNAL Data_Type_Conversion1_out1       : signed(23 DOWNTO 0);  -- sfix24_En23

BEGIN
  -- Making the assumption here
  -- that the frequency domain processing
  -- preserved the complex conjugate pairs
  -- so that the output is real.

  u_iFFT : fft_filters_iFFT_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              dataIn_re => modified_FFT_data_re,  -- sfix31_En23
              dataIn_im => modified_FFT_data_im,  -- sfix31_En23
              validIn => FFT_valid,
              dataOut_re => iFFT_out1_re,  -- sfix31_En23
              validOut => iFFT_out2
              );

  u_Overlap_and_Add : fft_filters_Overlap_and_Add_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              enb => enb,
              enb_1_2048_0 => enb_1_2048_0,
              enb_1_16_1 => enb_1_16_1,
              enb_1_2048_1 => enb_1_2048_1,
              enb_1_2048_33 => enb_1_2048_33,
              IFFT_Data => Get_Real_out1,  -- sfix31_En23
              iFFT_Valid => iFFT_out2,
              FFT_Frame_Pulse => FFT_frame_pulse,
              signal_out => Overlap_and_Add_out1  -- sfix33_En23
              );

  Get_Real_out1 <= std_logic_vector(signed(iFFT_out1_re));

  Overlap_and_Add_out1_signed <= signed(Overlap_and_Add_out1);

  Data_Type_Conversion1_out1 <= Overlap_and_Add_out1_signed(23 DOWNTO 0);

  synthesized_signal <= std_logic_vector(Data_Type_Conversion1_out1);

END rtl;

