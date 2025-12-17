`timescale 1ns / 1ps

/*================================================
File Name: agent.sv
Description: agent of env
Author: Andrew Chen
Date Created: Dec 16 2025
================================================*/

// here systemverilog's oop comes handy here, we want to 
// instantiate a child instance of uvm test class 
// uvm_agent is a base class that already exists in sv

class agent extends uvm_agent;

    `uvm_component_utils(agent);

    monitor monitor_0;
    sequencer sequencer_0;
    driver driver_0;

    function new(string name = "agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        // referring to the architecture, you'll
        // need to build the monitor, sequencer,
        // and the driver
        monitor_0 = monitor::type_id::create("monitor_0", this);
        sequencer_0 = sequencer::type_id::create("sequencer_0", this);
        driver_0 = driver::type_id::create("driver_0", this);

    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary conncetions

    endfunction

    // run phase is the only phase that can consume time
    // hence making it a task, not a function
    task run_phase(uvm_phase phase);
    // main logic 

    endtask
endclass