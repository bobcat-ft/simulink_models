-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_Wait_for_data_to_start.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_Wait_for_data_to_start
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Left/Analysis/FFT Frame Buffering/FFT_pulse_gen/Wait_for_data_to_start
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_Wait_for_data_to_start IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_262144_0                    :   IN    std_logic;
        Frame_Pulse                       :   IN    std_logic;
        FFT_Frame_Start                   :   OUT   std_logic;
        Enable_FFT_Frames                 :   OUT   std_logic
        );
END fft_filters_Wait_for_data_to_start;


ARCHITECTURE rtl OF fft_filters_Wait_for_data_to_start IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Initial_frame_count_out1         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Bitwise_Operator_out1            : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;

BEGIN
  -- Frame pulses don't start
  -- coming through until 
  -- circular buffer has data.  
  -- 
  -- Counter starts a zero and counts number of frame pulses.
  -- Counter remains enabled while frame count is less than 4.
  -- As soon as the counter reaches 4, it is disabled, which then
  -- enables the frame pulses to pass through.
  -- 
  -- Frame_Pulse
  -- will pass through 
  -- when enabled
  -- 
  -- Number of Frames
  -- to wait before starting
  -- 
  -- Start performing FFTs after enough data has filled the circular buffer.
  -- This is due to the fact that we don't want the read pointer (addr_B) 
  -- to catch up with the  write pointer (addr_A) because if it does,
  -- the DPRAM will throw an assertion error.
  -- 
  -- Enable signal that that indicates
  -- that FFTs can start since there is 
  -- data in the buffer.  

  Logical_Operator_out1 <= Compare_To_Constant_out1 AND Frame_Pulse;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 4
  Initial_frame_count_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Initial_frame_count_out1 <= to_unsigned(16#00#, 5);
    ELSIF rising_edge(clk) THEN
      IF enb_1_262144_0 = '1' THEN
        IF Logical_Operator_out1 = '1' THEN 
          IF Initial_frame_count_out1 >= to_unsigned(16#04#, 5) THEN 
            Initial_frame_count_out1 <= to_unsigned(16#00#, 5);
          ELSE 
            Initial_frame_count_out1 <= Initial_frame_count_out1 + to_unsigned(16#01#, 5);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS Initial_frame_count_process;


  
  Compare_To_Constant_out1 <= '1' WHEN Initial_frame_count_out1 < to_unsigned(16#04#, 5) ELSE
      '0';

  Bitwise_Operator_out1 <=  NOT Compare_To_Constant_out1;

  Logical_Operator1_out1 <= Frame_Pulse AND Bitwise_Operator_out1;

  FFT_Frame_Start <= Logical_Operator1_out1;

  Enable_FFT_Frames <= Bitwise_Operator_out1;

END rtl;

