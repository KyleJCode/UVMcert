/*-----------------------------------------------------------------
File name     : top.sv
Description   : lab01_data top module template file
Notes         : From the Cadence "SystemVerilog Advanced Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

module top;
// import the UVM library
import uvm_pkg::*;

// include the UVM macros
`include "uvm_macros.svh"

// import the YAPP package
import yapp_pkg::*;

// include router_tb and router_test_lib
`include "router_tb.sv"
`include "router_test_lib.sv"

  initial begin
  run_test();
  
end
endmodule : top
