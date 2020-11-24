-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\NL_Before_PLA\nfp_signum_single.vhd
-- Created: 2020-04-14 17:25:36
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: nfp_signum_single
-- Source Path: NL_Before_PLA/NL Before PLA Singles/Subsystem/nfp_signum_single
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nfp_signum_single IS
  PORT( nfp_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END nfp_signum_single;


ARCHITECTURE rtl OF nfp_signum_single IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL nfp_in_unsigned                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL X_S                              : std_logic;  -- ufix1
  SIGNAL X_E                              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL X_M                              : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Compare_To_Zero1_out1            : std_logic;  -- ufix1
  SIGNAL Compare_To_Zero_out1             : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1            : std_logic;  -- ufix1
  SIGNAL Constant2_out1                   : std_logic;  -- ufix1
  SIGNAL Switch1_out1                     : std_logic;  -- ufix1
  SIGNAL Compare_To_Constant_out1         : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1           : std_logic;  -- ufix1
  SIGNAL Logical_Operator2_out1           : std_logic;  -- ufix1
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant1_out1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch_out1                      : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Switch2_out1                     : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Constant3_out1                   : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Switch3_out1                     : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL nfp_out_pack                     : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  nfp_in_unsigned <= unsigned(nfp_in);

  -- Split 32 bit word into FP sign, exponent, mantissa
  X_S <= nfp_in_unsigned(31);
  X_E <= nfp_in_unsigned(30 DOWNTO 23);
  X_M <= nfp_in_unsigned(22 DOWNTO 0);

  
  Compare_To_Zero1_out1 <= '1' WHEN X_E = to_unsigned(16#00#, 8) ELSE
      '0';

  
  Compare_To_Zero_out1 <= '1' WHEN X_M = to_unsigned(16#000000#, 23) ELSE
      '0';

  Logical_Operator_out1 <= Compare_To_Zero1_out1 AND Compare_To_Zero_out1;

  Constant2_out1 <= '0';

  
  Switch1_out1 <= X_S WHEN Logical_Operator_out1 = '0' ELSE
      Constant2_out1;

  Compare_To_Constant_out1 <= (X_E(7) AND X_E(6) AND X_E(5) AND X_E(4) AND X_E(3) AND X_E(2) AND X_E(1) AND X_E(0));

  Logical_Operator1_out1 <=  NOT Compare_To_Zero_out1;

  Logical_Operator2_out1 <= Compare_To_Constant_out1 AND Logical_Operator1_out1;

  Constant_out1 <= to_unsigned(16#7F#, 8);

  Constant1_out1 <= to_unsigned(16#00#, 8);

  
  Switch_out1 <= Constant_out1 WHEN Logical_Operator_out1 = '0' ELSE
      Constant1_out1;

  
  Switch2_out1 <= Switch_out1 WHEN Logical_Operator2_out1 = '0' ELSE
      X_E;

  Constant3_out1 <= to_unsigned(16#000000#, 23);

  
  Switch3_out1 <= Constant3_out1 WHEN Logical_Operator2_out1 = '0' ELSE
      X_M;

  -- Combine FP sign, exponent, mantissa into 32 bit word
  nfp_out_pack <= Switch1_out1 & Switch2_out1 & Switch3_out1;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;
