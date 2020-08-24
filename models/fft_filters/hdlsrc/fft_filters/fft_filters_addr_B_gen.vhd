-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_addr_B_gen.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_addr_B_gen
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Left/Analysis/FFT Frame Buffering/addr_B_gen
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_addr_B_gen IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        start                             :   IN    std_logic;
        enable                            :   IN    std_logic;
        addr_B                            :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        Frame_counter                     :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        FFT_Valid                         :   OUT   std_logic
        );
END fft_filters_addr_B_gen;


ARCHITECTURE rtl OF fft_filters_addr_B_gen IS

  -- Component Declarations
  COMPONENT fft_filters_addr_B_gen_enable
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          start                           :   IN    std_logic;
          enable_B                        :   OUT   std_logic;
          Start_Address                   :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          Frame_Index                     :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : fft_filters_addr_B_gen_enable
    USE ENTITY work.fft_filters_addr_B_gen_enable(rtl);

  -- Signals
  SIGNAL addr_B_gen_enable_out1           : std_logic;
  SIGNAL addr_B_gen_enable_out2           : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL addr_B_gen_enable_out3           : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL addr_B_gen_enable_out2_unsigned  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL counter_B_out1                   : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  -- Counter values [0 FFT_size-1] that
  -- is used to lookup the window values
  -- being applied.
  -- 
  -- Valid data is being streamed to the FFT Engine.
  -- 
  -- Enable signal that indicates 
  -- there is data in the buffer 
  -- and FFTs can start.
  -- 
  -- The start pulse sets the starting count to Start_Address
  -- and the counter counts from Start_Address to Start_Address + FFT_size - 1
  -- which is the address sent to Port B of the dual port memory.

  u_addr_B_gen_enable : fft_filters_addr_B_gen_enable
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              start => start,
              enable_B => addr_B_gen_enable_out1,
              Start_Address => addr_B_gen_enable_out2,  -- uint8
              Frame_Index => addr_B_gen_enable_out3  -- uint8
              );

  addr_B_gen_enable_out2_unsigned <= unsigned(addr_B_gen_enable_out2);

  Logical_Operator1_out1 <= addr_B_gen_enable_out1 AND enable;

  -- Free running, Unsigned Counter
  --  initial value   = 246
  --  step value      = 1
  counter_B_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      counter_B_out1 <= to_unsigned(16#F6#, 8);
    ELSIF rising_edge(clk) THEN
      IF enb_1_16_0 = '1' THEN
        IF start = '1' THEN 
          counter_B_out1 <= addr_B_gen_enable_out2_unsigned;
        ELSIF Logical_Operator1_out1 = '1' THEN 
          counter_B_out1 <= counter_B_out1 + to_unsigned(16#01#, 8);
        END IF;
      END IF;
    END IF;
  END PROCESS counter_B_process;


  addr_B <= std_logic_vector(counter_B_out1);

  Frame_counter <= addr_B_gen_enable_out3;

  FFT_Valid <= Logical_Operator1_out1;

END rtl;

