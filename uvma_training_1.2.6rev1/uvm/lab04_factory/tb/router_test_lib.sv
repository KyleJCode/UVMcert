import uvm_pkg::*;
`include "uvm_macros.svh"

class base_test extends uvm_test;

    `uvm_component_utils(base_test)

    router_tb tb;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        tb = router_tb::type_id::create("tb", this);
        uvm_config_int::set(this, "*", "recording_detail", 1);
        `uvm_info("BLD", "BASE_TEST EXECUTED BLD", UVM_HIGH)
    endfunction : build_phase

    function void check_phase(uvm_phase phase);
        check_config_usage();
    endfunction : check_phase

    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

endclass : base_test


class short_packet_test extends base_test;
    `uvm_component_utils(short_packet_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        yapp_packet::type_id::set_type_override(short_yapp_packet::get_type()); 
        super.build_phase(phase);
        uvm_config_wrapper::set(this, "tb.yapp.tx_agent.sequencer.run_phase", "default_sequence", yapp_5_packets::get_type());
    endfunction : build_phase
endclass : short_packet_test

class set_config_test extends base_test;
    `uvm_component_utils(set_config_test);

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function build_phase(uvm_phase phase);
        uvm_config_int::set(this, "tb.yapp.tx_agent", "is_active", UVM_PASSIVE);
        super.build_phase(phase);
    endfunction
endclass : set_config_test