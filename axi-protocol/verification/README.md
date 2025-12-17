# UVM Structure and Setup

Refer back to the original framework from the main `README.md` of this GitHub repository:

<p align="center">
    <img height=400px src="./UVM_Diagram.png" />
</p>

## Setting up the Top Module

Setting up the top module is pretty straightforward and does not require a lot of steps. Here we need to include two important lines:

```Verilog
`include "uvm_macros.svh" // .svh import here is needed for all top modules in uvm
import uvm_pkg::*; 
```

These are necessary and should be included in all top UVM modules for SystemVerilog.

Here's the general structure of the top module:

```Verilog
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
```