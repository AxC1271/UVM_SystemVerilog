/*================
File Name: sequence_item.sv
Description: sequence item in agent
Author: Andrew Chen
Date Created: Dec 16 2025
================*/

`timescale 1ns / 1ps

// this is the basic structure for the sequence item

class sequence_item extends uvm_sequence_item;

    `uvm_object_utils(sequence_item);

    // these inputs are also known as request items
    // which the dut requests, use rand keyword
    rand bit[7:0] input_1;
    rand bit[7:0] input_2;

    // the output is known as the response item
    bit[15:0] output_3;

    function new(string name = "sequence_item");
        super.new(name);
    endfunction
    

endclass