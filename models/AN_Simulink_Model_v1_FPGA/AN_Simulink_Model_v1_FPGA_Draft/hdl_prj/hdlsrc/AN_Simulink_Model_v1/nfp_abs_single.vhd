-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\AN_Simulink_Model_v1\nfp_abs_single.vhd
-- Created: 2020-04-16 11:39:35
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: nfp_abs_single
-- Source Path: AN_Simulink_Model_v1/Auditory Nerve Model/C2 Wideband Filter/Calculate C2filterout/nfp_abs_single
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nfp_abs_single IS
  PORT( nfp_in                            :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END nfp_abs_single;


ARCHITECTURE rtl OF nfp_abs_single IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL Constant_out1                    : std_logic;  -- ufix1
  SIGNAL nfp_in_unsigned                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL XS                               : std_logic;  -- ufix1
  SIGNAL XE                               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL XM                               : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL nfp_out_pack                     : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  Constant_out1 <= '0';

  nfp_in_unsigned <= unsigned(nfp_in);

  -- Split 32 bit word into FP sign, exponent, mantissa
  XS <= nfp_in_unsigned(31);
  XE <= nfp_in_unsigned(30 DOWNTO 23);
  XM <= nfp_in_unsigned(22 DOWNTO 0);

  -- Combine FP sign, exponent, mantissa into 32 bit word
  nfp_out_pack <= Constant_out1 & XE & XM;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

