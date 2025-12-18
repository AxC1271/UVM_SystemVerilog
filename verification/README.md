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
---

## Setting up the Test Module

Let's first set up `test.sv` since that is the only child object of our testbench, `top.sv`:

```Verilog
`timescale 1ns / 1ps

/*
Every module starts with a class definition that extends a pre-existing SystemVerilog parent class, such as `uvm_test`, `uvm_env`, etc. 
*/
class test extends uvm_test;
    /*
    This line tells the UVM factory about your new component type and generates a bunch of boilerplate code that can be overriden at runtime. Don't worry too much about how it works under the hood.
    */
    `uvm_component_utils(test);

    /*
    Every component/object that extends a UVM object must have
    a constructor function which calls the parent constructor via super(). For components, it takes two parameters (a string for its name, and parent of type uvm_component)
    */
    function new(string name= "test", uvm_component parent= null);
        super.new(name, parent);
    endfunction
endclass
```

---

## Setting up the Env Module

Referring back to the UVM architecture, you can see that the only child object in the test module should be `env.sv`. All modules from now on will follow a very similar template:

```Verilog
`timescale 1ns / 1ps

class env extends uvm_env;
    `uvm_component_utils(env);

    function new(string name="env", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
```

---

## Setting up the Agent Module

Same procedure as how we set up `env.sv` in the previous step:

```Verilog
`timescale 1ns / 1ps

class agent extends uvm_agent;
    `uvm_component_utils(agent);

    function new(string name="agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
```
---

## Setting up the Driver/Monitor/Sequencer Module

The steps are virtually identical as all of these are also UVM components, so they follow a similar template to how we set up `agent.sv` and `env.sv`.

## Challenge Exercises

### Challenge 1

Assume you have a full adder module written in SystemVerilog (let's test for just UVM):

```Verilog
`timescale 1ns / 1ps

module full_adder (
    input logic a, b, cin,
    output logic sum, cout;
    );

assign {cout, sum} = a + b + cin;
endmodule
```



### Challenge 2

### Challenge 3

### Challenge 4

---

## Answers to Challenge Exercises

### Challenge 1

---

### Challenge 2

---

### Challenge 3

---

### Challenge 4

---
