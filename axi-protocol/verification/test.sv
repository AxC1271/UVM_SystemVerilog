/*================
File Name: test.sv
Description: test object of top model
Author: Andrew Chen
Date Created: Dec 16 2025
================*/

`timescale 1ns / 1ps

// here systemverilog's oop comes handy here, we want to 
// instantiate a child instance of uvm test class 
// uvm_test is a base class that already exists in sv

class test extends uvm_test;
    // now we have to register our class to make our code modular
    // and reusable using uvm_component_utils, passing in test name
    `uvm_component_utils(test);

    // instantiate classes here in test, you'll have to create env
    // look at the diagram, only env is directly inside test


    // now we need a constructor to instantiate our class and initialize properties
    // costructor is called new(), and it takes two parameters (a string name and uvm component)
    function new(string name= "test", uvm_component parent= null);
        // super calls the constructor of the systemverilog parent class
        super.new(name, parent);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        // build environment class here

    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary conncetions
        // we won't be using connect_phase in test.sv

    endfunction

    // run phase is the only phase that can consume time
    // hence making it a task, not a function
    task run_phase(uvm_phase phase);
    // main logic will remain here
    endtask

    // methods

    // properties

endclass