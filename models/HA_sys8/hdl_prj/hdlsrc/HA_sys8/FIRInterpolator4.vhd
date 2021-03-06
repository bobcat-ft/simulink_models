-- ------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\HA_sys8\FIRInterpolator4
-- Created: 2018-12-04 11:17:38
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- ------------------------------------------------------------
-- 
-- 
-- ------------------------------------------------------------
-- 
-- Module: FIRInterpolator4
-- Source Path: /FIRInterpolator4
-- 
-- ------------------------------------------------------------
-- 
-- HDL Implementation    : Fully Serial
-- Folding Factor        : 8
-- Multipliers           : 1


LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY FIRInterpolator4 IS
   PORT( clk                             :   IN    std_logic; 
         enb_8_16_1                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         FIRInterpolator4_in             :   IN    std_logic_vector(31 DOWNTO 0); -- sfix32_En28
         FIRInterpolator4_out            :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
         );

END FIRInterpolator4;


----------------------------------------------------------------
--Module Architecture: FIRInterpolator4
----------------------------------------------------------------
ARCHITECTURE rtl OF FIRInterpolator4 IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(31 DOWNTO 0); -- sfix32_En28
  -- Constants
  CONSTANT coeffphase1_1                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_2                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_3                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_4                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_5                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_6                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_7                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_8                  : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_9                  : signed(31 DOWNTO 0) := to_signed(1073741824, 32); -- sfix32_En30
  CONSTANT coeffphase1_10                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_11                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_12                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_13                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_14                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_15                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase1_16                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En30
  CONSTANT coeffphase2_1                  : signed(31 DOWNTO 0) := to_signed(-481003, 32); -- sfix32_En30
  CONSTANT coeffphase2_2                  : signed(31 DOWNTO 0) := to_signed(2638484, 32); -- sfix32_En30
  CONSTANT coeffphase2_3                  : signed(31 DOWNTO 0) := to_signed(-8546469, 32); -- sfix32_En30
  CONSTANT coeffphase2_4                  : signed(31 DOWNTO 0) := to_signed(21508448, 32); -- sfix32_En30
  CONSTANT coeffphase2_5                  : signed(31 DOWNTO 0) := to_signed(-46752491, 32); -- sfix32_En30
  CONSTANT coeffphase2_6                  : signed(31 DOWNTO 0) := to_signed(94736651, 32); -- sfix32_En30
  CONSTANT coeffphase2_7                  : signed(31 DOWNTO 0) := to_signed(-200068505, 32); -- sfix32_En30
  CONSTANT coeffphase2_8                  : signed(31 DOWNTO 0) := to_signed(673829978, 32); -- sfix32_En30
  CONSTANT coeffphase2_9                  : signed(31 DOWNTO 0) := to_signed(673829978, 32); -- sfix32_En30
  CONSTANT coeffphase2_10                 : signed(31 DOWNTO 0) := to_signed(-200068505, 32); -- sfix32_En30
  CONSTANT coeffphase2_11                 : signed(31 DOWNTO 0) := to_signed(94736651, 32); -- sfix32_En30
  CONSTANT coeffphase2_12                 : signed(31 DOWNTO 0) := to_signed(-46752491, 32); -- sfix32_En30
  CONSTANT coeffphase2_13                 : signed(31 DOWNTO 0) := to_signed(21508448, 32); -- sfix32_En30
  CONSTANT coeffphase2_14                 : signed(31 DOWNTO 0) := to_signed(-8546469, 32); -- sfix32_En30
  CONSTANT coeffphase2_15                 : signed(31 DOWNTO 0) := to_signed(2638484, 32); -- sfix32_En30
  CONSTANT coeffphase2_16                 : signed(31 DOWNTO 0) := to_signed(-481003, 32); -- sfix32_En30

  CONSTANT const_zero                     : signed(64 DOWNTO 0) := to_signed(0, 65); -- sfix65_En58
  CONSTANT const_zero_1                   : signed(63 DOWNTO 0) := to_signed(0, 64); -- sfix64_En58
  -- Signals
  SIGNAL cur_count                        : unsigned(3 DOWNTO 0); -- ufix4
  SIGNAL phase_0                          : std_logic; -- boolean
  SIGNAL phase_15                         : std_logic; -- boolean
  SIGNAL phase_1                          : std_logic; -- boolean
  SIGNAL phase_8                          : std_logic; -- boolean
  SIGNAL delay_pipeline                   : delay_pipeline_type(0 TO 15); -- sfix32_En28
  SIGNAL FIRInterpolator4_in_regtype      : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL tapsum_and                       : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL tapsum_and_1                     : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL tapsum_and_2                     : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL tapsum_and_3                     : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL tapsum_and_4                     : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL tapsum_and_5                     : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL tapsum_and_6                     : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL tapsum_and_7                     : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL inputmux                         : signed(32 DOWNTO 0); -- sfix33_En28
  SIGNAL product1                         : signed(64 DOWNTO 0); -- sfix65_En58
  SIGNAL product1_mux                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL phasemux                         : signed(64 DOWNTO 0); -- sfix65_En58
  SIGNAL prod_powertwo_1_9                : signed(63 DOWNTO 0); -- sfix64_En58
  SIGNAL powertwo_mux_1_9                 : signed(63 DOWNTO 0); -- sfix64_En58
  SIGNAL sumofproducts                    : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL add_cast                         : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL add_cast_1                       : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL add_temp                         : signed(68 DOWNTO 0); -- sfix69_En58
  SIGNAL sumofproducts_cast               : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL acc_sum                          : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL accreg_in                        : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL accreg_out                       : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL add_cast_2                       : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL add_cast_3                       : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL add_temp_1                       : signed(68 DOWNTO 0); -- sfix69_En58
  SIGNAL accreg_final                     : signed(67 DOWNTO 0); -- sfix68_En58
  SIGNAL output_typeconvert               : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL regout                           : signed(31 DOWNTO 0); -- sfix32_En28
  SIGNAL muxout                           : signed(31 DOWNTO 0); -- sfix32_En28


BEGIN

  -- Block Statements
  Counter : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        cur_count <= to_unsigned(15, 4);
      ELSIF enb_8_16_1 = '1' THEN
        IF cur_count >= to_unsigned(15, 4) THEN
          cur_count <= to_unsigned(0, 4);
        ELSE
          cur_count <= cur_count + to_unsigned(1, 4);
        END IF;
      END IF;
    END IF; 
  END PROCESS Counter;

  phase_0 <= '1' WHEN cur_count = to_unsigned(0, 4) AND enb_8_16_1 = '1' ELSE '0';

  phase_15 <= '1' WHEN cur_count = to_unsigned(15, 4) AND enb_8_16_1 = '1' ELSE '0';

  phase_1 <= '1' WHEN  (((cur_count = to_unsigned(8, 4))  OR
                         (cur_count = to_unsigned(9, 4))  OR
                         (cur_count = to_unsigned(10, 4))  OR
                         (cur_count = to_unsigned(11, 4))  OR
                         (cur_count = to_unsigned(12, 4))  OR
                         (cur_count = to_unsigned(13, 4))  OR
                         (cur_count = to_unsigned(14, 4))  OR
                         (cur_count = to_unsigned(15, 4)))  AND enb_8_16_1 = '1') ELSE '0';

  phase_8 <= '1' WHEN  (((cur_count = to_unsigned(8, 4))  OR
                         (cur_count = to_unsigned(0, 4)))  AND enb_8_16_1 = '1') ELSE '0';

  --   ---------------- Delay Registers ----------------

  Delay_Pipeline_process : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        delay_pipeline(0 TO 15) <= (OTHERS => (OTHERS => '0'));
      ELSIF phase_15 = '1' THEN
        delay_pipeline(0) <= signed(FIRInterpolator4_in);
        delay_pipeline(1 TO 15) <= delay_pipeline(0 TO 14);
      END IF;
    END IF; 
  END PROCESS Delay_Pipeline_process;

  FIRInterpolator4_in_regtype <= signed(FIRInterpolator4_in);

  -- Adding (or subtracting) the taps based on the symmetry (or asymmetry)

  tapsum_and <= resize(delay_pipeline(0), 33) + resize(delay_pipeline(15), 33);

  tapsum_and_1 <= resize(delay_pipeline(1), 33) + resize(delay_pipeline(14), 33);

  tapsum_and_2 <= resize(delay_pipeline(2), 33) + resize(delay_pipeline(13), 33);

  tapsum_and_3 <= resize(delay_pipeline(3), 33) + resize(delay_pipeline(12), 33);

  tapsum_and_4 <= resize(delay_pipeline(4), 33) + resize(delay_pipeline(11), 33);

  tapsum_and_5 <= resize(delay_pipeline(5), 33) + resize(delay_pipeline(10), 33);

  tapsum_and_6 <= resize(delay_pipeline(6), 33) + resize(delay_pipeline(9), 33);

  tapsum_and_7 <= resize(delay_pipeline(7), 33) + resize(delay_pipeline(8), 33);

  -- Mux(es) to select the input taps for multipliers 

  inputmux <= tapsum_and WHEN ( cur_count = to_unsigned(8, 4) ) ELSE
                   tapsum_and_1 WHEN ( cur_count = to_unsigned(9, 4) ) ELSE
                   tapsum_and_2 WHEN ( cur_count = to_unsigned(10, 4) ) ELSE
                   tapsum_and_3 WHEN ( cur_count = to_unsigned(11, 4) ) ELSE
                   tapsum_and_4 WHEN ( cur_count = to_unsigned(12, 4) ) ELSE
                   tapsum_and_5 WHEN ( cur_count = to_unsigned(13, 4) ) ELSE
                   tapsum_and_6 WHEN ( cur_count = to_unsigned(14, 4) ) ELSE
                   tapsum_and_7;

  product1_mux <= coeffphase2_1 WHEN ( cur_count = to_unsigned(8, 4) ) ELSE
                       coeffphase2_2 WHEN ( cur_count = to_unsigned(9, 4) ) ELSE
                       coeffphase2_3 WHEN ( cur_count = to_unsigned(10, 4) ) ELSE
                       coeffphase2_4 WHEN ( cur_count = to_unsigned(11, 4) ) ELSE
                       coeffphase2_5 WHEN ( cur_count = to_unsigned(12, 4) ) ELSE
                       coeffphase2_6 WHEN ( cur_count = to_unsigned(13, 4) ) ELSE
                       coeffphase2_7 WHEN ( cur_count = to_unsigned(14, 4) ) ELSE
                       coeffphase2_8;
  product1 <= inputmux * product1_mux;

  phasemux <= product1 WHEN ( phase_1 = '1' ) ELSE
                   const_zero;

  -- Implementing products without a multiplier for coefficients with values equal to a power of 2.

  -- value of 'coeffphase1_9' is 1

  prod_powertwo_1_9 <= resize(delay_pipeline(8) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 64);

  -- Mux(es) to select the power of 2 products for the corresponding polyphase

  powertwo_mux_1_9 <= prod_powertwo_1_9 WHEN ( phase_0 = '1' ) ELSE
                           const_zero_1;

  -- Add the products in linear fashion

  add_cast <= resize(phasemux, 68);
  add_cast_1 <= resize(powertwo_mux_1_9, 68);
  add_temp <= resize(add_cast, 69) + resize(add_cast_1, 69);
  sumofproducts <= (67 => '0', OTHERS => '1') WHEN add_temp(68) = '0' AND add_temp(67) /= '0'
      ELSE (67 => '1', OTHERS => '0') WHEN add_temp(68) = '1' AND add_temp(67) /= '1'
      ELSE (add_temp(67 DOWNTO 0));

  -- Resize the sum of products to the accumulator type for full precision addition

  sumofproducts_cast <= sumofproducts;

  -- Accumulator register with a mux to reset it with the first addend

  add_cast_2 <= sumofproducts_cast;
  add_cast_3 <= accreg_out;
  add_temp_1 <= resize(add_cast_2, 69) + resize(add_cast_3, 69);
  acc_sum <= (67 => '0', OTHERS => '1') WHEN add_temp_1(68) = '0' AND add_temp_1(67) /= '0'
      ELSE (67 => '1', OTHERS => '0') WHEN add_temp_1(68) = '1' AND add_temp_1(67) /= '1'
      ELSE (add_temp_1(67 DOWNTO 0));

  accreg_in <= sumofproducts_cast WHEN ( phase_8 = '1' ) ELSE
                    acc_sum;

  Acc_reg_process : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        accreg_out <= (OTHERS => '0');
      ELSIF enb_8_16_1 = '1' THEN
        accreg_out <= accreg_in;
      END IF;
    END IF; 
  END PROCESS Acc_reg_process;

  -- Register to hold the final value of the accumulated sum

  Acc_finalreg_process : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        accreg_final <= (OTHERS => '0');
      ELSIF phase_8 = '1' THEN
        accreg_final <= accreg_out;
      END IF;
    END IF; 
  END PROCESS Acc_finalreg_process;

  output_typeconvert <= (31 => '0', OTHERS => '1') WHEN accreg_final(67) = '0' AND accreg_final(66 DOWNTO 61) /= "000000"
      ELSE (31 => '1', OTHERS => '0') WHEN accreg_final(67) = '1' AND accreg_final(66 DOWNTO 61) /= "111111"
      ELSE (accreg_final(61 DOWNTO 30));

  DataHoldRegister_process : PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF reset = '1' THEN
        regout <= (OTHERS => '0');
      ELSIF enb_8_16_1 = '1' THEN
        regout <= output_typeconvert;
      END IF;
    END IF; 
  END PROCESS DataHoldRegister_process;

  muxout <= output_typeconvert WHEN ( enb_8_16_1 = '1' ) ELSE
            regout;
  -- Assignment Statements
  FIRInterpolator4_out <= std_logic_vector(muxout);
END rtl;
