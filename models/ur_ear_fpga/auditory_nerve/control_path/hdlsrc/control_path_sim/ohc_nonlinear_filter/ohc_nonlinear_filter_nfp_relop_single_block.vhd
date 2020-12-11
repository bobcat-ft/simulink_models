-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\control_path_sim\ohc_nonlinear_filter\ohc_nonlinear_filter_nfp_relop_single_block.vhd
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ohc_nonlinear_filter_nfp_relop_single_block
-- Source Path: ohc_nonlinear_filter/nfp_relop_single
-- Hierarchy Level: 5
-- 
-- {Latency Strategy = "Zero"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ohc_nonlinear_filter_nfp_relop_single_block IS
  PORT( nfp_in1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_in2                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_out1                          :   OUT   std_logic  -- ufix1
        );
END ohc_nonlinear_filter_nfp_relop_single_block;


ARCHITECTURE rtl OF ohc_nonlinear_filter_nfp_relop_single_block IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL nfp_in1_unsigned                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL AS                               : std_logic;  -- ufix1
  SIGNAL AE                               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL AM                               : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Constant2_out1                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Relational_Operator5_relop1      : std_logic;
  SIGNAL Constant1_out1                   : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Relational_Operator4_relop1      : std_logic;
  SIGNAL nfp_in2_unsigned                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL BS                               : std_logic;  -- ufix1
  SIGNAL BE                               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL BM                               : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Relational_Operator6_relop1      : std_logic;
  SIGNAL Relational_Operator2_relop1      : std_logic;
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Relational_Operator3_relop1      : std_logic;
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Relational_Operator2_relop1_1    : std_logic;
  SIGNAL Relational_Operator4_relop1_1    : std_logic;
  SIGNAL Relational_Operator6_relop1_1    : std_logic;
  SIGNAL Relational_Operator5_relop1_1    : std_logic;
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Relational_Operator1_relop1_1    : std_logic;
  SIGNAL Relational_Operator3_relop1_1    : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Logical_Operator7_out1           : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Constant8_out1                   : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1_1         : std_logic;
  SIGNAL Logical_Operator4_out1           : std_logic;
  SIGNAL Logical_Operator1_out1_2         : std_logic;
  SIGNAL Logical_Operator5_out1_1         : std_logic;
  SIGNAL Logical_Operator2_out1_1         : std_logic;
  SIGNAL Logical_Operator3_out1_1         : std_logic;
  SIGNAL Logical_Operator_out1_1          : std_logic;
  SIGNAL Logical_Operator6_out1           : std_logic;
  SIGNAL Logical_Operator4_out1_1         : std_logic;
  SIGNAL Logical_Operator6_out1_1         : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Logical_Operator4_out1_2         : std_logic;
  SIGNAL Logical_Operator5_out1_2         : std_logic;
  SIGNAL Constant1_out1_1                 : std_logic;
  SIGNAL Switch1_out1                     : std_logic;

BEGIN
  nfp_in1_unsigned <= unsigned(nfp_in1);

  -- Split 32 bit word into FP sign, exponent, mantissa
  AS <= nfp_in1_unsigned(31);
  AE <= nfp_in1_unsigned(30 DOWNTO 23);
  AM <= nfp_in1_unsigned(22 DOWNTO 0);

  Constant2_out1 <= to_unsigned(16#FF#, 8);

  
  Relational_Operator5_relop1 <= '1' WHEN AE = Constant2_out1 ELSE
      '0';

  Constant1_out1 <= to_unsigned(16#000000#, 23);

  
  Relational_Operator4_relop1 <= '1' WHEN Constant1_out1 = AM ELSE
      '0';

  nfp_in2_unsigned <= unsigned(nfp_in2);

  -- Split 32 bit word into FP sign, exponent, mantissa
  BS <= nfp_in2_unsigned(31);
  BE <= nfp_in2_unsigned(30 DOWNTO 23);
  BM <= nfp_in2_unsigned(22 DOWNTO 0);

  
  Relational_Operator6_relop1 <= '1' WHEN BE = Constant2_out1 ELSE
      '0';

  
  Relational_Operator2_relop1 <= '1' WHEN Constant1_out1 = BM ELSE
      '0';

  Constant_out1 <= to_unsigned(16#00#, 8);

  
  Relational_Operator3_relop1 <= '1' WHEN Constant_out1 = BE ELSE
      '0';

  
  Relational_Operator1_relop1 <= '1' WHEN Constant_out1 = AE ELSE
      '0';

  Logical_Operator_out1 <= Relational_Operator4_relop1 AND (Relational_Operator1_relop1 AND (Relational_Operator2_relop1 AND Relational_Operator3_relop1));

  
  Relational_Operator2_relop1_1 <= '1' WHEN AS = BS ELSE
      '0';

  
  Relational_Operator4_relop1_1 <= '1' WHEN AE = BE ELSE
      '0';

  
  Relational_Operator6_relop1_1 <= '1' WHEN AM = BM ELSE
      '0';

  
  Relational_Operator5_relop1_1 <= '1' WHEN AS < BS ELSE
      '0';

  
  Compare_To_Constant_out1 <= '1' WHEN BS = '1' ELSE
      '0';

  Logical_Operator3_out1 <= Compare_To_Constant_out1 AND Relational_Operator2_relop1_1;

  
  switch_compare_1 <= '1' WHEN Logical_Operator3_out1 > '0' ELSE
      '0';

  
  Relational_Operator1_relop1_1 <= '1' WHEN AE > BE ELSE
      '0';

  
  Relational_Operator3_relop1_1 <= '1' WHEN AM > BM ELSE
      '0';

  Logical_Operator1_out1 <= Relational_Operator4_relop1_1 AND Relational_Operator3_relop1_1;

  Logical_Operator2_out1 <= Relational_Operator1_relop1_1 OR Logical_Operator1_out1;

  Logical_Operator7_out1 <= Relational_Operator2_relop1_1 AND Logical_Operator2_out1;

  Logical_Operator5_out1 <=  NOT Logical_Operator7_out1;

  Constant8_out1 <= '1';

  Logical_Operator1_out1_1 <=  NOT Constant8_out1;

  Logical_Operator4_out1 <=  NOT Relational_Operator4_relop1;

  Logical_Operator1_out1_2 <= Relational_Operator5_relop1 AND Logical_Operator4_out1;

  Logical_Operator5_out1_1 <=  NOT Relational_Operator2_relop1;

  Logical_Operator2_out1_1 <= Relational_Operator6_relop1 AND Logical_Operator5_out1_1;

  Logical_Operator3_out1_1 <= Logical_Operator1_out1_2 OR Logical_Operator2_out1_1;

  Logical_Operator_out1_1 <= Logical_Operator1_out1_1 OR Logical_Operator3_out1_1;

  Logical_Operator6_out1 <= Relational_Operator6_relop1_1 AND (Relational_Operator2_relop1_1 AND Relational_Operator4_relop1_1);

  Logical_Operator4_out1_1 <= Logical_Operator_out1 OR Logical_Operator6_out1;

  Logical_Operator6_out1_1 <=  NOT Logical_Operator4_out1_1;

  
  Switch_out1 <= Logical_Operator7_out1 WHEN switch_compare_1 = '0' ELSE
      Logical_Operator5_out1;

  Logical_Operator4_out1_2 <= Relational_Operator5_relop1_1 OR Switch_out1;

  Logical_Operator5_out1_2 <= Logical_Operator6_out1_1 AND Logical_Operator4_out1_2;

  Constant1_out1_1 <= '0';

  
  Switch1_out1 <= Logical_Operator5_out1_2 WHEN Logical_Operator_out1_1 = '0' ELSE
      Constant1_out1_1;

  nfp_out1 <= Switch1_out1;

END rtl;

