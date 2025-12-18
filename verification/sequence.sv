`timescale 1ns / 1ps

/*================================================
File Name: sequence.sv
Description: sequence class
Author: Andrew Chen
Date Created: Dec 17 2025
================================================*/

class sequence extends uvm_sequence;
    `uvm_object_utils(sequence);

    // constructor function
    function new(string name = "sequence");
        super.new(name);
    endfunction: new

    task body();

    endtask
    
endclass