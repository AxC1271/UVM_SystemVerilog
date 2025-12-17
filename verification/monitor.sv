`timescale 1ns / 1ps

/*================================================
File Name: monitor.sv
Description: monitor of agent
Author: Andrew Chen
Date Created: Dec 16 2025
================================================*/

// here systemverilog's oop comes handy here, we want to 
// instantiate a child instance of uvm test class 
// uvm_monitor is a base class that already exists in sv

class monitor extends uvm_monitor;

    `uvm_component_utils(monitor);

    function new(string name = "agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

     // build phase
    function void build_phase(uvm_phase phase);
        // build other components

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

    // methods

    // properties

endclass