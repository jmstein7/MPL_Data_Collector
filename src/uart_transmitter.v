/******************************************************************************
 *
 *    File Name:  txmit.v
 *      Version:  1.1
 *         Date:  January 22, 2000
 *        Model:  Uart Chip
 *
 *      Company:  Xilinx
 *
 *
 *   Disclaimer:  THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY 
 *                WHATSOEVER AND XILINX SPECIFICALLY DISCLAIMS ANY 
 *                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
 *                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
 *
 *                Copyright (c) 2000 Xilinx, Inc.
 *                All rights reserved
 *
 ******************************************************************************/


module uart_transmitter
  (
   CLK,
   RST_N,   
   DIN,
   BUFFER_EMPTY,
   CLK16X,
   WRN,
   SDO
   );
   
   //--------------------------------------------------
   // IO Port Declarations                           
   //--------------------------------------------------
   input CLK, RST_N ;     
   output BUFFER_EMPTY ;              // Transmit Buffer Empty
   output SDO ;               // Serial Data Out
   input [7:0] DIN ;          // Parallel Data in     
   input       CLK16X ;       // Local clock 16X Data Rate
   input       WRN ;          // Write Enable Active Low
   
   //-----------------------------------------------
   // Wire and Register Declarations              
   //-----------------------------------------------
   reg 	       BUFFER_EMPTY ;
   reg [3:0]   clk16_count;
   reg 	       serial_clk;
   reg [3:0]   bit_count;
   reg [7:0]   din_reg, shift_reg;
   reg 	       SDO;
   reg 	       serial_clk_enable;
   reg 	       clk16x_reg;
   wire        clk16x_posedge;

   //-----------------------------------------------
   // Signal Assignments
   //----------------------------------------------   
   assign      clk16x_posedge = CLK16X && !clk16x_reg;
   
   //-----------------------------------------------
   // Create a registered version of the 16x Clock
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  clk16x_reg <= 0;
	else
	  clk16x_reg <= CLK16X;
     end

   //-----------------------------------------------
   // Create an input register     
   //-----------------------------------------------   
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  din_reg <= 0;
	else if (!WRN)
	  din_reg <= DIN;
     end

   //-----------------------------------------------
   // Shift Data Bits out Serial Port
   //-----------------------------------------------   
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     shift_reg <= 0;
	     SDO <= 1;
	  end
	else if (serial_clk && serial_clk_enable)
	  begin
	     case (bit_count)
	       4'h0:
		 begin
		    shift_reg <= 0;
		    SDO <= 1;
		 end
	       4'h1: 
		 begin // Start Bit
		    shift_reg <= din_reg;
		    SDO <= 0;
		 end
	       4'h2, 4'h3, 4'h4, 4'h5, 4'h6, 4'h7, 4'h8, 4'h9: 
		 begin // Shift Data Out
		    SDO <= shift_reg[0];
		    shift_reg[6:0] <= shift_reg[7:1];
		    shift_reg[7] <= 1'b0;
		 end
	       4'hA, 4'hB, 4'hC:
		 begin // Stop Bit
		    SDO <= 1'b1;
		    shift_reg <= 0;
		 end
	       default:
		 begin
		    SDO <= 1'b1;
		    shift_reg <= 0;
		 end
	     endcase		 
	  end // if (serial_clk)
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Create a buffer empty signal 
   //-----------------------------------------------   
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  BUFFER_EMPTY <= 1;
	else
	  begin
	     if (!WRN)
	       BUFFER_EMPTY <= 0;
	     else if (serial_clk && (bit_count == 4'hB))
	       BUFFER_EMPTY <= 1;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Create a clk enable signal only active when
   // sending out bits
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  serial_clk_enable <= 0;
	else
	  begin
	     if (!WRN)
	       serial_clk_enable <= 1;
	     else if (bit_count >= 4'hc)
	       serial_clk_enable <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)
   
   //-----------------------------------------------
   // Create a 16x Clock Counter
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  clk16_count <= 0;
	else if (clk16x_posedge)
	  begin
	     if (!WRN)
	       clk16_count <= 0;
	     else
	       clk16_count <= clk16_count + 1;
	  end
     end // always @ (posedge CLK or negedge RST_N)
   
   //-----------------------------------------------
   // Create a Serial Clock at the specific baud rate
   //-----------------------------------------------      
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  serial_clk <= 0;
	else if (serial_clk_enable && clk16x_posedge && (clk16_count == 4'hf))
	  serial_clk <= 1;
	else
	  serial_clk <= 0;
     end

   //-----------------------------------------------
   // Create a bit counter for the serial output
   //-----------------------------------------------      
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  bit_count <= 0;
	else if (serial_clk)
	  bit_count <= bit_count + 1;
	else if (bit_count >= 4'hC)
	  bit_count <= 0;
     end // always @ (posedge CLK or negedge RST_N)
   
endmodule


