//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2017
//#
//#
//# File Name:  active_transfer_uart.v
//# Author:     R. Jolly
//# Date:       February 22, 2017
//# Revision:   A
//#
//# Development: USB to UART interface 
//# Application: Altera Cyclone IV FPGA
//# Description: This file contains verilog code which will allow access
//#              to an eight bit bus in the FPGA. The FPGA receives its commands via
//#				 USB.
//#               
//#              
//#
//#************************************************************************
//#
//# Revision History:	
//#			DATE		VERSION		DETAILS		
//#			02/22/17 	A			Created			RJJ
//#
//#									
//#
//#######################################################################

`include "../src/define.v"

`timescale 1 ns / 10 ps

module active_transfer_uart
  (
	input wire                 CLK,
	input wire                 RST_N,

  
	output wire                UART_OUT, //To external 
    input wire                 UART_IN, //From external
  
	output reg                 USB_RXF_N,
	output reg                 USB_TXE_N,
    inout wire  [7:0]          USB_DATA,

	input  wire                USB_RD_N,
	input  wire                USB_WR,
	input  wire                USB_SI//,
	
	//output reg [3:0]           STATE_OUT,
	//output wire [7:0]          TEST_OUT


	);



   //----------------------------------------------
   // Parameter Declarations                        
   //----------------------------------------------
   parameter IDLE                   = 0,
	     RECEIVE_DATA				= 1,
		 STORE_BYTE		    	    = 2,
		 SEND_TO_HOST			    = 3,
		 RECEIVE_COMPLETE			= 4;
		 
   parameter  IDLE_TR               = 0,		 
		 WRITE_REGISTER 		    = 1,
		 LOAD_SHIFT_REG				= 2,
		 DELAY_WRITE_DATA_BYTE      = 3,
	     WRITE_DATA_BYTE			= 4,
	     WRITE_DATA_COMPLETE		= 5;
		 
`ifdef FAST_UART
		//parameter COUNT_TO_DECIMAL       = 4;
		//parameter COUNT_TO_DECIMAL_3     = 8'h36;
		parameter COUNT_TO_DECIMAL_2     = 8'h23; // 66 MHz Main Clock; 115200 UART Baud Rate
		//parameter COUNT_TO_DECIMAL_1     = 8'h19; // 50 MHz Main Clock; 115200 UART Baud Rate  
`else
//		parameter COUNT_TO_DECIMAL       = 54;
		//parameter COUNT_TO_DECIMAL_4     = 8'h6d;
		//parameter COUNT_TO_DECIMAL_3     = 8'h36;
		parameter COUNT_TO_DECIMAL_2     = 8'h23; // 66 MHz Main Clock; 115200 UART Baud Rate
		//parameter COUNT_TO_DECIMAL_1     = 8'h1b; // 50 MHz Main Clock; 115200 UART Baud Rate
		//parameter COUNT_TO_DECIMAL       = 4;
`endif

   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
   	reg [4:0]                 state_receive, next_receive;
   	reg [5:0]                 state_transmit, next_transmit;

	// Storage Registers
	reg [7:0]                  rcv_storage_reg;
	reg [2:0]                  store_reg_state; 
	
	
	//Metastable Registers
	reg                        uart_in_reg;
	reg                        usb_rxf_reg;
	reg                        usb_wr_reg;
	
	//write_tx_byte_reg for signalling the UART transmitter
	//to start transmitting
	reg                        write_tx_byte_reg;

	//STATE_OUT Regisetrs
    //reg [3:0]                  STATE_OUT;

	//UART Interface signals
	wire [7:0]                  rx_data;
    wire                        rx_byte_present;
    wire                        UART_SERIAL_RX;
    wire                        en_16_x_baud;
    reg                         rx_byte_read;
	reg  [7:0]                  tx_data_reg;
    wire                        tx_empty;
    reg                         write_tx_byte;
	
	//Clock Registers
    wire                        clk16x;
	
   	
`ifdef SIM
   reg [8*26:1] state_name_receive;
   reg [8*26:1] state_name_transmit;
`endif

   //------------------------------------------------
   // Signal Assignments  
   //------------------------------------------------
   assign USB_DATA = state_receive[RECEIVE_COMPLETE] ? rcv_storage_reg : 8'hz;
   //assign USB_RD_N = state[WRITE_REGISTER] ? 1'b0 : 1'b1;
   //assign tx_data_reg = state[SEND_TO_HOST] ? 8'hz : (automated_write ? automated_write_byte : USB_DATA);
   //assign write_tx_byte = state[WRITE_DATA_BYTE] ? 1'b0: 1'b1;

`ifdef FAST_UART
	reg	[7:0]			counter_reg;
//	assign 	 clk16x = (counter_reg == (COUNT_TO_DECIMAL_3 - 1) );
	assign 	 clk16x = (counter_reg == (COUNT_TO_DECIMAL_2 - 1) );
//	assign 	 clk16x = (counter_reg == (COUNT_TO_DECIMAL_1 - 1) );
`else
	reg	[7:0]			counter_reg;
//	assign 	 clk16x = (counter_reg == (COUNT_TO_DECIMAL_3 - 1) );
	assign 	 clk16x = (counter_reg == (COUNT_TO_DECIMAL_2 - 1) );
//	assign 	 clk16x = (counter_reg == (COUNT_TO_DECIMAL_1 - 1) );
`endif
	
   //TEST Only
/*   assign TEST_OUT[0] = rx_byte_present;
   assign TEST_OUT[1] = 0;
   assign TEST_OUT[2] = 1'b0;
   assign TEST_OUT[3] = 1'b0;
   assign TEST_OUT[4] = 1'b0;
   assign TEST_OUT[5] = 1'b0;
   assign TEST_OUT[6] = 1'b0;
   assign TEST_OUT[7] = 1'b0;   
*/	
   //-----------------------------------------------
   // Create a State Test Output Signal
   //-----------------------------------------------
/*   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  STATE_OUT <= 0;
	else
	  begin
	     if (state_receive[IDLE])
           STATE_OUT <= 4'h0;
	     if (state_receive[RECEIVE_DATA])
	       STATE_OUT <= 4'h1;
	     if (state_receive[STORE_BYTE])
	       STATE_OUT <= 4'h2;
	     if (state_receive[SEND_TO_HOST])
	       STATE_OUT <= 4'h3;
	     if (state_receive[RECEIVE_COMPLETE])
	       STATE_OUT <= 4'h4;
	     if (state_transmit[WRITE_REGISTER])
	       STATE_OUT <= 4'h5;
	     if (state_transmit[LOAD_SHIFT_REG])
	       STATE_OUT <= 4'h6;
	     if (state_transmit[DELAY_WRITE_DATA_BYTE])
	       STATE_OUT <= 4'h7;
	     if (state_transmit[WRITE_DATA_BYTE])
	       STATE_OUT <= 4'h8;
	     if (state_transmit[WRITE_DATA_COMPLETE])
	       STATE_OUT <= 4'h9;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)

*/
   //-----------------------------------------------
   //Transmit: Register the USB_W input signal. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	     usb_wr_reg <= 1;
	else
	  begin
	     if (!USB_WR)
	         usb_wr_reg <= 0;
		 else
	         usb_wr_reg <= 1;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   //Transmit: Store the USB_Data byte into the UART
   // transmist register. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if(!RST_N)
	begin
	     //usb_wr_reg <= 1;
		 tx_data_reg <= 0;
	end
	else
	  begin
	     if(state_transmit[LOAD_SHIFT_REG])
		 begin
	         //usb_wr_reg <= 0;
			 tx_data_reg <= USB_DATA;
	     end
	  end
     end // always @ (posedge CLK or negedge RST_N)


   //-----------------------------------------------
   // Transmit: write_tx_byte Signal 
   //-----------------------------------------------
	always @(posedge CLK or negedge RST_N)
	begin
		if (!RST_N)
		begin
			write_tx_byte <= 1'b1;
			write_tx_byte_reg <= 1'b0;
		end
		else 
		begin
			if(state_transmit[WRITE_DATA_BYTE] & !write_tx_byte_reg)
			begin
				write_tx_byte <= 1'b0;
				write_tx_byte_reg <= 1'b1;
			end
			else if(state_transmit[WRITE_DATA_BYTE] & write_tx_byte_reg)
			begin
				write_tx_byte <= 1'b1;
				write_tx_byte_reg <= 1'b1;
			end
			else if(state_transmit[WRITE_DATA_COMPLETE])
			begin
				write_tx_byte <= 1'b1;
				write_tx_byte_reg <= 1'b0;
		    end
		end	
	end // always @ (posedge CLK or negedge RESET)   
 

   //-----------------------------------------------
   //Transmit: Assert the USB_TXE_N signal. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	     USB_TXE_N <= 1'b1;
	else
	  begin
	     if(state_transmit[WRITE_REGISTER])
	         USB_TXE_N <= 1'b0;
		 else if(state_transmit[WRITE_DATA_COMPLETE])
	         USB_TXE_N <= 1'b1;
	  end
     end // always @ (posedge CLK or negedge RST_N)


   //-----------------------------------------------
   // Receive: rx_byte_read register reads the available byte
   // in the UART receive module. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	     rx_byte_read <= 1'b1;
		 rcv_storage_reg <= 0;
	end
	else
	  begin
	     if (state_receive[STORE_BYTE])
		 begin
	         rx_byte_read <= 1'b0;
			 rcv_storage_reg <= rx_data;
		 end
		 else
		 begin
	         rx_byte_read <= 1'b1;
			 rcv_storage_reg <= rcv_storage_reg;
		 end
	  end
     end // always @ (posedge CLK or negedge RST_N)


   //-----------------------------------------------
   // Receive: USB_RXF_N output register based on  
   // state[RECEIVE_COMPLETE]. Indicates to User Code
   // that a byte is ready to be read from the Receive
   // Unit.
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	     USB_RXF_N <= 1'b1;
	else
	  begin
	     if(state_receive[SEND_TO_HOST] & USB_RD_N)
	         USB_RXF_N <= 1'b0;
		 else if(state_receive[SEND_TO_HOST] & !USB_RD_N)
	         USB_RXF_N <= 1'b1;
		 else if(state_receive[IDLE])
	         USB_RXF_N <= 1'b1;
	  end
     end // always @ (posedge CLK or negedge RST_N)


   //--------------------------------------------------
   // UART State Machine Receive
   //--------------------------------------------------  
   // Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state_receive <= 5'h00;
	     state_receive[IDLE] <= 1'b1;
	  end
	else
	  state_receive <= next_receive;
     end

   always @ ( /*AUTOSENSE*/state_receive or usb_rxf_reg 
		 or store_reg_state or rx_byte_present
		 or USB_DATA or USB_RD_N or USB_RXF_N or USB_TXE_N
		 or UART_OUT or clk16x or rx_byte_read)
     begin
	next_receive = 5'h00;

	if (state_receive[IDLE])
	begin
        if (rx_byte_present)
			next_receive[RECEIVE_DATA] = 1'b1;
		else
			next_receive[IDLE] = 1'b1;
	end

	if (state_receive[RECEIVE_DATA])
	       next_receive[STORE_BYTE] = 1'b1;

	  if(state_receive[STORE_BYTE]) 
	  begin
	     if (!rx_byte_present)
		 //if (!rx_byte_read)
	       next_receive[SEND_TO_HOST] = 1'b1;
	     else
	         next_receive[STORE_BYTE] = 1'b1;
	  end 	     

	if (state_receive[SEND_TO_HOST]) 
	  begin
	     if (!USB_RXF_N)
			  next_receive[RECEIVE_COMPLETE] = 1'b1;
	     else
	         next_receive[SEND_TO_HOST] = 1'b1;
	  end 	     

	  if (state_receive[RECEIVE_COMPLETE]) 
	  begin
	     if (!USB_RD_N)
			  next_receive[IDLE] = 1'b1;
	     else
	         next_receive[RECEIVE_COMPLETE] = 1'b1;
	  end 	     


	
`ifdef SIM
	if (state_receive == (1 << IDLE))
	  state_name_receive = "IDLE";
	else if (state_receive == (1 << RECEIVE_DATA))
	  state_name_receive = "RECEIVE_DATA";
	else if (state_receive == (1 << SEND_TO_HOST))
	  state_name_receive = "SEND_TO_HOST";
	else if (state_receive == (1 << RECEIVE_COMPLETE))
	  state_name_receive = "RECEIVE_COMPLETE";
	else if (state_receive == (1 << STORE_BYTE))
	  state_name_receive = "STORE_BYTE";
`endif
     end // always @ (...


   //--------------------------------------------------
   // UART State Machine Transmit
   //--------------------------------------------------  
   // Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state_transmit <= 6'h00;
	     state_transmit[IDLE] <= 1'b1;
	  end
	else
	  state_transmit <= next_transmit;
     end

   always @ ( /*AUTOSENSE*/state_transmit or usb_wr_reg or tx_empty
		 or USB_DATA or USB_RD_N or USB_RXF_N or USB_TXE_N
		 or UART_OUT or clk16x or rx_byte_read)
     begin
	next_transmit = 6'h00;

	if (state_transmit[IDLE])
	begin
        if(!usb_wr_reg)
			next_transmit[WRITE_REGISTER] = 1'b1;
		else
			next_transmit[IDLE] = 1'b1;
	end

	  if (state_transmit[WRITE_REGISTER])
	  begin
	     if (!USB_TXE_N)
	       next_transmit[LOAD_SHIFT_REG] = 1'b1;
	     else 
	       next_transmit[WRITE_REGISTER] = 1'b1;
	  end

	if (state_transmit[LOAD_SHIFT_REG])
	       next_transmit[DELAY_WRITE_DATA_BYTE] = 1'b1;

	if (state_transmit[DELAY_WRITE_DATA_BYTE])
	  begin
	       next_transmit[WRITE_DATA_BYTE] = 1'b1;
	  end

	if (state_transmit[WRITE_DATA_BYTE])
	  begin
	     if (!tx_empty)
	       next_transmit[WRITE_DATA_COMPLETE] = 1'b1;
	     else
	       next_transmit[WRITE_DATA_BYTE] = 1'b1;
	  end

	if (state_transmit[WRITE_DATA_COMPLETE])
	  begin
	     if (tx_empty)
	       next_transmit[IDLE] = 1'b1;
	     else
	       next_transmit[WRITE_DATA_COMPLETE] = 1'b1;
	  end

	
`ifdef SIM
	if (state_transmit == (1 << IDLE))
	  state_name_transmit = "IDLE";
	else if (state_transmit == (1 << WRITE_REGISTER))
	  state_name_transmit = "WRITE_REGISTER";
	else if (state_transmit == (1 << LOAD_SHIFT_REG))
	  state_name_transmit = "LOAD_SHIFT_REG";
	else if (state_transmit == (1 << DELAY_WRITE_DATA_BYTE))
	  state_name_transmit = "DELAY_WRITE_DATA_BYTE";
	else if (state_transmit == (1 << WRITE_DATA_BYTE))
	  state_name_transmit = "WRITE_DATA_BYTE";
	else if (state_transmit == (1 << WRITE_DATA_COMPLETE))
	  state_name_transmit = "WRITE_DATA_COMPLETE";
`endif
     end // always @ (...
	 
//==============================================================================
//	Instantiate the 16x Clock Counter
//==============================================================================
`ifdef FAST_UART
   // For Simulation use a much faster clock to speed up test
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
 	  counter_reg <= 0;
 	else
 	  begin
 	     //if ( counter_reg == COUNT_TO_DECIMAL_1 )
 	     if ( counter_reg == COUNT_TO_DECIMAL_2 )
 	       counter_reg <= 0;
 	     else
 	       counter_reg <= counter_reg + 1;
 	  end
     end // always @ (posedge CLK or negedge RST_N)
`else
   // For Simulation use a much faster clock to speed up test
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
 	  counter_reg <= 0;
 	else
 	  begin
 	     //if ( counter_reg == COUNT_TO_DECIMAL_1 )
 	     if ( counter_reg == COUNT_TO_DECIMAL_2 )
 	       counter_reg <= 0;
 	     else
 	       counter_reg <= counter_reg + 1;
 	  end
     end // always @ (posedge CLK or negedge RST_N)
`endif

   //----------------------------------------------
   // Instantiate the UART_top Leaf FSM Modules
   //----------------------------------------------
   uart_top uart_inst
     (
      .CLK                    (CLK),
      .RST_N                  (RST_N),
      .DOUT                   (rx_data),
      .DATA_READY             (rx_byte_present),
      .RXD                    (UART_IN),
      .CLK16X                 (clk16x),
      .RDN                    (rx_byte_read),
      .DIN                    (tx_data_reg),
      .TX_BUFFER_EMPTY        (tx_empty),
      .WRN                    (write_tx_byte),
      .SDO                    (UART_OUT)
      );

endmodule // uart_slave

