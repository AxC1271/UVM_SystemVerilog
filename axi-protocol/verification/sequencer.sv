/*================
File Name: sequencer.sv
Description: sequencer of agent
Author: Andrew Chen
Date Created: Dec 16 2025
================*/

`timescale 1ns / 1ps

class sequencer extends uvm_sequencer;

    `uvm_component_utils(sequencer);

    function new(string name= "driver", uvm_component parent = null);
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