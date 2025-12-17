# Full Guide to SystemVerilog UVM (Universal Verification Methodology)

To properly view this README file on VSCode, open this folder in VSCode and `Ctrl + Shift + V` for Windows or `Cmd + Shift + V` 
for Mac devices for better visuals and cleaner markdown formatting. It'll look prettier, I promise 😀. 

---

## Overall Architecture

<p align="center">
    <img src="./axi-protocol/verification/UVM_Diagram.png" height=400px />
</p>

This diagram is a really good model for understanding how the UVM ecosystem works, especially once you get into the build phases of each module. It makes a lot of intuitive sense on what modules belong where in which module's build phase, and it makes visualizing it as a cohesive system a lot easier.

---

## Object-Oriented Programming

All of the modules, save for the top module, extend from an existing SystemVerilog class framework. This makes the code modular and reusable. When a module (or in this case, class) extends from a parent class, it inherits all the attributes and functions of that parent class.

For example, let's look at `agent.sv`:

```Verilog
class agent extends uvm_agent;

    `uvm_component_utils(agent);

    function new(string name = "agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

endclass
```

Notice two things: the `extends` keyword and the `super` function called in the new constructor of this class. This is highly reminiscent of languages that exhibit object-oriented programming like Java:

```Java
public class Vehicle {
    private int year;
    private double mileage;

    // parent constructor
    public Vehicle(int year, double mileage) {
        self.year = year;
        self.mileage = mileage;
    }

    // whatever functions you have defined here
}

// Java's OOP allows for inheritance through polymorphism
public class Toyota extends Vehicle {
    // these fields are inferred to exist because
    // the parent class

    // private int year;
    // private double mileage;

    // here we add an additional field
    private String model;

    // since we're calling the constructor of the child class,
    // we need to invoke the super function
    public Toyota(int year, double mileage, String model) {
        // explicitly invokes superclass constructor
        super(year, mileage);
        self.model = model;
    }
    // whatever functions from Vehicle superclass is assumed
    // to exist in the Toyota child class as well
}
```

I just wanted to draw a parallel here in what OOP and why polymorphism matters. The new function in SV acts very similarly
to constructors used in Java, and you're explicitly calling super() on both languages. I thought it was pretty cool. 😀

---

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

## Phase Flow

<p align="center">
    <img height=400px src="./axi-protocol/verification/UVMPhase.png" />
</p>

### Build Phases

During the build phases, the components are built, one by one, in a top-down manner, and the necessary connectinos are made between all of them. This happens at zero simulation time. We really only 
need to worry about the build and connect phase:

- Build

- Connect


### Run Phases

Run phases are where all your main logic goes. All the consuming statements fall into this category.

- Reset

- Configure

- Main

- Shutdown

### Cleanup Phases

After the simulation is done, we have the cleanup phases, which extract the expected data from the scoreboard and display the final results.

- Extract

- Check

- Report

- Final 

---

## AXI Protocol Specifications

<p align="center">
    <img height=400px src="./axi-protocol/rtl-design/Figure1-1.png" />
</p>

<p align="center">
    <img height=400px src="./axi-protocol/rtl-design/Figure1-2.png" />
</p>

---

## Note to Reader

See how I apply these UVM techniques to the AXI protocol that I designed and built using SystemVerilog as well. Look at the `rtl-design` folder to learn more in detail about how I designed the system and look at the `verification` folder for more detail on UVM and how it works at the low level. Thanks for stopping by!

---