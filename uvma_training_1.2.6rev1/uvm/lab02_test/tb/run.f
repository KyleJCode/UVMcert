/*-----------------------------------------------------------------
File name     : run.f
Description   : lab02_test simulator run file
Notes         : Set $UVMHOME to install directory of UVM library
-----------------------------------------------------------------*/

-64

-uvmhome $UVMHOME

+UVM_TESTNAME=base_test
+UVM_VERBOSITY=UVM_HIGH

// Include directories
-incdir ../sv

// Compile files
../sv/yapp_pkg.sv
router_tb.sv
router_test_lib.sv
top.sv