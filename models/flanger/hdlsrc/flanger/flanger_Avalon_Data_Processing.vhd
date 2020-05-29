-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\bugsbunny\research\NIH\simulink_models\models\flanger\hdlsrc\flanger\flanger_Avalon_Data_Processing.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: flanger_Avalon_Data_Processing
-- Source Path: flanger/dataplane/Avalon Data Processing
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.flanger_dataplane_pkg.ALL;

ENTITY flanger_Avalon_Data_Processing IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Sink_Data                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Sink_Channel                      :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        enable                            :   IN    std_logic;
        rate                              :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8_En5
        regen                             :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8_En7
        Enable_1                          :   IN    std_logic;
        Source_Data                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
        Source_Channel                    :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
        );
END flanger_Avalon_Data_Processing;


ARCHITECTURE rtl OF flanger_Avalon_Data_Processing IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT flanger_Left_Channel_Processing
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          left_data_in                    :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          enable                          :   IN    std_logic;
          rate                            :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8_En5
          regen                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8_En7
          Enable_1                        :   IN    std_logic;
          left_data_out                   :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  COMPONENT flanger_Right_Channel_Processing
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          right_data_in                   :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En28
          enable                          :   IN    std_logic;
          rate                            :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8_En5
          regen                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8_En7
          Enable_1                        :   IN    std_logic;
          right_data_out                  :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En28
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : flanger_Left_Channel_Processing
    USE ENTITY work.flanger_Left_Channel_Processing(rtl);

  FOR ALL : flanger_Right_Channel_Processing
    USE ENTITY work.flanger_Right_Channel_Processing(rtl);

  -- Signals
  SIGNAL Enable_out6                      : std_logic;
  SIGNAL delayMatch2_reg                  : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Enable_out6_1                    : std_logic;
  SIGNAL Sink_Channel_unsigned            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Compare_To_Constant2_out1        : std_logic;
  SIGNAL Compare_To_Constant2_out1_1      : std_logic;
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL Compare_To_Constant1_out1_1      : std_logic;
  SIGNAL delayMatch_reg                   : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL Sink_Channel_1                   : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL left_data_out                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL left_data_out_signed             : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL right_data_out                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL right_data_out_signed            : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Sink_Data_signed                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL delayMatch1_reg                  : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL data_in                          : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Multiport_Switch_out1            : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Multiport_Switch_out1_bypass     : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Multiport_Switch_out1_last_value : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Sink_Channel_bypass              : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Sink_Channel_last_value          : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  -- Select output data
  -- based on channel number
  -- 
  -- Check if Channel 0 
  -- (Left Channel)
  -- 
  -- The Left Channel Processing block 
  -- only executes when channel 0
  -- is detected
  -- 
  -- The Right Channel Processing block 
  -- only executes when channel 1
  -- is detected
  -- 
  -- Check if Channel 1 
  -- (Right Channel)
  -- 
  -- An enabled subsystem
  -- This subsystem only runs when the data valid signal is enabled (asserted)
  -- 

  u_Left_Channel_Processing : flanger_Left_Channel_Processing
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              left_data_in => Sink_Data,  -- sfix32_En28
              enable => enable,
              rate => rate,  -- ufix8_En5
              regen => regen,  -- ufix8_En7
              Enable_1 => Compare_To_Constant2_out1_1,
              left_data_out => left_data_out  -- sfix32_En28
              );

  u_Right_Channel_Processing : flanger_Right_Channel_Processing
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              right_data_in => Sink_Data,  -- sfix32_En28
              enable => enable,
              rate => rate,  -- ufix8_En5
              regen => regen,  -- ufix8_En7
              Enable_1 => Compare_To_Constant1_out1_1,
              right_data_out => right_data_out  -- sfix32_En28
              );

  Enable_out6 <= Enable_1;

  delayMatch2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch2_reg <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        delayMatch2_reg(0) <= Enable_out6;
        delayMatch2_reg(1) <= delayMatch2_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  Enable_out6_1 <= delayMatch2_reg(1);

  Sink_Channel_unsigned <= unsigned(Sink_Channel);

  
  Compare_To_Constant2_out1 <= '1' WHEN Sink_Channel_unsigned = to_unsigned(16#0#, 2) ELSE
      '0';

  Compare_To_Constant2_out1_1 <= Compare_To_Constant2_out1 AND Enable_out6;

  
  Compare_To_Constant1_out1 <= '1' WHEN Sink_Channel_unsigned = to_unsigned(16#1#, 2) ELSE
      '0';

  Compare_To_Constant1_out1_1 <= Compare_To_Constant1_out1 AND Enable_out6;

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg <= (OTHERS => to_unsigned(16#0#, 2));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        delayMatch_reg(0) <= Sink_Channel_unsigned;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  Sink_Channel_1 <= delayMatch_reg(1);

  left_data_out_signed <= signed(left_data_out);

  right_data_out_signed <= signed(right_data_out);

  Sink_Data_signed <= signed(Sink_Data);

  delayMatch1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch1_reg <= (OTHERS => to_signed(0, 32));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        delayMatch1_reg(0) <= Sink_Data_signed;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  data_in <= delayMatch1_reg(1);

  
  Multiport_Switch_out1 <= left_data_out_signed WHEN Sink_Channel_1 = to_unsigned(16#0#, 2) ELSE
      right_data_out_signed WHEN Sink_Channel_1 = to_unsigned(16#1#, 2) ELSE
      data_in;

  Source_Data_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Multiport_Switch_out1_last_value <= to_signed(0, 32);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        Multiport_Switch_out1_last_value <= Multiport_Switch_out1_bypass;
      END IF;
    END IF;
  END PROCESS Source_Data_bypass_process;


  
  Multiport_Switch_out1_bypass <= Multiport_Switch_out1_last_value WHEN Enable_out6_1 = '0' ELSE
      Multiport_Switch_out1;

  Source_Data <= std_logic_vector(Multiport_Switch_out1_bypass);

  Source_Channel_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Sink_Channel_last_value <= to_unsigned(16#0#, 2);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        Sink_Channel_last_value <= Sink_Channel_bypass;
      END IF;
    END IF;
  END PROCESS Source_Channel_bypass_process;


  
  Sink_Channel_bypass <= Sink_Channel_last_value WHEN Enable_out6 = '0' ELSE
      Sink_Channel_unsigned;

  Source_Channel <= std_logic_vector(Sink_Channel_bypass);

END rtl;

