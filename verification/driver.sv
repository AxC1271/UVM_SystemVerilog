`timescale 1ns / 1ps

/*================================================
File Name: driver.sv
Description: driver of agent
Author: Andrew Chen
Date Created: Dec 16 2025
================================================*/

class driver extends uvm_driver;

    `uvm_component_utils(driver);
    // instantiate the interface
    axi_interface intf;

    function new(string name= "driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        // for the driver and monitor we'll need to 
        // instantiate our custom axi-interface
        uvm_config_db #(virtual axi_interface)::get(null, "*", "intf", intf);

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