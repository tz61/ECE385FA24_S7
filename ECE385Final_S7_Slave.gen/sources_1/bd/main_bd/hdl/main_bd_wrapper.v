//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Thu Dec 12 15:30:14 2024
//Host        : ztn-Legion-Y9000P-IRX8 running 64-bit Ubuntu 24.04.1 LTS
//Command     : generate_target main_bd_wrapper.bd
//Design      : main_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module main_bd_wrapper
   (clk_100MHz,
    gpio_usb_keycode_0_tri_o,
    gpio_usb_keycode_1_tri_o,
    reset_rtl_0,
    touhou_control,
    uart_rxd,
    uart_txd,
    usb_spi_clk,
    usb_spi_cs,
    usb_spi_int,
    usb_spi_miso,
    usb_spi_mosi,
    usb_spi_rst);
  input clk_100MHz;
  output [31:0]gpio_usb_keycode_0_tri_o;
  output [31:0]gpio_usb_keycode_1_tri_o;
  input reset_rtl_0;
  output [5:0]touhou_control;
  input uart_rxd;
  output uart_txd;
  output usb_spi_clk;
  output [0:0]usb_spi_cs;
  input [0:0]usb_spi_int;
  input usb_spi_miso;
  output usb_spi_mosi;
  output [0:0]usb_spi_rst;

  wire clk_100MHz;
  wire [31:0]gpio_usb_keycode_0_tri_o;
  wire [31:0]gpio_usb_keycode_1_tri_o;
  wire reset_rtl_0;
  wire [5:0]touhou_control;
  wire uart_rxd;
  wire uart_txd;
  wire usb_spi_clk;
  wire [0:0]usb_spi_cs;
  wire [0:0]usb_spi_int;
  wire usb_spi_miso;
  wire usb_spi_mosi;
  wire [0:0]usb_spi_rst;

  main_bd main_bd_i
       (.clk_100MHz(clk_100MHz),
        .gpio_usb_keycode_0_tri_o(gpio_usb_keycode_0_tri_o),
        .gpio_usb_keycode_1_tri_o(gpio_usb_keycode_1_tri_o),
        .reset_rtl_0(reset_rtl_0),
        .touhou_control(touhou_control),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd),
        .usb_spi_clk(usb_spi_clk),
        .usb_spi_cs(usb_spi_cs),
        .usb_spi_int(usb_spi_int),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_rst(usb_spi_rst));
endmodule
