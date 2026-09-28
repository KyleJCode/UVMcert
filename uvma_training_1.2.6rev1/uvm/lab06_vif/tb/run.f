// Run file for UVM setup
-64
-uvmhome $UVMHOME
-incdir ../sv
-uvmnocdnsextra
-timescale 1ns/1ns

+UVM_VERBOSITY=UVM_LOW

//+UVM_TESTNAME=base_test
//+UVM_TESTNAME=short_packet_test
//+UVM_TESTNAME=set_config_test
+UVM_TESTNAME=short_yapp_012

//+SVSEED=random

../sv/yapp_pkg.sv
../sv/yapp_if.sv

../../router_rtl/yapp_router.sv

clkgen.sv
hw_top.sv
tb_top.sv