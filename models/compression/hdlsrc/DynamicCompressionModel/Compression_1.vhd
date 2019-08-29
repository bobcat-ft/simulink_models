-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\DynamicCompressionModel\Compression_1.vhd
-- Created: 2019-07-24 15:04:52
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Compression_1
-- Source Path: DynamicCompressionModel/recalculate/Nchan_FbankAGC_AID/Compression_1
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.recalculate_pkg.ALL;

ENTITY Compression_1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Sig_Band_1                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Table_In                          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Table_Sel                         :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        Write_Addr                        :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        Sig_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END Compression_1;


ARCHITECTURE rtl OF Compression_1 IS

  -- Component Declarations
  COMPONENT Compression_Gain_Calc
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Table_Fill                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Write_Addr                      :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          Table_Fill_Valid                :   IN    std_logic;
          Data_In                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Gain_C_out                      :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  COMPONENT Compression_Envelope
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Desired_Gain                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Curr_Gain                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Gain_Out                        :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Compression_Gain_Calc
    USE ENTITY work.Compression_Gain_Calc(rtl);

  FOR ALL : Compression_Envelope
    USE ENTITY work.Compression_Envelope(rtl);

  -- Signals
  SIGNAL Table_Sel_unsigned               : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Compression_Gain_Calc_out1       : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Compression_Envelope_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Unit_Delay_out1                  : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Compression_Envelope_out1        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Constant_out1                    : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Sig_Band_1_signed                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Switch_out1                      : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Delay_reg                        : vector_of_signed32(0 TO 2);  -- sfix32 [3]
  SIGNAL Delay_out1                       : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_out1                     : signed(63 DOWNTO 0);  -- sfix64_En56
  SIGNAL Data_Type_Conversion1_out1       : signed(31 DOWNTO 0);  -- sfix32_En28

BEGIN
  -- Calculate Compression Gain Needed
  -- 
  -- Apply to the Envelope

  u_Compression_Gain_Calc : Compression_Gain_Calc
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Table_Fill => Table_In,  -- sfix32_En28
              Write_Addr => Write_Addr,  -- ufix9
              Table_Fill_Valid => Compare_To_Constant_out1,
              Data_In => Sig_Band_1,  -- sfix32_En28
              Gain_C_out => Compression_Gain_Calc_out1  -- sfix32_En28
              );

  u_Compression_Envelope : Compression_Envelope
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Desired_Gain => Compression_Gain_Calc_out1,  -- sfix32_En28
              Curr_Gain => std_logic_vector(Unit_Delay_out1),  -- sfix32_En28
              Gain_Out => Compression_Envelope_out1  -- sfix32_En28
              );

  Table_Sel_unsigned <= unsigned(Table_Sel);

  
  Compare_To_Constant_out1 <= '1' WHEN Table_Sel_unsigned = to_unsigned(16#0#, 3) ELSE
      '0';

  Unit_Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_out1 <= to_signed(268435456, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay_out1 <= Compression_Envelope_out1_signed;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Compression_Envelope_out1_signed <= signed(Compression_Envelope_out1);

  
  switch_compare_1 <= '1' WHEN Table_Sel_unsigned > to_unsigned(16#4#, 3) ELSE
      '0';

  Constant_out1 <= to_signed(0, 32);

  Sig_Band_1_signed <= signed(Sig_Band_1);

  
  Switch_out1 <= Constant_out1 WHEN switch_compare_1 = '0' ELSE
      Sig_Band_1_signed;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_reg <= (OTHERS => to_signed(0, 32));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay_reg(0) <= Switch_out1;
        Delay_reg(1 TO 2) <= Delay_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1 <= Delay_reg(2);

  Product_out1 <= Compression_Envelope_out1_signed * Delay_out1;

  Data_Type_Conversion1_out1 <= Product_out1(59 DOWNTO 28);

  Sig_out <= std_logic_vector(Data_Type_Conversion1_out1);

END rtl;

