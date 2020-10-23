-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\conno\Documents\NIH-GitHub\simulink_models\models\noise_suppression\hdlsrc\noise_suppression\noise_suppression_dataplane_pkg.vhd
-- 
-- Generated by MATLAB 9.9 and HDL Coder 3.17
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE noise_suppression_dataplane_pkg IS
  TYPE vector_of_std_logic_vector24 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(23 DOWNTO 0);
  TYPE vector_of_std_logic_vector50 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(49 DOWNTO 0);
  TYPE vector_of_signed24 IS ARRAY (NATURAL RANGE <>) OF signed(23 DOWNTO 0);
  TYPE vector_of_signed2 IS ARRAY (NATURAL RANGE <>) OF signed(1 DOWNTO 0);
  TYPE vector_of_unsigned32 IS ARRAY (NATURAL RANGE <>) OF unsigned(31 DOWNTO 0);
  TYPE vector_of_signed25 IS ARRAY (NATURAL RANGE <>) OF signed(24 DOWNTO 0);
  TYPE vector_of_unsigned24 IS ARRAY (NATURAL RANGE <>) OF unsigned(23 DOWNTO 0);
  TYPE vector_of_unsigned5 IS ARRAY (NATURAL RANGE <>) OF unsigned(4 DOWNTO 0);
  TYPE vector_of_unsigned29 IS ARRAY (NATURAL RANGE <>) OF unsigned(28 DOWNTO 0);
  TYPE vector_of_unsigned27 IS ARRAY (NATURAL RANGE <>) OF unsigned(26 DOWNTO 0);
  TYPE vector_of_unsigned51 IS ARRAY (NATURAL RANGE <>) OF unsigned(50 DOWNTO 0);
  TYPE vector_of_unsigned56 IS ARRAY (NATURAL RANGE <>) OF unsigned(55 DOWNTO 0);
  TYPE vector_of_unsigned57 IS ARRAY (NATURAL RANGE <>) OF unsigned(56 DOWNTO 0);
  TYPE vector_of_signed57 IS ARRAY (NATURAL RANGE <>) OF signed(56 DOWNTO 0);
  TYPE vector_of_signed56 IS ARRAY (NATURAL RANGE <>) OF signed(55 DOWNTO 0);
  TYPE vector_of_signed26 IS ARRAY (NATURAL RANGE <>) OF signed(25 DOWNTO 0);
  TYPE vector_of_signed48 IS ARRAY (NATURAL RANGE <>) OF signed(47 DOWNTO 0);
  TYPE vector_of_signed50 IS ARRAY (NATURAL RANGE <>) OF signed(49 DOWNTO 0);
  TYPE vector_of_std_logic_vector25 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(24 DOWNTO 0);
  TYPE vector_of_std_logic_vector27 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(26 DOWNTO 0);
  TYPE vector_of_signed27 IS ARRAY (NATURAL RANGE <>) OF signed(26 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
  TYPE vector_of_std_logic_vector32 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(31 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
END noise_suppression_dataplane_pkg;
