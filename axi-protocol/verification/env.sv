/*================
File Name: env.sv
Description: environment of top model
Author: Andrew Chen
Date Created: Dec 16 2025
================*/

`timescale 1ns / 1ps

// here systemverilog's oop comes handy here, we want to 
// instantiate a child instance of uvm test class 
// uvm_env is a base class that already exists in sv

class env extends uvm_env;

    `uvm_component_utils(env);

    // instantiate classes used in env
    // for the build phases refer to the
    // block diagram and see if it's directly
    // in the model

    function new(string name="env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        // you need to build agent here, refer
        // to the general architecture to see why

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