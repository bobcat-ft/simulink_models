-- -------------------------------------------------------------
-- 
-- File Name: /mnt/data/NIH/simulink_models/models/delay_and_sum_beamformer/hdlsrc/DSBF/DSBF_normalize.vhd
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DSBF_normalize
-- Source Path: DSBF/dataplane/Avalon Data Processing/normalize
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DSBF_normalize IS
  PORT( input_value                       :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En28
        normalized_value                  :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END DSBF_normalize;


ARCHITECTURE rtl OF DSBF_normalize IS

  -- Component Declarations
  COMPONENT DSBF_normalize_shift
    PORT( input                           :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En28
          normalized                      :   OUT   std_logic_vector(35 DOWNTO 0)  -- sfix36_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : DSBF_normalize_shift
    USE ENTITY work.DSBF_normalize_shift(rtl);

  -- Signals
  SIGNAL normalized                       : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL normalized_signed                : signed(35 DOWNTO 0);  -- sfix36_En28
  SIGNAL Data_Type_Conversion_out1        : signed(31 DOWNTO 0);  -- sfix32_En28

BEGIN
  u_normalize_shift : DSBF_normalize_shift
    PORT MAP( input => input_value,  -- sfix36_En28
              normalized => normalized  -- sfix36_En28
              );

  normalized_signed <= signed(normalized);

  Data_Type_Conversion_out1 <= normalized_signed(31 DOWNTO 0);

  normalized_value <= std_logic_vector(Data_Type_Conversion_out1);

END rtl;

