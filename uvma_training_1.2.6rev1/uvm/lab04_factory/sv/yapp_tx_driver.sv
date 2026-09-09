class yapp_tx_driver extends uvm_driver #(yapp_packet);

    `uvm_component_utils(yapp_tx_driver)
    
    virtual function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new
    
    task run_phase(uvm_phase phase);
        // Gets packets from the sequencer and passes them to the driver. 
        forever begin
        // Get new item from the sequencer
        seq_item_port.get_next_item(req);
        // Drive the item
        send_to_dut(req);
        // Communicate item done to the sequencer
        seq_item_port.item_done();
        end
    endtask : run_phase

    task send_to_dut(yapp_packet pkt);
        `uvm_info("PKT", $sformatf("Packet to send: \n%s", pkt.sprint()), UVM_LOW);
        #10ns;
    endtask

endclass