-- -------------------------------------------------------------
-- 
-- File Name: /mnt/data/trevor/research/NIH_SBIR_R44_DC015443/simulink_models/models/delay_and_sum_beamformer/hdlsrc/DSBF/DSBF_delay_signal.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DSBF_delay_signal
-- Source Path: DSBF/dataplane/Avalon Data Processing/delay signals/delay signal
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.DSBF_dataplane_pkg.ALL;

ENTITY DSBF_delay_signal IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_128_1                       :   IN    std_logic;
        enb_1_2048_0                      :   IN    std_logic;
        enb_1_128_0                       :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        delay                             :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En6
        data_out                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
        );
END DSBF_delay_signal;


ARCHITECTURE rtl OF DSBF_delay_signal IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT DSBF_split_into_int_and_frac_parts
    PORT( delay                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En6
          integer_delay                   :   OUT   std_logic_vector(5 DOWNTO 0);  -- sfix6
          fractional_delay                :   OUT   std_logic_vector(5 DOWNTO 0)  -- sfix6
          );
  END COMPONENT;

  COMPONENT DSBF_read_address_generator
    PORT( write_addr                      :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          delay                           :   IN    std_logic_vector(5 DOWNTO 0);  -- sfix6
          read_addr                       :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
          );
  END COMPONENT;

  COMPONENT DSBF_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2048_0                    :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT DSBF_CIC_interpolation_compensator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2048_0                    :   IN    std_logic;
          dataIn                          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          validIn                         :   IN    std_logic;
          dataOut                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En26
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT DSBF_CIC_Interpolation
    PORT( clk                             :   IN    std_logic;
          enb_1_128_1                     :   IN    std_logic;
          reset                           :   IN    std_logic;
          DSBF_CIC_Interpolation_in       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En26
          DSBF_CIC_Interpolation_out      :   OUT   std_logic_vector(35 DOWNTO 0)  -- sfix36_En26
          );
  END COMPONENT;

  COMPONENT DSBF_read_address_generator1
    PORT( write_addr                      :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          delay                           :   IN    std_logic_vector(5 DOWNTO 0);  -- sfix6
          read_addr                       :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
          );
  END COMPONENT;

  COMPONENT DSBF_SimpleDualPortRAM_generic_block
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_128_0                     :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT DSBF_CIC_Decimation
    PORT( clk                             :   IN    std_logic;
          enb_1_128_1                     :   IN    std_logic;
          reset                           :   IN    std_logic;
          DSBF_CIC_Decimation_in          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          DSBF_CIC_Decimation_out         :   OUT   std_logic_vector(39 DOWNTO 0)  -- sfix40_En28
          );
  END COMPONENT;

  COMPONENT DSBF_CIC_decimation_compensator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_2048_0                    :   IN    std_logic;
          dataIn                          :   IN    std_logic_vector(39 DOWNTO 0);  -- sfix40_En28
          validIn                         :   IN    std_logic;
          dataOut                         :   OUT   std_logic_vector(39 DOWNTO 0);  -- sfix40_En26
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : DSBF_split_into_int_and_frac_parts
    USE ENTITY work.DSBF_split_into_int_and_frac_parts(rtl);

  FOR ALL : DSBF_read_address_generator
    USE ENTITY work.DSBF_read_address_generator(rtl);

  FOR ALL : DSBF_SimpleDualPortRAM_generic
    USE ENTITY work.DSBF_SimpleDualPortRAM_generic(rtl);

  FOR ALL : DSBF_CIC_interpolation_compensator
    USE ENTITY work.DSBF_CIC_interpolation_compensator(rtl);

  FOR ALL : DSBF_CIC_Interpolation
    USE ENTITY work.DSBF_CIC_Interpolation(rtl);

  FOR ALL : DSBF_read_address_generator1
    USE ENTITY work.DSBF_read_address_generator1(rtl);

  FOR ALL : DSBF_SimpleDualPortRAM_generic_block
    USE ENTITY work.DSBF_SimpleDualPortRAM_generic_block(rtl);

  FOR ALL : DSBF_CIC_Decimation
    USE ENTITY work.DSBF_CIC_Decimation(rtl);

  FOR ALL : DSBF_CIC_decimation_compensator
    USE ENTITY work.DSBF_CIC_decimation_compensator(rtl);

  -- Signals
  SIGNAL write_address_generator_out1     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL reduced_reg                      : vector_of_unsigned6(0 TO 1);  -- ufix6 [2]
  SIGNAL write_address_generator_out1_1   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant2_out1                   : std_logic;
  SIGNAL integer_delay                    : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL fractional_delay                 : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL read_address_generator_out1      : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL integer_delay_DPRAM_out1         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL CIC_interpolation_compensator_out1 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL CIC_interpolation_compensator_out2 : std_logic;
  SIGNAL CIC_Interpolation_out1           : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL CIC_Interpolation_out1_signed    : signed(35 DOWNTO 0);  -- sfix36_En26
  SIGNAL CIC_interpolation_gain_compensation_out1 : signed(35 DOWNTO 0);  -- sfix36_En26
  SIGNAL Data_Type_Conversion_out1        : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL write_address_generator1_out1    : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL reduced_reg_1                    : vector_of_unsigned6(0 TO 31);  -- ufix6 [32]
  SIGNAL write_address_generator1_out1_1  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL fractional_delay_signed          : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL Constant1_out1                   : std_logic;
  SIGNAL Rate_Transition_out1             : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL read_address_generator1_out1     : std_logic_vector(5 DOWNTO 0);  -- ufix6
  SIGNAL fractional_delay_DPRAM_out1      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL CIC_Decimation_out1              : std_logic_vector(39 DOWNTO 0);  -- ufix40
  SIGNAL CIC_Decimation_out1_signed       : signed(39 DOWNTO 0);  -- sfix40_En28
  SIGNAL CIC_decimation_gain_compensation_out1 : signed(39 DOWNTO 0);  -- sfix40_En28
  SIGNAL Constant4_out1                   : std_logic;
  SIGNAL CIC_decimation_compensator_out1  : std_logic_vector(39 DOWNTO 0);  -- ufix40
  SIGNAL CIC_decimation_compensator_out2  : std_logic;
  SIGNAL CIC_decimation_compensator_out1_signed : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL Data_Type_Conversion1_out1       : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Rate_Transition1_out1            : signed(31 DOWNTO 0);  -- sfix32_En28

BEGIN
  -- CIC interpolation
  -- 
  -- CIC decimation
  -- 
  -- Integer delay
  -- 
  -- fractional delay (upsampled)

  u_split_into_int_and_frac_parts : DSBF_split_into_int_and_frac_parts
    PORT MAP( delay => delay,  -- sfix12_En6
              integer_delay => integer_delay,  -- sfix6
              fractional_delay => fractional_delay  -- sfix6
              );

  u_read_address_generator : DSBF_read_address_generator
    PORT MAP( write_addr => std_logic_vector(write_address_generator_out1_1),  -- ufix6
              delay => integer_delay,  -- sfix6
              read_addr => read_address_generator_out1  -- ufix6
              );

  u_integer_delay_DPRAM : DSBF_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 6,
                 DataWidth => 32
                 )
    PORT MAP( clk => clk,
              enb_1_2048_0 => enb_1_2048_0,
              wr_din => data_in,
              wr_addr => std_logic_vector(write_address_generator_out1_1),
              wr_en => Constant2_out1,
              rd_addr => read_address_generator_out1,
              rd_dout => integer_delay_DPRAM_out1
              );

  u_CIC_interpolation_compensator : DSBF_CIC_interpolation_compensator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2048_0 => enb_1_2048_0,
              dataIn => integer_delay_DPRAM_out1,  -- sfix32_En28
              validIn => Constant_out1,
              dataOut => CIC_interpolation_compensator_out1,  -- sfix32_En26
              validOut => CIC_interpolation_compensator_out2
              );

  u_DSBF_CIC_Interpolation : DSBF_CIC_Interpolation
    PORT MAP( clk => clk,
              enb_1_128_1 => enb_1_128_1,
              reset => reset,
              DSBF_CIC_Interpolation_in => CIC_interpolation_compensator_out1,  -- sfix32_En26
              DSBF_CIC_Interpolation_out => CIC_Interpolation_out1  -- sfix36_En26
              );

  u_read_address_generator1 : DSBF_read_address_generator1
    PORT MAP( write_addr => std_logic_vector(write_address_generator1_out1_1),  -- ufix6
              delay => std_logic_vector(Rate_Transition_out1),  -- sfix6
              read_addr => read_address_generator1_out1  -- ufix6
              );

  u_fractional_delay_DPRAM : DSBF_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 6,
                 DataWidth => 32
                 )
    PORT MAP( clk => clk,
              enb_1_128_0 => enb_1_128_0,
              wr_din => std_logic_vector(Data_Type_Conversion_out1),
              wr_addr => std_logic_vector(write_address_generator1_out1_1),
              wr_en => Constant1_out1,
              rd_addr => read_address_generator1_out1,
              rd_dout => fractional_delay_DPRAM_out1
              );

  u_DSBF_CIC_Decimation : DSBF_CIC_Decimation
    PORT MAP( clk => clk,
              enb_1_128_1 => enb_1_128_1,
              reset => reset,
              DSBF_CIC_Decimation_in => fractional_delay_DPRAM_out1,  -- sfix32_En28
              DSBF_CIC_Decimation_out => CIC_Decimation_out1  -- sfix40_En28
              );

  u_CIC_decimation_compensator : DSBF_CIC_decimation_compensator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_2048_0 => enb_1_2048_0,
              dataIn => std_logic_vector(CIC_decimation_gain_compensation_out1),  -- sfix40_En28
              validIn => Constant4_out1,
              dataOut => CIC_decimation_compensator_out1,  -- sfix40_En26
              validOut => CIC_decimation_compensator_out2
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 63
  -- 
  write_address_generator_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_address_generator_out1 <= to_unsigned(16#00#, 6);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        write_address_generator_out1 <= write_address_generator_out1 + to_unsigned(16#01#, 6);
      END IF;
    END IF;
  END PROCESS write_address_generator_process;


  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg <= (OTHERS => to_unsigned(16#00#, 6));
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        reduced_reg(0) <= write_address_generator_out1;
        reduced_reg(1) <= reduced_reg(0);
      END IF;
    END IF;
  END PROCESS reduced_process;

  write_address_generator_out1_1 <= reduced_reg(1);

  Constant2_out1 <= '1';

  Constant_out1 <= '1';

  CIC_Interpolation_out1_signed <= signed(CIC_Interpolation_out1);

  CIC_interpolation_gain_compensation_out1 <= SHIFT_RIGHT(CIC_Interpolation_out1_signed, 4);

  Data_Type_Conversion_out1 <= CIC_interpolation_gain_compensation_out1(29 DOWNTO 0) & '0' & '0';

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 63
  -- 
  write_address_generator1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_address_generator1_out1 <= to_unsigned(16#00#, 6);
    ELSIF rising_edge(clk) THEN
      IF enb_1_128_0 = '1' THEN
        write_address_generator1_out1 <= write_address_generator1_out1 + to_unsigned(16#01#, 6);
      END IF;
    END IF;
  END PROCESS write_address_generator1_process;


  reduced_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg_1 <= (OTHERS => to_unsigned(16#00#, 6));
    ELSIF rising_edge(clk) THEN
      IF enb_1_128_0 = '1' THEN
        reduced_reg_1(0) <= write_address_generator1_out1;
        reduced_reg_1(1 TO 31) <= reduced_reg_1(0 TO 30);
      END IF;
    END IF;
  END PROCESS reduced_1_process;

  write_address_generator1_out1_1 <= reduced_reg_1(31);

  fractional_delay_signed <= signed(fractional_delay);

  Constant1_out1 <= '1';

  Rate_Transition_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Rate_Transition_out1 <= to_signed(16#00#, 6);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        Rate_Transition_out1 <= fractional_delay_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition_process;


  CIC_Decimation_out1_signed <= signed(CIC_Decimation_out1);

  CIC_decimation_gain_compensation_out1 <= SHIFT_RIGHT(CIC_Decimation_out1_signed, 8);

  Constant4_out1 <= '1';

  CIC_decimation_compensator_out1_signed <= signed(CIC_decimation_compensator_out1);

  Data_Type_Conversion1_out1 <= CIC_decimation_compensator_out1_signed(29 DOWNTO 0) & '0' & '0';

  Rate_Transition1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Rate_Transition1_out1 <= to_signed(0, 32);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        Rate_Transition1_out1 <= Data_Type_Conversion1_out1;
      END IF;
    END IF;
  END PROCESS Rate_Transition1_process;


  data_out <= std_logic_vector(Rate_Transition1_out1);



END rtl;

