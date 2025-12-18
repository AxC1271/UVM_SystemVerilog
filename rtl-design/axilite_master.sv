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

    // write data channel

    // write response channel

    // read response channel

    // read data channel
);

endmodule