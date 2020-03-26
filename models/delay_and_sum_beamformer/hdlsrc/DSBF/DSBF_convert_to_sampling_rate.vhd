-- -------------------------------------------------------------
-- 
-- File Name: /mnt/data/trevor/research/NIH_SBIR_R44_DC015443/simulink_models/models/delay_and_sum_beamformer/hdlsrc/DSBF/DSBF_convert_to_sampling_rate.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DSBF_convert_to_sampling_rate
-- Source Path: DSBF/dataplane/Avalon Data Processing/convert to sampling rate
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.DSBF_dataplane_pkg.ALL;

ENTITY DSBF_convert_to_sampling_rate IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2048_1                      :   IN    std_logic;
        enb_1_2048_0                      :   IN    std_logic;
        enb_1_2048_5                      :   IN    std_logic;
        valid_in                          :   IN    std_logic;
        data_in                           :   IN    vector_of_std_logic_vector32(0 TO 15);  -- sfix32_En28 [16]
        delays_in                         :   IN    vector_of_std_logic_vector12(0 TO 15);  -- sfix12_En6 [16]
        data_out                          :   OUT   vector_of_std_logic_vector32(0 TO 15);  -- sfix32_En28 [16]
        delays_out                        :   OUT   vector_of_std_logic_vector12(0 TO 15)  -- sfix12_En6 [16]
        );
END DSBF_convert_to_sampling_rate;


ARCHITECTURE rtl OF DSBF_convert_to_sampling_rate IS

  -- Component Declarations
  COMPONENT DSBF_Sample_and_Hold
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    vector_of_std_logic_vector32(0 TO 15);  -- sfix32_En28 [16]
          Trigger                         :   IN    std_logic;
          alpha                           :   OUT   vector_of_std_logic_vector32(0 TO 15)  -- sfix32_En28 [16]
          );
  END COMPONENT;

  COMPONENT DSBF_Sample_and_Hold1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    vector_of_std_logic_vector12(0 TO 15);  -- sfix12_En6 [16]
          Trigger                         :   IN    std_logic;
          alpha                           :   OUT   vector_of_std_logic_vector12(0 TO 15)  -- sfix12_En6 [16]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : DSBF_Sample_and_Hold
    USE ENTITY work.DSBF_Sample_and_Hold(rtl);

  FOR ALL : DSBF_Sample_and_Hold1
    USE ENTITY work.DSBF_Sample_and_Hold1(rtl);

  -- Signals
  SIGNAL Sample_and_Hold_out1             : vector_of_std_logic_vector32(0 TO 15);  -- ufix32 [16]
  SIGNAL Sample_and_Hold_out1_signed      : vector_of_signed32(0 TO 15);  -- sfix32_En28 [16]
  SIGNAL Rate_Transition1_out1            : vector_of_signed32(0 TO 15);  -- sfix32_En28 [16]
  SIGNAL Rate_Transition1_out1_1          : vector_of_signed32(0 TO 15);  -- sfix32_En28 [16]
  SIGNAL delayMatch_reg                   : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL valid_in_1                       : std_logic;
  SIGNAL Sample_and_Hold1_out1            : vector_of_std_logic_vector12(0 TO 15);  -- ufix12 [16]
  SIGNAL Sample_and_Hold1_out1_signed     : vector_of_signed12(0 TO 15);  -- sfix12_En6 [16]
  SIGNAL Rate_Transition2_ds_out          : vector_of_signed12(0 TO 15);  -- sfix12_En6 [16]
  SIGNAL Rate_Transition2_out1            : vector_of_signed12(0 TO 15);  -- sfix12_En6 [16]
  SIGNAL Rate_Transition2_out1_1          : vector_of_signed12(0 TO 15);  -- sfix12_En6 [16]

BEGIN
  -- sample and data on the valid pulse to make sure we are only using valid data

  u_Sample_and_Hold : DSBF_Sample_and_Hold
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In_rsvd => data_in,  -- sfix32_En28 [16]
              Trigger => valid_in,
              alpha => Sample_and_Hold_out1  -- sfix32_En28 [16]
              );

  u_Sample_and_Hold1 : DSBF_Sample_and_Hold1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              In_rsvd => delays_in,  -- sfix12_En6 [16]
              Trigger => valid_in_1,
              alpha => Sample_and_Hold1_out1  -- sfix12_En6 [16]
              );

  outputgen3: FOR k IN 0 TO 15 GENERATE
    Sample_and_Hold_out1_signed(k) <= signed(Sample_and_Hold_out1(k));
  END GENERATE;

  Rate_Transition1_output_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Rate_Transition1_out1 <= (OTHERS => to_signed(0, 32));
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_1 = '1' THEN
        Rate_Transition1_out1 <= Sample_and_Hold_out1_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition1_output_process;


  PipelineRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Rate_Transition1_out1_1 <= (OTHERS => to_signed(0, 32));
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        Rate_Transition1_out1_1 <= Rate_Transition1_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  outputgen2: FOR k IN 0 TO 15 GENERATE
    data_out(k) <= std_logic_vector(Rate_Transition1_out1_1(k));
  END GENERATE;

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        delayMatch_reg(0) <= valid_in;
        delayMatch_reg(1 TO 3) <= delayMatch_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  valid_in_1 <= delayMatch_reg(3);

  outputgen1: FOR k IN 0 TO 15 GENERATE
    Sample_and_Hold1_out1_signed(k) <= signed(Sample_and_Hold1_out1(k));
  END GENERATE;

  -- Downsample register
  Rate_Transition2_ds_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Rate_Transition2_ds_out <= (OTHERS => to_signed(16#000#, 12));
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_5 = '1' THEN
        Rate_Transition2_ds_out <= Sample_and_Hold1_out1_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition2_ds_process;


  -- Downsample output register
  Rate_Transition2_output_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Rate_Transition2_out1 <= (OTHERS => to_signed(16#000#, 12));
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        Rate_Transition2_out1 <= Rate_Transition2_ds_out;
      END IF;
    END IF;
  END PROCESS Rate_Transition2_output_process;


  PipelineRegister1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Rate_Transition2_out1_1 <= (OTHERS => to_signed(16#000#, 12));
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        Rate_Transition2_out1_1 <= Rate_Transition2_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;


  outputgen: FOR k IN 0 TO 15 GENERATE
    delays_out(k) <= std_logic_vector(Rate_Transition2_out1_1(k));
  END GENERATE;

END rtl;

