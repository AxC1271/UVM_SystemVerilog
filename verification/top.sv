`timescale 1ps / 1ns

/*================================================
File Name: top.sv
Description: top model of uvm model
Author: Andrew Chen
Date Created: Dec 16 2025
================================================*/

`include "uvm_macros.svh" // .svh import here is needed for all top modules in uvm
import uvm_pkg::*; 

module top();

    // instantiate our custom interface
    axi_interface intf(); 

    // instantiate your design under test like normal testbenching
    our_design dut();

    initial begin
        // this is the set method
        uvm_config_db #(virtual axi_interface)::set(null, "*", "intf", intf);
    end

    // write your test object here, both in top.sv and as a separate systemverilog module (check test.sv)
    initial begin
        run_test("test");
    end
endmodule
