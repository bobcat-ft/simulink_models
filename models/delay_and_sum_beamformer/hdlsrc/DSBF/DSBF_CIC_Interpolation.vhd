-- ------------------------------------------------------------
-- 
-- File Name: /mnt/data/trevor/research/NIH_SBIR_R44_DC015443/simulink_models/models/delay_and_sum_beamformer/hdlsrc/DSBF/DSBF_CIC_Interpolation
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- ------------------------------------------------------------
-- 
-- 
-- ------------------------------------------------------------
-- 
-- Module: DSBF_CIC_Interpolation
-- Source Path: /DSBF_CIC_Interpolation
-- 
-- ------------------------------------------------------------
-- 
-- HDL Implementation    : Fully parallel



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY DSBF_CIC_Interpolation IS
   PORT( clk                             :   IN    std_logic; 
         enb_1_128_1                     :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         DSBF_CIC_Interpolation_in       :   IN    std_logic_vector(31 DOWNTO 0); -- sfix32_En26
         DSBF_CIC_Interpolation_out      :   OUT   std_logic_vector(35 DOWNTO 0)  -- sfix36_En26
         );

END DSBF_CIC_Interpolation;


----------------------------------------------------------------
--Module Architecture: DSBF_CIC_Interpolation
----------------------------------------------------------------
ARCHITECTURE rtl OF DSBF_CIC_Interpolation IS
  -- Local Functions
  -- Type Definitions
  -- Constants
  CONSTANT zeroconst                      : signed(32 DOWNTO 0) := to_signed(0, 33); -- sfix33_En26
  -- Signals
  SIGNAL cur_count                        : unsigned(3 DOWNTO 0); -- ufix4
  SIGNAL phase_0                          : std_logic; -- boolean
  SIGNAL input_typeconvert                : signed(31 DOWNTO 0); -- sfix32_En26
  --   -- Section 1 Signals 
  SIGNAL section_in1                      : signed(31 DOWNTO 0); -- sfix32_En26
  SIGNAL section_cast1                    : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL diff1                            : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL section_out1                     : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL sub_cast                         : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL sub_cast_1                       : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL sub_temp                         : signed(33 DOWNTO 0); -- sfix34_En26
  --   -- Section 2 Signals 
  SIGNAL section_in2                      : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL diff2                            : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL section_out2                     : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL sub_cast_2                       : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL sub_cast_3                       : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL sub_temp_1                       : signed(33 DOWNTO 0); -- sfix34_En26
  SIGNAL upsampling                       : signed(32 DOWNTO 0); -- sfix33_En26
  --   -- Section 3 Signals 
  SIGNAL section_in3                      : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL sum1                             : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL section_out3                     : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL add_cast                         : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL add_cast_1                       : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL add_temp                         : signed(33 DOWNTO 0); -- sfix34_En26
  --   -- Section 4 Signals 
  SIGNAL section_in4                      : signed(32 DOWNTO 0); -- sfix33_En26
  SIGNAL section_cast4                    : signed(35 DOWNTO 0); -- sfix36_En26
  SIGNAL sum2                             : signed(35 DOWNTO 0); -- sfix36_En26
  SIGNAL section_out4                     : signed(35 DOWNTO 0); -- sfix36_En26
  SIGNAL add_cast_2                       : signed(35 DOWNTO 0); -- sfix36_En26
  SIGNAL add_cast_3                       : signed(35 DOWNTO 0); -- sfix36_En26
  SIGNAL add_temp_1                       : signed(36 DOWNTO 0); -- sfix37_En26
  SIGNAL regout                           : signed(35 DOWNTO 0); -- sfix36_En26
  SIGNAL muxout                           : signed(35 DOWNTO 0); -- sfix36_En26


BEGIN

  -- Block Statements
  --   ------------------ CE Output Generation ------------------

  ce_output : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      cur_count <= to_unsigned(0, 4);
    ELSIF rising_edge(clk) THEN
      IF enb_1_128_1 = '1' THEN
        IF cur_count >= to_unsigned(15, 4) THEN
          cur_count <= to_unsigned(0, 4);
        ELSE
          cur_count <= cur_count + to_unsigned(1, 4);
        END IF;
      END IF;
    END IF; 
  END PROCESS ce_output;

  phase_0 <= '1' WHEN cur_count = to_unsigned(0, 4) AND enb_1_128_1 = '1' ELSE '0';

  input_typeconvert <= signed(DSBF_CIC_Interpolation_in);

  --   ------------------ Section # 1 : Comb ------------------

  section_in1 <= input_typeconvert;

  section_cast1 <= resize(section_in1, 33);

  sub_cast <= section_cast1;
  sub_cast_1 <= diff1;
  sub_temp <= resize(sub_cast, 34) - resize(sub_cast_1, 34);
  section_out1 <= sub_temp(32 DOWNTO 0);

  comb_delay_section1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diff1 <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF phase_0 = '1' THEN
        diff1 <= section_cast1;
      END IF;
    END IF; 
  END PROCESS comb_delay_section1;

  --   ------------------ Section # 2 : Comb ------------------

  section_in2 <= section_out1;

  sub_cast_2 <= section_in2;
  sub_cast_3 <= diff2;
  sub_temp_1 <= resize(sub_cast_2, 34) - resize(sub_cast_3, 34);
  section_out2 <= sub_temp_1(32 DOWNTO 0);

  comb_delay_section2 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diff2 <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF phase_0 = '1' THEN
        diff2 <= section_in2;
      END IF;
    END IF; 
  END PROCESS comb_delay_section2;

  upsampling <= section_out2 WHEN ( phase_0 = '1' ) ELSE
                zeroconst;
  --   ------------------ Section # 3 : Integrator ------------------

  section_in3 <= upsampling;

  add_cast <= section_in3;
  add_cast_1 <= section_out3;
  add_temp <= resize(add_cast, 34) + resize(add_cast_1, 34);
  sum1 <= add_temp(32 DOWNTO 0);

  integrator_delay_section3 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      section_out3 <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF enb_1_128_1 = '1' THEN
        section_out3 <= sum1;
      END IF;
    END IF; 
  END PROCESS integrator_delay_section3;

  --   ------------------ Section # 4 : Integrator ------------------

  section_in4 <= section_out3;

  section_cast4 <= resize(section_in4, 36);

  add_cast_2 <= section_cast4;
  add_cast_3 <= section_out4;
  add_temp_1 <= resize(add_cast_2, 37) + resize(add_cast_3, 37);
  sum2 <= add_temp_1(35 DOWNTO 0);

  integrator_delay_section4 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      section_out4 <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF enb_1_128_1 = '1' THEN
        section_out4 <= sum2;
      END IF;
    END IF; 
  END PROCESS integrator_delay_section4;

  DataHoldRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      regout <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF enb_1_128_1 = '1' THEN
        regout <= section_out4;
      END IF;
    END IF; 
  END PROCESS DataHoldRegister_process;

  muxout <= section_out4 WHEN ( enb_1_128_1 = '1' ) ELSE
            regout;
  -- Assignment Statements
  DSBF_CIC_Interpolation_out <= std_logic_vector(muxout);
END rtl;
