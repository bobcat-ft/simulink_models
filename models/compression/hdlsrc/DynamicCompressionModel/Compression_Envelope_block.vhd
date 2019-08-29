-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\DynamicCompressionModel\Compression_Envelope_block.vhd
-- Created: 2019-07-24 15:04:52
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Compression_Envelope_block
-- Source Path: DynamicCompressionModel/recalculate/Nchan_FbankAGC_AID/Compression_2/Compression_Envelope
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Compression_Envelope_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Desired_Gain                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Curr_Gain                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Gain_Out                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END Compression_Envelope_block;


ARCHITECTURE rtl OF Compression_Envelope_block IS

  -- Component Declarations
  COMPONENT Release_Envelope_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Curr                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Desired                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Enable                          :   IN    std_logic;
          Gain_out                        :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  COMPONENT Attack_Envelope_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Curr                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Desired                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          Enable                          :   IN    std_logic;
          Gain_out                        :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Release_Envelope_block
    USE ENTITY work.Release_Envelope_block(rtl);

  FOR ALL : Attack_Envelope_block
    USE ENTITY work.Attack_Envelope_block(rtl);

  -- Signals
  SIGNAL Curr_Gain_signed                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Desired_Gain_signed              : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Subtract_out1                    : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Compare_To_Zero_out1             : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Release_Envelope_out1            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Release_Envelope_out1_signed     : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Attack_Envelope_out1             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Attack_Envelope_out1_signed      : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Switch_out1                      : signed(31 DOWNTO 0);  -- sfix32_En28

BEGIN
  -- Curr > Desired:
  -- Attack 
  -- 
  -- Curr < Desired:
  -- Release 

  u_Release_Envelope : Release_Envelope_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Curr => Curr_Gain,  -- sfix32_En28
              Desired => Desired_Gain,  -- sfix32_En28
              Enable => Logical_Operator_out1,
              Gain_out => Release_Envelope_out1  -- sfix32_En28
              );

  u_Attack_Envelope : Attack_Envelope_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Curr => Curr_Gain,  -- sfix32_En28
              Desired => Desired_Gain,  -- sfix32_En28
              Enable => Compare_To_Zero_out1,
              Gain_out => Attack_Envelope_out1  -- sfix32_En28
              );

  Curr_Gain_signed <= signed(Curr_Gain);

  Desired_Gain_signed <= signed(Desired_Gain);

  Subtract_out1 <= Curr_Gain_signed - Desired_Gain_signed;

  
  Compare_To_Zero_out1 <= '1' WHEN Subtract_out1 >= to_signed(0, 32) ELSE
      '0';

  Logical_Operator_out1 <=  NOT Compare_To_Zero_out1;

  
  switch_compare_1 <= '1' WHEN Subtract_out1 >= to_signed(0, 32) ELSE
      '0';

  Release_Envelope_out1_signed <= signed(Release_Envelope_out1);

  Attack_Envelope_out1_signed <= signed(Attack_Envelope_out1);

  
  Switch_out1 <= Release_Envelope_out1_signed WHEN switch_compare_1 = '0' ELSE
      Attack_Envelope_out1_signed;

  Gain_Out <= std_logic_vector(Switch_out1);

END rtl;

