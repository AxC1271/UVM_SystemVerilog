`timescale 1ns / 1ps

/*================================================
File Name: axilite_master.sv
Description: axi master device
Author: Andrew Chen
Date Created: Dec 16 2025
================================================*/

module axilite_master # (
    parameter integer AXI_ADDR_WIDTH = 32,
    parameter integer AXI_DATA_WIDTH = 32
    ) (
    // global
    input wire ACLK,
    input wire ARESETn,

    // write address channel
    input wire AWVALID,
    input wire AWREADY,
    input[31:0] wire AWADDR,
    // input[2:0] wire AWPROT,

    // write data channel
    input wire WVALID,
    input wire WREADY,
    input[31:0] wire WDATA,
    
    // write response channel

    // read response channel

    // read data channel
);

endmodule