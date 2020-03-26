-- -------------------------------------------------------------
-- 
-- File Name: /mnt/data/trevor/research/NIH_SBIR_R44_DC015443/simulink_models/models/delay_and_sum_beamformer/hdlsrc/DSBF/DSBF_compute_delays.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DSBF_compute_delays
-- Source Path: DSBF/dataplane/compute_delays
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.DSBF_dataplane_pkg.ALL;

ENTITY DSBF_compute_delays IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        sin_azimuth                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        cos_elevation                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        sin_elevation                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        delays                            :   OUT   vector_of_std_logic_vector12(0 TO 15)  -- sfix12_En6 [16]
        );
END DSBF_compute_delays;


ARCHITECTURE rtl OF DSBF_compute_delays IS

  ATTRIBUTE multstyle : string;

  -- Constants
  CONSTANT yElementIdx                    : vector_of_signed5(0 TO 3) := 
    (to_signed(16#00#, 5), to_signed(16#02#, 5), to_signed(16#04#, 5), to_signed(16#06#, 5));  -- sfix5 [4]
  CONSTANT nc                             : vector_of_signed23(0 TO 3) := 
    (to_signed(-16#000999#, 23), to_signed(-16#000333#, 23), to_signed(16#000333#, 23),
     to_signed(16#000999#, 23));  -- sfix23 [4]
  CONSTANT nc_0                           : vector_of_signed46(0 TO 3) := 
    (signed'("0000000000001001100110010000000000000000000000"),
     signed'("0000000000000011001100110000000000000000000000"),
     signed'("1111111111111100110011010000000000000000000000"),
     signed'("1111111111110110011001110000000000000000000000"));  -- sfix46 [4]

  -- Signals
  SIGNAL sin_azimuth_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL cos_elevation_signed             : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL delayMatch_reg                   : vector_of_signed16(0 TO 3);  -- sfix16 [4]
  SIGNAL cos_elevation_1                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL sin_elevation_signed             : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL delays_tmp                       : vector_of_signed12(0 TO 15);  -- sfix12_En6 [16]

BEGIN
  sin_azimuth_signed <= signed(sin_azimuth);

  cos_elevation_signed <= signed(cos_elevation);

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        delayMatch_reg(0) <= cos_elevation_signed;
        delayMatch_reg(1 TO 3) <= delayMatch_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  cos_elevation_1 <= delayMatch_reg(3);

  sin_elevation_signed <= signed(sin_elevation);

  compute_delays_output : PROCESS (cos_elevation_1, sin_azimuth_signed, sin_elevation_signed)
    VARIABLE idx : unsigned(4 DOWNTO 0);
    VARIABLE y : signed(4 DOWNTO 0);
    VARIABLE z : signed(4 DOWNTO 0);
    VARIABLE add_temp : vector_of_unsigned6(0 TO 3);
    VARIABLE sub_cast : vector_of_signed32(0 TO 3);
    VARIABLE add_cast : vector_of_signed6(0 TO 3);
    VARIABLE add_temp_0 : vector_of_signed6(0 TO 3);
    VARIABLE sub_cast_0 : vector_of_signed32(0 TO 3);
    VARIABLE mul_temp : vector_of_signed39(0 TO 3);
    VARIABLE mul_temp_0 : vector_of_signed55(0 TO 3);
    VARIABLE add_cast_0 : vector_of_signed64(0 TO 3);
    VARIABLE add_cast_1 : vector_of_signed6(0 TO 3);
    VARIABLE add_temp_1 : vector_of_signed6(0 TO 3);
    VARIABLE sub_cast_1 : vector_of_signed32(0 TO 3);
    VARIABLE mul_temp_1 : vector_of_signed62(0 TO 3);
    VARIABLE add_cast_2 : vector_of_signed64(0 TO 3);
    VARIABLE add_temp_2 : vector_of_signed64(0 TO 3);
    VARIABLE mul_temp_2 : vector_of_signed80(0 TO 3);
  BEGIN
    --MATLAB Function 'dataplane/compute_delays': '<S8>:1'
    -- meters
    -- meters/second
    --'<S8>:1:10'
    delays_tmp <= (OTHERS => to_signed(16#000#, 12));
    --'<S8>:1:17'
    idx := to_unsigned(16#00#, 5);
    --'<S8>:1:19'

    FOR y_0 IN 0 TO 3 LOOP
      --'<S8>:1:19'
      y := yElementIdx(y_0);
      --'<S8>:1:20'

      FOR z_0 IN 0 TO 3 LOOP
        --'<S8>:1:20'
        z := yElementIdx(z_0);
        --'<S8>:1:21'
        add_temp(z_0) := resize(idx, 6) + to_unsigned(16#01#, 6);
        IF add_temp(z_0)(5) /= '0' THEN 
          idx := "11111";
        ELSE 
          idx := add_temp(z_0)(4 DOWNTO 0);
        END IF;
        --'<S8>:1:22'
        sub_cast(z_0) := signed(resize(idx, 32));
        add_cast(z_0) := resize(y, 6);
        add_temp_0(z_0) := add_cast(z_0) + to_signed(16#02#, 6);
        sub_cast_0(z_0) := resize(add_temp_0(z_0)(5 DOWNTO 1), 32);
        mul_temp(z_0) := nc(to_integer(sub_cast_0(z_0) - 1)) * sin_azimuth_signed;
        mul_temp_0(z_0) := mul_temp(z_0) * cos_elevation_1;
        add_cast_0(z_0) := resize(mul_temp_0(z_0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 64);
        add_cast_1(z_0) := resize(z, 6);
        add_temp_1(z_0) := add_cast_1(z_0) + to_signed(16#02#, 6);
        sub_cast_1(z_0) := resize(add_temp_1(z_0)(5 DOWNTO 1), 32);
        mul_temp_1(z_0) := nc_0(to_integer(sub_cast_1(z_0) - 1)) * sin_elevation_signed;
        add_cast_2(z_0) := resize(mul_temp_1(z_0), 64);
        add_temp_2(z_0) := add_cast_0(z_0) + add_cast_2(z_0);
        mul_temp_2(z_0) := to_signed(-16#0046#, 16) * add_temp_2(z_0);
        IF ((mul_temp_2(z_0)(79) = '0') AND (mul_temp_2(z_0)(78 DOWNTO 56) /= "00000000000000000000000")) OR ((mul_temp_2(z_0)(79) = '0') AND (mul_temp_2(z_0)(56 DOWNTO 45) = "011111111111")) THEN 
          delays_tmp(to_integer(sub_cast(z_0) - 1)) <= "011111111111";
        ELSIF (mul_temp_2(z_0)(79) = '1') AND (mul_temp_2(z_0)(78 DOWNTO 56) /= "11111111111111111111111") THEN 
          delays_tmp(to_integer(sub_cast(z_0) - 1)) <= "100000000000";
        ELSE 
          delays_tmp(to_integer(sub_cast(z_0) - 1)) <= mul_temp_2(z_0)(56 DOWNTO 45) + ('0' & mul_temp_2(z_0)(44));
        END IF;
      END LOOP;

    END LOOP;

  END PROCESS compute_delays_output;


  outputgen: FOR k IN 0 TO 15 GENERATE
    delays(k) <= std_logic_vector(delays_tmp(k));
  END GENERATE;

END rtl;

