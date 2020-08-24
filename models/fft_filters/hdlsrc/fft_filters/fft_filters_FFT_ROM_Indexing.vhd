-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_FFT_ROM_Indexing.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_FFT_ROM_Indexing
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Left/Frequency_Domain_Processing/Apply_Complex_Gains/FFT_Filter_Coefficients/FFT_ROM_Indexing
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_FFT_ROM_Indexing IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        valid                             :   IN    std_logic;
        ROM_index                         :   OUT   std_logic_vector(6 DOWNTO 0)  -- ufix7
        );
END fft_filters_FFT_ROM_Indexing;


ARCHITECTURE rtl OF fft_filters_FFT_ROM_Indexing IS

  -- Signals
  SIGNAL Bitwise_Operator_out1            : std_logic;
  SIGNAL FFT_count_out1                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Constant5_out1                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL counter_gain_index_count_step    : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL counter_gain_index_out1          : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Constant_out1                    : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Switch_out1                      : unsigned(6 DOWNTO 0);  -- ufix7

BEGIN
  -- When the index is FFT_size/2, we want the
  -- index to be zero.
  -- 
  -- Count from 0 to FFT_size
  -- 
  -- Reverse direction of 
  -- count when count 
  -- is FFT_size/2
  -- 
  -- Count from 0 to FFT_size/2 and then back down to 0.
  -- We are assuming the gains are conjugate symmetric 
  -- so we only need to store the first half in the ROM
  -- and look up again for negative frequencies.

  Bitwise_Operator_out1 <=  NOT valid;

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  FFT_count_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      FFT_count_out1 <= to_unsigned(16#00#, 7);
    ELSIF rising_edge(clk) THEN
      IF enb_1_16_0 = '1' THEN
        IF Bitwise_Operator_out1 = '1' THEN 
          FFT_count_out1 <= to_unsigned(16#00#, 7);
        ELSIF valid = '1' THEN 
          FFT_count_out1 <= FFT_count_out1 + to_unsigned(16#01#, 7);
        END IF;
      END IF;
    END IF;
  END PROCESS FFT_count_process;


  Constant5_out1 <= to_unsigned(16#40#, 7);

  
  Relational_Operator_relop1 <= '1' WHEN FFT_count_out1 < Constant5_out1 ELSE
      '0';

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  counter_gain_index_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      counter_gain_index_out1 <= to_unsigned(16#00#, 7);
    ELSIF rising_edge(clk) THEN
      IF enb_1_16_0 = '1' THEN
        IF Bitwise_Operator_out1 = '1' THEN 
          counter_gain_index_out1 <= to_unsigned(16#00#, 7);
        ELSIF valid = '1' THEN 
          counter_gain_index_out1 <= counter_gain_index_out1 + counter_gain_index_count_step;
        END IF;
      END IF;
    END IF;
  END PROCESS counter_gain_index_process;

  
  counter_gain_index_count_step <= to_unsigned(16#01#, 7) WHEN Relational_Operator_relop1 = '1' ELSE
      to_unsigned(16#7F#, 7);

  
  Relational_Operator1_relop1 <= '1' WHEN counter_gain_index_out1 /= Constant5_out1 ELSE
      '0';

  
  switch_compare_1 <= '1' WHEN Relational_Operator1_relop1 > '0' ELSE
      '0';

  Constant_out1 <= to_unsigned(16#00#, 7);

  
  Switch_out1 <= Constant_out1 WHEN switch_compare_1 = '0' ELSE
      counter_gain_index_out1;

  ROM_index <= std_logic_vector(Switch_out1);

END rtl;

