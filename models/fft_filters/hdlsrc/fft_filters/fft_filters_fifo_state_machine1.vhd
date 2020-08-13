-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_fifo_state_machine1.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_fifo_state_machine1
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Left/Synthesis/Overlap_and_Add/fifo_state_machine1
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_fifo_state_machine1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_2048_0                      :   IN    std_logic;
        valid                             :   IN    std_logic;
        pop                               :   OUT   std_logic
        );
END fft_filters_fifo_state_machine1;


ARCHITECTURE rtl OF fft_filters_fifo_state_machine1 IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL current_state                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL current_state_next               : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  fifo_state_machine1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      current_state <= to_unsigned(16#0#, 2);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        current_state <= current_state_next;
      END IF;
    END IF;
  END PROCESS fifo_state_machine1_process;

  fifo_state_machine1_output : PROCESS (current_state, valid)
  BEGIN
    current_state_next <= current_state;
    CASE current_state IS
      WHEN "00" =>
        pop <= '0';
        IF valid = '1' THEN 
          current_state_next <= to_unsigned(16#1#, 2);
        ELSE 
          current_state_next <= to_unsigned(16#0#, 2);
        END IF;
      WHEN "01" =>
        pop <= '0';
        IF valid = '1' THEN 
          current_state_next <= to_unsigned(16#1#, 2);
        ELSE 
          current_state_next <= to_unsigned(16#2#, 2);
        END IF;
      WHEN "10" =>
        pop <= '1';
        current_state_next <= to_unsigned(16#2#, 2);
      WHEN OTHERS => 
        pop <= '0';
    END CASE;
  END PROCESS fifo_state_machine1_output;


END rtl;

