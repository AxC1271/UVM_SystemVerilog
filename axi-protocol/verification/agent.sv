/*================
File Name: agent.sv
Description: agent of env
Author: Andrew Chen
Date Created: Dec 16 2025
================*/

`timescale 1ns / 1ps

// here systemverilog's oop comes handy here, we want to 
// instantiate a child instance of uvm test class 
// uvm_agent is a base class that already exists in sv

class agent extends uvm_agent;

    `uvm_component_utils(agent);

    function new(string name = "agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        // referring to the architecture, you'll
        // need to build the monitor, sequencer,
        // and the driver

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