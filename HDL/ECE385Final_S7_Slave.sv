//-------------------------------------------------------------------------
//    mb_usb_hdmi_top.sv                                                 --
//    Zuofu Cheng                                                        --
//    2-29-24                                                            --
//                                                                       --
//                                                                       --
//    Spring 2024 Distribution                                           --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module ece385final_s7_slave(
    input logic sys_clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic usb_spi_int,
    output logic usb_spi_rst,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_clk,
    output logic usb_spi_cs,
    
    //UART
    input logic uart_rxd,
    output logic uart_txd,
        
    //HEX displays
    output logic [7:0] D0_SEG,
    output logic [3:0] D0_AN,
    output logic [7:0] D1_SEG,
    output logic [3:0] D1_AN,
    
    // Audio relay for Z7 part
    input logic Interconn0,
    input logic Interconn1,
    output logic left_out,
    output logic right_out,
    // Keys
    
    output logic Interconn2,//z
    output logic Interconn3,//shift
    output logic Interconn4,//up
    output logic Interconn5,//down
    output logic Interconn6,//left
    output logic Interconn7,//right
    // Die buzzer control
    input logic Interconn_clk, //die buzzer, not clk, used as single ended input
    output logic Buzzer
    
);
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic [5:0] touhou_control;
    logic locked;

    logic reset_ah;
    // Audio Relay
    assign left_out = Interconn0;
    assign right_out = Interconn1;
    assign reset_ah = reset_rtl_0;
    // Touhou control
    assign Interconn2 = touhou_control[0];
    assign Interconn3 = touhou_control[1];
    assign Interconn4 = touhou_control[2];
    assign Interconn5 = touhou_control[3];
    assign Interconn6 = touhou_control[4];
    assign Interconn7 = touhou_control[5];
    // Die buzzer control
    logic [14:0] buzzer_counter; // 2kHz square wave, 100e6clk/2e3/2=25000 flip, 2**15=32768
    logic Buzzer_internal;
    always_comb begin // mux
        if(Interconn_clk)begin
            Buzzer = Buzzer_internal;
        end else begin
            Buzzer = 0;
        end
    end
    always_ff @(posedge sys_clk)begin
        if(reset_ah)begin
            buzzer_counter <= 'b0;
            Buzzer_internal <= 0;
        end else begin
            if(buzzer_counter == 25000)begin
                buzzer_counter <= 'b0;
                Buzzer_internal <= ~Buzzer_internal;
            end else begin
                buzzer_counter <= buzzer_counter +1;
            end
        end
    end
    //Keycode HEX drivers
    hex_driver HexA (
        .clk(sys_clk),
        .reset(reset_ah),
        .in({keycode0_gpio[31:28], keycode0_gpio[27:24], keycode0_gpio[23:20], keycode0_gpio[19:16]}),
        .hex_seg(D0_SEG),
        .hex_grid(D0_AN)
    );
    
    hex_driver HexB (
        .clk(sys_clk),
        .reset(reset_ah),
        .in({keycode0_gpio[15:12], keycode0_gpio[11:8], keycode0_gpio[7:4], keycode0_gpio[3:0]}),
        .hex_seg(D1_SEG),
        .hex_grid(D1_AN)
    );
    
    main_bd bd_inst (
        .clk_100MHz(sys_clk),
        // Code from mb's spi device
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .touhou_control(touhou_control),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        // UART
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd),
        // SPI
        .usb_spi_int(usb_spi_int),
        .usb_spi_rst(usb_spi_rst),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_clk(usb_spi_clk),
        .usb_spi_cs(usb_spi_cs)
    );
        
    
endmodule
