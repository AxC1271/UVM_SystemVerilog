/*================
File Name: top.sv
Description: top model of uvm model
Author: Andrew Chen
Date Created: Dec 16 2025
================*/

`timescale 1ps / 1ns
`include "uvm_macros.svh" // .svh import here is needed for all top modules in uvm
import uvm_pkg::*; 

module top();

    // instantiate your design under test like normal testbenching
    our_design dut();

    // write your test object here, both in top.sv and as a separate systemverilog module (check test.sv)
    initial begin
        run_test("test");
    end
endmodule
