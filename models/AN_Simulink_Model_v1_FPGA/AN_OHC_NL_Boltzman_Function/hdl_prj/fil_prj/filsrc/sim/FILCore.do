set SRCDIR C:/Users/t96f346/Documents/MATLAB/AN_OHC_NL_Boltzman_Function/hdl_prj/fil_prj/filsrc
set SIMDIR C:/Users/t96f346/Documents/MATLAB/AN_OHC_NL_Boltzman_Function/hdl_prj/fil_prj/filsrc/sim
set COMPILE vcom

set SIM vsim

vlib $SIMDIR/work
vmap work $SIMDIR/work

$COMPILE $SRCDIR/MWAJTAG.vhd
$COMPILE $SRCDIR/MWDPRAM.vhd
$COMPILE $SRCDIR/FILUDPCRC.vhd
$COMPILE $SRCDIR/FILPktMUX.vhd
$COMPILE $SRCDIR/FILCmdProc.vhd
$COMPILE $SRCDIR/MWAsyncFIFO.vhd
$COMPILE $SRCDIR/FILDataProc.vhd
$COMPILE $SRCDIR/MWPKTBuffer.vhd
$COMPILE $SRCDIR/MWUDPPKTBuilder.vhd
$COMPILE $SRCDIR/FILPktProc.vhd
$COMPILE $SRCDIR/FILCommLayer.vhd
$COMPILE $SRCDIR/mwfil_dpscram.vhd
$COMPILE $SRCDIR/mwfil_udfifo.vhd
$COMPILE $SRCDIR/mwfil_bus2dut.vhd
$COMPILE $SRCDIR/mwfil_chifcore.vhd
$COMPILE $SRCDIR/mwfil_controller.vhd
$COMPILE $SRCDIR/mwfil_dut2bus.vhd
$COMPILE $SRCDIR/OHC_NL_Boltzman_Function_wrapper.vhd
$COMPILE $SRCDIR/mwfil_chiftop.vhd
$COMPILE $SRCDIR/FILCore.vhd