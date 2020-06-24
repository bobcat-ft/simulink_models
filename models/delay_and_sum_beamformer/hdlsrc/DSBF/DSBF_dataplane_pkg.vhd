-- -------------------------------------------------------------
-- 
-- File Name: /mnt/data/NIH/simulink_models/models/delay_and_sum_beamformer/hdlsrc/DSBF/DSBF_dataplane_pkg.vhd
-- 
-- Generated by MATLAB 9.6 and HDL Coder 3.14
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE DSBF_dataplane_pkg IS
  TYPE vector_of_std_logic_vector32 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(31 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_std_logic_vector12 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(11 DOWNTO 0);
  TYPE vector_of_signed12 IS ARRAY (NATURAL RANGE <>) OF signed(11 DOWNTO 0);
  TYPE vector_of_std_logic_vector16 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(15 DOWNTO 0);
  TYPE vector_of_unsigned6 IS ARRAY (NATURAL RANGE <>) OF unsigned(5 DOWNTO 0);
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_signed6 IS ARRAY (NATURAL RANGE <>) OF signed(5 DOWNTO 0);
  TYPE vector_of_signed39 IS ARRAY (NATURAL RANGE <>) OF signed(38 DOWNTO 0);
  TYPE vector_of_signed55 IS ARRAY (NATURAL RANGE <>) OF signed(54 DOWNTO 0);
  TYPE vector_of_signed64 IS ARRAY (NATURAL RANGE <>) OF signed(63 DOWNTO 0);
  TYPE vector_of_signed62 IS ARRAY (NATURAL RANGE <>) OF signed(61 DOWNTO 0);
  TYPE vector_of_signed80 IS ARRAY (NATURAL RANGE <>) OF signed(79 DOWNTO 0);
  TYPE vector_of_signed5 IS ARRAY (NATURAL RANGE <>) OF signed(4 DOWNTO 0);
  TYPE vector_of_signed23 IS ARRAY (NATURAL RANGE <>) OF signed(22 DOWNTO 0);
  TYPE vector_of_signed46 IS ARRAY (NATURAL RANGE <>) OF signed(45 DOWNTO 0);
END DSBF_dataplane_pkg;
