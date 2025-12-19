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

---

## UVM Phase Cycle

---

## SystemVerilog Interfaces

---

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
Assume you're also given this interface:

```Verilog
interface adder_if;
  logic a, b, cin;
  logic sum, cout;
  logic clk;
endinterface
```

Complete the following transaction class. I suggest you paste this code on a separate SystemVerilog file and follow on:
```Verilog
class adder_transaction extends uvm_sequence_item;
  // TODO: Declare randomizable inputs (a, b, cin)
  // TODO: Declare observed outputs (sum, cout)
  
  `uvm_object_utils_begin(adder_transaction)
    // TODO: Register fields for printing/copying
  `uvm_object_utils_end
  
  function new(string name = "adder_transaction");
    super.new(name);
  endfunction
endclass
```

1. Should the logic signals a, b, and cin be rand? Why or why not?
2. Should the logic signals sum and cout be rand? Why or why not?
3. What does the uvm_field_int() function actually do?


### Challenge 2

Write a driver class for this specific full adder module. Here's the specific template:

```Verilog
class adder_driver extends uvm_driver #(adder_transaction);
  `uvm_component_utils(adder_driver)
  virtual adder_if vif;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // TODO: Get virtual interface from config_db
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      // TODO: Get next transaction from sequencer
      // TODO: Drive a, b, cin to DUT
      // TODO: Wait for clock edge
      // TODO: Tell sequencer item is done
    end
  endtask
endclass
```

1. What's ths difference between `get_next_item()` and `item_done()`?
2. Why do we wait for a clock edge?
3. What happens if you forget `item_done()`?

### Challenge 3
Complete the following boilerplate code for the sequencer:
```Verilog
class corner_case_seq extends uvm_sequence #(adder_transaction);
  `uvm_object_utils(corner_case_seq)
  
  task body();
    // TODO: Generate transactions that hit corner cases:
    // - All zeros (0+0+0)
    // - All ones (1+1+1)
    // - 10 random cases
  endtask
endclass
```

1. How would you force `a=1, b=1, cin=1` (not randomize)?
2. Why use `start_item()/finish_item()` instead of just `req.randomize()`?

### Challenge 4

Connect the following agent class:

```Verilog
class adder_agent extends uvm_agent;
  adder_driver driver;
  adder_monitor monitor;
  uvm_sequencer #(adder_transaction) sequencer;
  
  // ... (build_phase creates driver, monitor, sequencer)
  
  function void connect_phase(uvm_phase phase);
    // TODO: Connect driver to sequencer
    // TODO: Connect monitor to scoreboard (assume scoreboard is in env)
  endfunction
endclass
```

1. What's the port on the driver called?
2. What's the export on the sequencer called?
3. Do you connect monitor here or in the env?

---

## Answers to Challenge Exercises

### Challenge 1
Complete transaction class:

```Verilog
class adder_transaction extends uvm_sequence_item;
  // TODO: Declare randomizable inputs (a, b, cin)
  // TODO: Declare observed outputs (sum, cout)
  
  `uvm_object_utils_begin(adder_transaction)
    // TODO: Register fields for printing/copying
  `uvm_object_utils_end
  
  function new(string name = "adder_transaction");
    super.new(name);
  endfunction
endclass
```

1.
2.
3.

### Challenge 2
Complete driver class:

```Verilog
class adder_driver extends uvm_driver #(adder_transaction);
  `uvm_component_utils(adder_driver)
  virtual adder_if vif;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // TODO: Get virtual interface from config_db
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      // TODO: Get next transaction from sequencer
      // TODO: Drive a, b, cin to DUT
      // TODO: Wait for clock edge
      // TODO: Tell sequencer item is done
    end
  endtask
endclass
```

1.
2.
3.

### Challenge 3
Complete sequencer class:

```Verilog
class corner_case_seq extends uvm_sequence #(adder_transaction);
  `uvm_object_utils(corner_case_seq)
  
  task body();
    // TODO: Generate transactions that hit corner cases:
    // - All zeros (0+0+0)
    // - All ones (1+1+1)
    // - 10 random cases
  endtask
endclass
```

1. 
2.

### Challenge 4

---
