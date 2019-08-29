-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\DynamicCompressionModel\LogAddressing.vhd
-- Created: 2019-07-24 15:04:52
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: LogAddressing
-- Source Path: DynamicCompressionModel/recalculate/Nchan_FbankAGC_AID/Compression_1/Compression_Gain_Calc/LogAddressing
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY LogAddressing IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        x_in                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        addr_r                            :   OUT   std_logic_vector(8 DOWNTO 0)  -- ufix9
        );
END LogAddressing;


ARCHITECTURE rtl OF LogAddressing IS

  -- Component Declarations
  COMPONENT lzc
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          x_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En28
          lzc_out                         :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
          );
  END COMPONENT;

  COMPONENT LSL_N_block
    PORT( NShifts                         :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          x_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32_En28
          x_shifted                       :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : LSL_N_block
    USE ENTITY work.LSL_N_block(rtl);

  -- Signals
  SIGNAL x_in_signed                      : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Data_Type_Conversion_out1        : unsigned(31 DOWNTO 0);  -- ufix32_En28
  SIGNAL Data_Type_Conversion_out1_1      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL fxpt_lzc_W32_out1                : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL fxpt_lzc_W32_out1_unsigned       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant1_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Subtract_out1                    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL NShifts                          : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL addr_5_downto_2                  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay2_out1                      : unsigned(31 DOWNTO 0);  -- ufix32_En28
  SIGNAL LSL_N_out1                       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL LSL_N_out1_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32_En28
  SIGNAL M                                : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Bit_Concat_out1                  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Constant6_out1                   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Switch1_out1                     : unsigned(8 DOWNTO 0);  -- ufix9

BEGIN
  -- EFFECTIVELY shift_left(x_in,NShifts)

  u_fxpt_lzc_W32 : lzc
    PORT MAP( clk => clk,
              reset => reset,
              x_in => Data_Type_Conversion_out1_1,  -- ufix32_En28
              lzc_out => fxpt_lzc_W32_out1  -- ufix6
              );

  u_LSL_N : LSL_N_block
    PORT MAP( NShifts => std_logic_vector(NShifts),  -- ufix4
              x_in => std_logic_vector(Delay2_out1),  -- ufix32_En28
              x_shifted => LSL_N_out1  -- ufix32_En28
              );

  x_in_signed <= signed(x_in);

  Data_Type_Conversion_out1 <= unsigned(x_in_signed);

  Data_Type_Conversion_out1_1 <= std_logic_vector(Data_Type_Conversion_out1);

  fxpt_lzc_W32_out1_unsigned <= unsigned(fxpt_lzc_W32_out1);

  Constant1_out1 <= to_unsigned(16#03#, 6);

  Subtract_out1 <= fxpt_lzc_W32_out1_unsigned - Constant1_out1;

  NShifts <= Subtract_out1(3 DOWNTO 0);

  
  Compare_To_Constant1_out1 <= '1' WHEN Subtract_out1 > to_unsigned(16#0F#, 6) ELSE
      '0';

  addr_5_downto_2 <=  NOT NShifts;

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay2_out1 <= Data_Type_Conversion_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  LSL_N_out1_unsigned <= unsigned(LSL_N_out1);

  M <= LSL_N_out1_unsigned(27 DOWNTO 23);

  Bit_Concat_out1 <= addr_5_downto_2 & M;

  Constant6_out1 <= to_unsigned(16#000#, 9);

  
  Switch1_out1 <= Bit_Concat_out1 WHEN Compare_To_Constant1_out1 = '0' ELSE
      Constant6_out1;

  addr_r <= std_logic_vector(Switch1_out1);

END rtl;

