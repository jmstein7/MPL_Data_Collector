//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2022
//#
//#
//# File Name:  EPT_5M57_AP_M4_Top.v
//# Author:     R. Jolly
//# Date:       January 15, 2022
//# Revision:   A
//#
//# Development: USB Test Tool Interface board 
//# Application: Altera MAX V CPLD
//# Description: This file contains verilog code which will allow access
//#              to Active Transfer Library. The MAX V receives its commands via
//#				 USB.
//#               
//#              
//#
//#************************************************************************
//#
//# Revision History:	
//#			DATE		VERSION		DETAILS		
//#			1/15/22 	A			Created			RJJ
//#                     			RJJ
//#
//#									
//#
//#######################################################################

`timescale 1ns/1ps



//************************************************************************
//* Module Declaration
//************************************************************************

module EPT_5M57_AP_M4_Top (

	
	input  wire                CLK_66MHZ,
	input  wire                RST,
	//input  wire [1:0]          aa,
	//input  wire [1:0]          bc_in,
	//output wire [2:0]          bc_out,
	//inout  wire [7:0]		   bd_inout,

	//UART COMMAND BUS
	output wire                UART_OUT, //To external 
    input wire                 UART_IN, //From external
  
	input wire   [7:0]         LB_IOHA,       //XIOH -- J16
	input wire   [2:0]         LB_IOHB,       //XIOH -- J16
	input wire   [7:0]         LB_IOL,        //XIOL -- J16
	output wire  [7:0]         LB_COMM,       //COMM -- J10
	input wire   [7:0]         LB_IO8,        //XIOH -- J8
	input wire   [7:0]         LB_IO9,        //XIOH -- J9
	
	
	//Transceiver Control Signals
	output wire                TR_DIR_1,
	output wire                TR_OE_1,
	
	output wire                TR_DIR_2,
	output wire                TR_OE_2,

	output wire                TR_DIR_3,
	output wire                TR_OE_3,

	output wire                TR_DIR_4,
	output wire                TR_OE_4,

	output wire                TR_DIR_5,
	output wire                TR_OE_5,

	input wire                SW_USER_1,
	input wire                SW_USER_2,

	output wire [3:0]         LED
	
	);

   //-----------------------------------------------
   // Parameters
   //-----------------------------------------------

   parameter                   GLOBAL_RESET_COUNT = 4'hf;
   

							   
//***************************************************************************
//* Internal Signals and Registers Declarations
//***************************************************************************
    wire                       CLK_66;
	wire                       RST_N;
	wire [1:0]                 aa;

	wire [23:0]                UC_IN;
	wire [21:0]                UC_OUT;
	
    //UART_IN meta registers
	reg                        uart_meta;
	reg                        uart_mid;
	reg                        uart_txd;

	//Reset signals
	wire                       reset;
	reg [11:0]                 reset_counter;
	reg                        reset_signal_reg;
	
	//Trigger Signals
	reg  [7:0]                 trigger_out;
	wire [7:0]                 trigger_in_byte;	
	
	//Control registers
	wire                       led_reset;
	wire                       switch_reset;
	wire                       start_stop_cntrl;
	
    //Transfer Control registers
	wire   [7:0]               control_register;

	//Transfer registers
	reg                        transfer_out_reg;
	wire                       transfer_in_received;
	wire  [7:0]                transfer_byte;
	wire  [7:0]                arduino_data_byte;
	reg   [3:0]                transfer_to_host_counter;
	reg   [1:0]                transfer_to_host_state;
	reg                        transfer_write_reg;
	reg                        transfer_write;
	reg   [7:0]                transfer_write_byte;
	wire                       transfer_out;
	wire  [7:0]                transfer_in_byte;
	wire  [7:0]                transfer_out_byte;

	

//***************************************************************************
//* 	Signal Assignments	
//***************************************************************************
   
   //Clock and Reset
   assign            aa[1] = CLK_66MHZ;
   assign            aa[0] = RST_N;
   assign            RST_N = reset_signal_reg;
    
   assign            TR_DIR_1  = 1'b0; //1 = A to B; 0 = B to A
   assign            TR_OE_1  = 1'b0;
   assign            TR_DIR_2  = 1'b0; //1 = A to B; 0 = B to A
   assign            TR_OE_2  = 1'b1;
   assign            TR_DIR_3  = 1'b0; //1 = A to B; 0 = B to A
   assign            TR_OE_3  = 1'b1;  
   assign            TR_DIR_4  = 1'b1; //1 = A to B; 0 = B to A
   assign            TR_OE_4  = 1'b0;  
   assign            TR_DIR_5  = 1'b1; //1 = A to B; 0 = B to A
   assign            TR_OE_5  = 1'b0;  

   //Transfer registers
   assign            transfer_out = transfer_out_reg | transfer_write;
   assign            transfer_out_byte = transfer_write_byte;
   
    //Control Register Map
   assign            start_stop_cntrl = control_register[0];

   //Remap the arduino data byte to the correct pins
   assign            arduino_data_byte[0] = LB_IOL[6];
   assign            arduino_data_byte[1] = LB_IOL[7];
   assign            arduino_data_byte[2] = LB_IOL[4];
   assign            arduino_data_byte[3] = LB_IOL[5];
   assign            arduino_data_byte[4] = LB_IOL[2];
   assign            arduino_data_byte[5] = LB_IOL[3];
   assign            arduino_data_byte[6] = LB_IOL[0];
   assign            arduino_data_byte[7] = LB_IOL[1];
   
   //Send start_stop_cntrl to J9
   assign            LB_COMM[0] = 1'b0;
   assign            LB_COMM[1] = start_stop_cntrl;
   assign            LB_COMM[2] = 1'b0;
   assign            LB_COMM[3] = 1'b0;
   assign            LB_COMM[4] = 1'b0;
   assign            LB_COMM[5] = 1'b0;
   assign            LB_COMM[6] = 1'b0;
   assign            LB_COMM[7] = 1'b0;
    
   //LED[3] is used to signify to the  user that the Start 
   //switch is enabled
   assign             LED[3] =  (start_stop_cntrl) ? 1'b0 : 1'bz;  
   assign             LED[2] =  (LB_IOHA[0]) ? 1'b0 : 1'bz;  
   assign             LED[1] =  (transfer_write_reg) ? 1'b0 : 1'bz;  
   assign             LED[0] =  (transfer_write_reg) ? 1'b0 : 1'bz;  
     
     
   //**************************************************
   //* 	Reset Signal	
   //**************************************************
	always @(posedge CLK_66MHZ or negedge RST)
	begin
	  if(!RST)
	  begin
			reset_signal_reg <= 1'b0;
			reset_counter <= 0;
	  end
	  else
	  begin
		if( reset_counter < GLOBAL_RESET_COUNT )
		begin
			reset_signal_reg <= 1'b0;
			reset_counter <= reset_counter + 1'b1;
		end
		else
		begin
			reset_signal_reg <= 1'b1;
		end
	  end
	end
	
   //-----------------------------------------------
   // Register the incoming UART signal
   // 
   //-----------------------------------------------

  always @(posedge CLK_66MHZ or negedge RST_N)
  begin
     if(!RST_N)
	 begin
	     uart_meta <= 1'b0;
		 uart_mid <= 1'b0;
		 uart_txd <= 1'b0;
	end
	else
	 begin
	     uart_meta <= UART_IN;
		 uart_mid <= uart_meta;
		 uart_txd <= uart_mid;
	 end
  
  end


   //-----------------------------------------------
   // Detect Transfer From Arduino
   //-----------------------------------------------
  always @(posedge CLK_66MHZ or negedge RST_N)
  begin
     if(!RST_N)
       begin
			transfer_write_reg <= 1'b0;
			transfer_write <= 1'b0;
			transfer_write_byte <= 0;
       end 
       else 
       begin 
	        if(LB_IOHA[0] & !transfer_write_reg)
			begin
			    transfer_write_reg <= 1'b1;
				transfer_write <= 1'b1;
				transfer_write_byte <= arduino_data_byte;
			end
	        else if(LB_IOHA[0] & transfer_write_reg)
			begin
			    transfer_write_reg <= 1'b1;
				transfer_write <= 1'b0;
			end
	        else if(!LB_IOHA[0] & transfer_write_reg)
			begin
			    transfer_write_reg <= 1'b0;
				transfer_write <= 1'b0;
			    transfer_write_byte <= 0;
			end
	   end
    end
   //-----------------------------------------------
   // State Machine: Control Register from Transfer In 
   //-----------------------------------------------
  active_control_register      ACTIVE_CONTROL_REG_INST
  (
   .CLK                        (CLK_66),
   .RST                        (RST_N),
   .TRANSFER_IN_RECEIVED       (transfer_in_received),
   .TRANSFER_IN_BYTE           (transfer_in_byte),

   .CONTROL_REGISTER           (control_register)
   );
  

   //-----------------------------------------------
   // Instantiate the EPT Library
   //-----------------------------------------------

	active_serial_library	   ACTIVE_SERIAL_LIBRARY_INST
	(	
	.aa                        (aa),
	.UART_OUT                  (UART_OUT),
	.UART_IN                   (uart_txd),

	.UC_IN                     (UC_IN),
	.UC_OUT                    (UC_OUT)//,
	
	//.STATE_OUT                 (active_serial_state_out),
	//.TEST_OUT                  (active_transfer_test_out) 
	
	);
   //-----------------------------------------------
   // Instantiate the EPT Library
   //-----------------------------------------------
wire [22*2-1:0]  uc_out_m;
eptWireOR # (.N(2)) wireOR (UC_OUT, uc_out_m);
	active_trigger             ACTIVE_TRIGGER_INST
	(
	 .uc_clk                   (CLK_66MHZ),
	 .uc_reset                 (RST_N),
	 .uc_in                    (UC_IN),
	 .uc_out                   (uc_out_m[ 0*22 +: 22 ]),

	 .trigger_to_host          (trigger_out),
	 .trigger_to_device        (trigger_in_byte)
	
	);

	active_transfer            ACTIVE_TRANSFER_INST
	(
	 .uc_clk                   (CLK_66MHZ),
	 .uc_reset                 (RST_N),
	 .uc_in                    (UC_IN),
	 .uc_out                   (uc_out_m[ 1*22 +: 22 ]),
	
	 .start_transfer           (transfer_out),
	 .transfer_received        (transfer_in_received),
	
	 .uc_addr                  (3'h2),

	 .transfer_to_host         (transfer_out_byte),
	 .transfer_to_device       (transfer_in_byte)	
	);
	
	
endmodule
