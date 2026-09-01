class base_test extends uvm_test

    `uvm_component_utils(base_test)

    // Constructor
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    // TB handle
    router_tb tb;

    // Build phase - tb instantiation and debug
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tb = new("tb", this);
        `uvm_info("BLD", "BASE_TEST EXECUTED BLD", UVM_HIGH);
    endfunction : build_phase

    // Debug print
    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase
    
endclass