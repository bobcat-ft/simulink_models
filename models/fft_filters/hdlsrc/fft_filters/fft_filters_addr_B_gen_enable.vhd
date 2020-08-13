-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_addr_B_gen_enable.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_addr_B_gen_enable
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Left/Analysis/FFT Frame Buffering/addr_B_gen/addr_B_gen_enable
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_addr_B_gen_enable IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_2048_0                      :   IN    std_logic;
        start                             :   IN    std_logic;
        enable_B                          :   OUT   std_logic;
        Start_Address                     :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        Frame_Index                       :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END fft_filters_addr_B_gen_enable;


ARCHITECTURE rtl OF fft_filters_addr_B_gen_enable IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL Constant5_out1                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL B_Enable_Counter_out1            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Start_Address_Counter_out1       : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  -- Signal that is enabled while 
  -- counting [0 FFT_size-1] 
  -- 
  -- Frame_index is the count [0 FFT_size-1]
  -- that is used to lookup the window value
  -- being applied to the streaming sample.
  -- 
  -- This counter specifies where the FFT starts
  -- in the circular buffer.  It increments by FFT/4
  -- samples when it receives a start pulse.
  -- 
  -- The start pulse resets the counter that counts 
  -- from zero to FFT_size-1.  Upon reaching FFT_size
  -- the counter is disabled.  While the counter is enabled,
  -- the enable signal tells the FFT engine that the data streaming
  -- to it is valid.

  Constant5_out1 <= to_unsigned(16#7F#, 7);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 128
  B_Enable_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      B_Enable_Counter_out1 <= to_unsigned(16#00#, 8);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        IF start = '1' THEN 
          B_Enable_Counter_out1 <= to_unsigned(16#00#, 8);
        ELSIF Relational_Operator_relop1 = '1' THEN 
          IF B_Enable_Counter_out1 >= to_unsigned(16#80#, 8) THEN 
            B_Enable_Counter_out1 <= to_unsigned(16#00#, 8);
          ELSE 
            B_Enable_Counter_out1 <= B_Enable_Counter_out1 + to_unsigned(16#01#, 8);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS B_Enable_Counter_process;


  
  Relational_Operator_relop1 <= '1' WHEN B_Enable_Counter_out1 <= resize(Constant5_out1, 8) ELSE
      '0';

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 32
  Start_Address_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Start_Address_Counter_out1 <= to_unsigned(16#00#, 8);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' AND start = '1' THEN
        Start_Address_Counter_out1 <= Start_Address_Counter_out1 + to_unsigned(16#20#, 8);
      END IF;
    END IF;
  END PROCESS Start_Address_Counter_process;


  Start_Address <= std_logic_vector(Start_Address_Counter_out1);

  Frame_Index <= std_logic_vector(B_Enable_Counter_out1);

  enable_B <= Relational_Operator_relop1;

END rtl;

