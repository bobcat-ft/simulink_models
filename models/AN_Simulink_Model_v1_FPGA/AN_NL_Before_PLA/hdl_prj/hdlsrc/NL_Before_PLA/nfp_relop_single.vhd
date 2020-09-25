-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\NL_Before_PLA\nfp_relop_single.vhd
-- Created: 2020-04-14 17:25:36
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: nfp_relop_single
-- Source Path: NL_Before_PLA/NL Before PLA Singles/nfp_relop_single
-- Hierarchy Level: 1
-- 
-- {Latency Strategy = "Min"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nfp_relop_single IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        nfp_in1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_in2                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_out1                          :   OUT   std_logic  -- ufix1
        );
END nfp_relop_single;


ARCHITECTURE rtl OF nfp_relop_single IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL Constant8_out1                   : std_logic;  -- ufix1
  SIGNAL Constant7_out1                   : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL Delay13_out1                     : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;  -- ufix1
  SIGNAL Add_out1                         : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Delay12_out1                     : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Add_add_cast                     : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL nfp_in1_unsigned                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL AS                               : std_logic;  -- ufix1
  SIGNAL AE                               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL AM                               : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Delay2_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant2_out1                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Relational_Operator5_relop1      : std_logic;
  SIGNAL Constant1_out1                   : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Delay3_out1                      : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Relational_Operator4_relop1      : std_logic;
  SIGNAL nfp_in2_unsigned                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL BS                               : std_logic;  -- ufix1
  SIGNAL BE                               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL BM                               : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Delay4_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Relational_Operator6_relop1      : std_logic;
  SIGNAL Delay5_out1                      : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Relational_Operator2_relop1      : std_logic;
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Relational_Operator3_relop1      : std_logic;
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL Logical_Operator_out1_1          : std_logic;
  SIGNAL Delay_out1                       : std_logic;  -- ufix1
  SIGNAL Delay1_out1                      : std_logic;  -- ufix1
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
  SIGNAL Logical_Operator2_out1_1         : std_logic;
  SIGNAL Logical_Operator7_out1           : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Logical_Operator1_out1_1         : std_logic;
  SIGNAL Logical_Operator4_out1           : std_logic;
  SIGNAL Logical_Operator1_out1_2         : std_logic;
  SIGNAL Logical_Operator5_out1_1         : std_logic;
  SIGNAL Logical_Operator2_out1_2         : std_logic;
  SIGNAL Logical_Operator3_out1_1         : std_logic;
  SIGNAL Logical_Operator_out1_2          : std_logic;
  SIGNAL Logical_Operator6_out1           : std_logic;
  SIGNAL Logical_Operator4_out1_1         : std_logic;
  SIGNAL Logical_Operator6_out1_1         : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Logical_Operator4_out1_2         : std_logic;
  SIGNAL Logical_Operator5_out1_2         : std_logic;
  SIGNAL Constant1_out1_1                 : std_logic;
  SIGNAL Switch1_out1                     : std_logic;

BEGIN
  Constant8_out1 <= '1';

  Constant7_out1 <= to_unsigned(16#1#, 3);

  Delay13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay13_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay13_out1 <= Relational_Operator_relop1;
      END IF;
    END IF;
  END PROCESS Delay13_process;


  Logical_Operator2_out1 <=  NOT Delay13_out1;

  Logical_Operator_out1 <= Constant8_out1 AND Logical_Operator2_out1;

  Delay12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay12_out1 <= to_unsigned(16#0#, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay12_out1 <= Add_out1;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  Add_add_cast <= '0' & '0' & Logical_Operator_out1;
  Add_out1 <= Delay12_out1 + Add_add_cast;

  
  Relational_Operator_relop1 <= '1' WHEN Add_out1 > Constant7_out1 ELSE
      '0';

  nfp_in1_unsigned <= unsigned(nfp_in1);

  -- Split 32 bit word into FP sign, exponent, mantissa
  AS <= nfp_in1_unsigned(31);
  AE <= nfp_in1_unsigned(30 DOWNTO 23);
  AM <= nfp_in1_unsigned(22 DOWNTO 0);

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay2_out1 <= AE;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Constant2_out1 <= to_unsigned(16#FF#, 8);

  
  Relational_Operator5_relop1 <= '1' WHEN Delay2_out1 = Constant2_out1 ELSE
      '0';

  Constant1_out1 <= to_unsigned(16#000000#, 23);

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1 <= to_unsigned(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay3_out1 <= AM;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  
  Relational_Operator4_relop1 <= '1' WHEN Constant1_out1 = Delay3_out1 ELSE
      '0';

  nfp_in2_unsigned <= unsigned(nfp_in2);

  -- Split 32 bit word into FP sign, exponent, mantissa
  BS <= nfp_in2_unsigned(31);
  BE <= nfp_in2_unsigned(30 DOWNTO 23);
  BM <= nfp_in2_unsigned(22 DOWNTO 0);

  Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay4_out1 <= BE;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  
  Relational_Operator6_relop1 <= '1' WHEN Delay4_out1 = Constant2_out1 ELSE
      '0';

  Delay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay5_out1 <= to_unsigned(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay5_out1 <= BM;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  
  Relational_Operator2_relop1 <= '1' WHEN Constant1_out1 = Delay5_out1 ELSE
      '0';

  Constant_out1 <= to_unsigned(16#00#, 8);

  
  Relational_Operator3_relop1 <= '1' WHEN Constant_out1 = Delay4_out1 ELSE
      '0';

  
  Relational_Operator1_relop1 <= '1' WHEN Constant_out1 = Delay2_out1 ELSE
      '0';

  Logical_Operator_out1_1 <= Relational_Operator4_relop1 AND (Relational_Operator1_relop1 AND (Relational_Operator2_relop1 AND Relational_Operator3_relop1));

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay_out1 <= AS;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_out1 <= BS;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  
  Relational_Operator2_relop1_1 <= '1' WHEN Delay_out1 = Delay1_out1 ELSE
      '0';

  
  Relational_Operator4_relop1_1 <= '1' WHEN Delay2_out1 = Delay4_out1 ELSE
      '0';

  
  Relational_Operator6_relop1_1 <= '1' WHEN Delay3_out1 = Delay5_out1 ELSE
      '0';

  
  Relational_Operator5_relop1_1 <= '1' WHEN Delay_out1 < Delay1_out1 ELSE
      '0';

  
  Compare_To_Constant_out1 <= '1' WHEN Delay1_out1 = '1' ELSE
      '0';

  Logical_Operator3_out1 <= Compare_To_Constant_out1 AND Relational_Operator2_relop1_1;

  
  switch_compare_1 <= '1' WHEN Logical_Operator3_out1 > '0' ELSE
      '0';

  
  Relational_Operator1_relop1_1 <= '1' WHEN Delay2_out1 > Delay4_out1 ELSE
      '0';

  
  Relational_Operator3_relop1_1 <= '1' WHEN Delay3_out1 > Delay5_out1 ELSE
      '0';

  Logical_Operator1_out1 <= Relational_Operator4_relop1_1 AND Relational_Operator3_relop1_1;

  Logical_Operator2_out1_1 <= Relational_Operator1_relop1_1 OR Logical_Operator1_out1;

  Logical_Operator7_out1 <= Relational_Operator2_relop1_1 AND Logical_Operator2_out1_1;

  Logical_Operator5_out1 <=  NOT Logical_Operator7_out1;

  Logical_Operator1_out1_1 <=  NOT Relational_Operator_relop1;

  Logical_Operator4_out1 <=  NOT Relational_Operator4_relop1;

  Logical_Operator1_out1_2 <= Relational_Operator5_relop1 AND Logical_Operator4_out1;

  Logical_Operator5_out1_1 <=  NOT Relational_Operator2_relop1;

  Logical_Operator2_out1_2 <= Relational_Operator6_relop1 AND Logical_Operator5_out1_1;

  Logical_Operator3_out1_1 <= Logical_Operator1_out1_2 OR Logical_Operator2_out1_2;

  Logical_Operator_out1_2 <= Logical_Operator1_out1_1 OR Logical_Operator3_out1_1;

  Logical_Operator6_out1 <= Relational_Operator6_relop1_1 AND (Relational_Operator2_relop1_1 AND Relational_Operator4_relop1_1);

  Logical_Operator4_out1_1 <= Logical_Operator_out1_1 OR Logical_Operator6_out1;

  Logical_Operator6_out1_1 <=  NOT Logical_Operator4_out1_1;

  
  Switch_out1 <= Logical_Operator7_out1 WHEN switch_compare_1 = '0' ELSE
      Logical_Operator5_out1;

  Logical_Operator4_out1_2 <= Relational_Operator5_relop1_1 OR Switch_out1;

  Logical_Operator5_out1_2 <= Logical_Operator6_out1_1 AND Logical_Operator4_out1_2;

  Constant1_out1_1 <= '0';

  
  Switch1_out1 <= Logical_Operator5_out1_2 WHEN Logical_Operator_out1_2 = '0' ELSE
      Constant1_out1_1;

  nfp_out1 <= Switch1_out1;

END rtl;

