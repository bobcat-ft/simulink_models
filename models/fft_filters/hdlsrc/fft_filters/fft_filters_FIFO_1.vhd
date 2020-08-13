-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\wickh\Documents\NIH\simulink_models\models\fft_filters\hdlsrc\fft_filters\fft_filters_FIFO_1.vhd
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: fft_filters_FIFO_1
-- Source Path: fft_filters/dataplane/FFT_Analysis_Synthesis_Left/Synthesis/Overlap_and_Add/FIFO_1
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fft_filters_FIFO_1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_262144_1                    :   IN    std_logic;
        enb_1_2048_0                      :   IN    std_logic;
        enb_1_2048_1                      :   IN    std_logic;
        In_rsvd                           :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
        Push                              :   IN    std_logic;
        Pop                               :   IN    std_logic;
        Out_rsvd                          :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En23
        Full                              :   OUT   std_logic  -- ufix1
        );
END fft_filters_FIFO_1;


ARCHITECTURE rtl OF fft_filters_FIFO_1 IS

  -- Component Declarations
  COMPONENT fft_filters_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2048_0                    :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : fft_filters_SimpleDualPortRAM_generic
    USE ENTITY work.fft_filters_SimpleDualPortRAM_generic(rtl);

  -- Signals
  SIGNAL us3_zero                         : std_logic;
  SIGNAL us3_muxout                       : std_logic;
  SIGNAL us3_bypass_reg                   : std_logic;  -- ufix1
  SIGNAL us3_bypassout                    : std_logic;
  SIGNAL fifo_front_indx                  : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_front_dir                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_back_indx                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_back_dir                    : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_sample_count                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL fifo_front_indx_next             : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_front_dir_next              : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_back_indx_next              : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_back_dir_next               : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_sample_count_next           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL fifo_out3                        : std_logic;
  SIGNAL fifo_out4                        : std_logic;
  SIGNAL fifo_write_enable                : std_logic;
  SIGNAL fifo_read_enable                 : std_logic;
  SIGNAL fifo_front_indx_temp             : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL fifo_back_indx_temp              : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL w_waddr                          : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL w_we                             : std_logic;  -- ufix1
  SIGNAL w_raddr                          : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL w_empty                          : std_logic;  -- ufix1
  SIGNAL w_num                            : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL w_cz                             : std_logic;
  SIGNAL w_const                          : std_logic;  -- ufix1
  SIGNAL w_mux1                           : std_logic;  -- ufix1
  SIGNAL w_d1                             : std_logic;  -- ufix1
  SIGNAL w_waddr_1                        : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL w_waddr_signed                   : signed(30 DOWNTO 0);  -- sfix31_En23
  SIGNAL w_d2                             : signed(30 DOWNTO 0);  -- sfix31_En23
  SIGNAL w_out                            : signed(30 DOWNTO 0);  -- sfix31_En23
  SIGNAL downsample_bypass_reg            : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Out_tmp                          : signed(30 DOWNTO 0);  -- sfix31_En23

BEGIN
  -- us2: Upsample by 1, Sample offset 0 
  -- 
  -- us1: Upsample by 1, Sample offset 0 
  u_FIFO_1_ram : fft_filters_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 7,
                 DataWidth => 31
                 )
    PORT MAP( clk => clk,
              enb_1_2048_0 => enb_1_2048_0,
              wr_din => In_rsvd,
              wr_addr => std_logic_vector(w_waddr),
              wr_en => w_we,  -- ufix1
              rd_addr => std_logic_vector(w_raddr),
              rd_dout => w_waddr_1
              );

  -- us3: Upsample by 128, Sample offset 0 
  us3_zero <= '0';

  
  us3_muxout <= Pop WHEN enb_1_262144_1 = '1' ELSE
      us3_zero;

  -- Upsample bypass register
  us3_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      us3_bypass_reg <= '0';
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_1 = '1' THEN
        us3_bypass_reg <= us3_muxout;
      END IF;
    END IF;
  END PROCESS us3_bypass_process;

  
  us3_bypassout <= us3_muxout WHEN enb_1_2048_1 = '1' ELSE
      us3_bypass_reg;

  -- FIFO logic controller
  fifo_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fifo_front_indx <= to_unsigned(16#00#, 7);
      fifo_front_dir <= to_unsigned(16#01#, 7);
      fifo_back_indx <= to_unsigned(16#00#, 7);
      fifo_back_dir <= to_unsigned(16#01#, 7);
      fifo_sample_count <= to_unsigned(16#00#, 8);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        fifo_front_indx <= fifo_front_indx_next;
        fifo_front_dir <= fifo_front_dir_next;
        fifo_back_indx <= fifo_back_indx_next;
        fifo_back_dir <= fifo_back_dir_next;
        fifo_sample_count <= fifo_sample_count_next;
      END IF;
    END IF;
  END PROCESS fifo_process;

  
  fifo_out4 <= '1' WHEN fifo_sample_count = to_unsigned(16#80#, 8) ELSE
      '0';
  
  fifo_out3 <= '1' WHEN fifo_sample_count = to_unsigned(16#00#, 8) ELSE
      '0';
  fifo_write_enable <= Push AND (us3_bypassout OR ( NOT fifo_out4));
  fifo_read_enable <= us3_bypassout AND ( NOT fifo_out3);
  
  fifo_front_indx_temp <= fifo_front_indx + fifo_front_dir WHEN fifo_read_enable = '1' ELSE
      fifo_front_indx;
  
  fifo_front_dir_next <= to_unsigned(16#01#, 7) WHEN fifo_front_indx_temp = to_unsigned(16#7F#, 7) ELSE
      to_unsigned(16#01#, 7);
  
  fifo_back_indx_temp <= fifo_back_indx + fifo_back_dir WHEN fifo_write_enable = '1' ELSE
      fifo_back_indx;
  
  fifo_back_dir_next <= to_unsigned(16#01#, 7) WHEN fifo_back_indx_temp = to_unsigned(16#7F#, 7) ELSE
      to_unsigned(16#01#, 7);
  
  fifo_sample_count_next <= fifo_sample_count + to_unsigned(16#01#, 8) WHEN (fifo_write_enable AND ( NOT fifo_read_enable)) = '1' ELSE
      fifo_sample_count + to_unsigned(16#FF#, 8) WHEN (( NOT fifo_write_enable) AND fifo_read_enable) = '1' ELSE
      fifo_sample_count;
  w_waddr <= fifo_back_indx;
  w_we <= fifo_write_enable;
  w_raddr <= fifo_front_indx;
  w_empty <= fifo_out3;
  Full <= fifo_out4;
  w_num <= fifo_sample_count;
  fifo_front_indx_next <= fifo_front_indx_temp;
  fifo_back_indx_next <= fifo_back_indx_temp;

  
  w_cz <= '1' WHEN w_num > to_unsigned(16#00#, 8) ELSE
      '0';

  w_const <= '0';

  
  w_mux1 <= w_const WHEN w_cz = '0' ELSE
      us3_bypassout;

  f_d1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      w_d1 <= '0';
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' THEN
        w_d1 <= w_mux1;
      END IF;
    END IF;
  END PROCESS f_d1_process;


  w_waddr_signed <= signed(w_waddr_1);

  f_d2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      w_d2 <= to_signed(16#00000000#, 31);
    ELSIF rising_edge(clk) THEN
      IF enb_1_2048_0 = '1' AND w_d1 = '1' THEN
        w_d2 <= w_waddr_signed;
      END IF;
    END IF;
  END PROCESS f_d2_process;


  
  w_out <= w_d2 WHEN w_d1 = '0' ELSE
      w_waddr_signed;

  -- downsample: Downsample by 128, Sample offset 0 
  -- Downsample bypass register
  downsample_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      downsample_bypass_reg <= to_signed(16#00000000#, 31);
    ELSIF rising_edge(clk) THEN
      IF enb_1_262144_1 = '1' THEN
        downsample_bypass_reg <= w_out;
      END IF;
    END IF;
  END PROCESS downsample_bypass_process;

  
  Out_tmp <= w_out WHEN enb_1_262144_1 = '1' ELSE
      downsample_bypass_reg;

  Out_rsvd <= std_logic_vector(Out_tmp);

END rtl;

