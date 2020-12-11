-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\control_path_sim\outer_hair_cell\outer_hair_cell_outer_hair_cell.vhd
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: outer_hair_cell_outer_hair_cell
-- Source Path: outer_hair_cell
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY outer_hair_cell_outer_hair_cell IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_1024_0                      :   IN    std_logic;
        ohc_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- single
        ohc_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END outer_hair_cell_outer_hair_cell;


ARCHITECTURE rtl OF outer_hair_cell_outer_hair_cell IS

  -- Component Declarations
  COMPONENT ohc_nl_boltzman_function
    PORT( ohc_nl_boltzman_in              :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          ohc_nl_boltzman_out             :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT ohc_lowpass_filter
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_1024_0                    :   IN    std_logic;
          ohc_lpf_in                      :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          ohc_lpf_out                     :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT ohc_nonlinear_filter
    PORT( ohc_nl_fnc_in                   :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          ohc_nl_fnc_out                  :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ohc_nl_boltzman_function
    USE ENTITY work.ohc_nl_boltzman_function_ohc_nl_boltzman_function(rtl);

  FOR ALL : ohc_lowpass_filter
    USE ENTITY work.ohc_lowpass_filter_ohc_lowpass_filter(rtl);

  FOR ALL : ohc_nonlinear_filter
    USE ENTITY work.ohc_nonlinear_filter_ohc_nonlinear_filter(rtl);

  -- Signals
  SIGNAL out_rsvd                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL x                                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Model2_out1                      : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_Model : ohc_nl_boltzman_function
    PORT MAP( ohc_nl_boltzman_in => ohc_in,  -- single
              ohc_nl_boltzman_out => out_rsvd  -- single
              );

  u_Model1 : ohc_lowpass_filter
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_1024_0 => enb_1_1024_0,
              ohc_lpf_in => out_rsvd,  -- single
              ohc_lpf_out => x  -- single
              );

  u_Model2 : ohc_nonlinear_filter
    PORT MAP( ohc_nl_fnc_in => x,  -- single
              ohc_nl_fnc_out => Model2_out1  -- single
              );

  ohc_out <= Model2_out1;

END rtl;

