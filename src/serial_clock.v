//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2016
//#
//#
//# File Name:  serial_clock.v
//# Author:     Earth People Technology
//# Date:       August 10, 2016
//# Revision:   A
//#
//# Development: EPT I2C Master Project 
//# Application: Altera Cyclone IV FPGA
//# Description: This file contains verilog code which will allow access
//#              to Active Transfer Library. 
//#               
//#              
//#
//#************************************************************************
//#
//# Revision History:	
//#			DATE		VERSION		DETAILS		
//#			8/10/16 	1			Created
//#
//#									
//#
//#######################################################################

`resetall
`timescale 1ns/10ps
module serial_clock
  (
    input  wire                 CLK,
    input  wire                 RST_N,

	output  reg                 SERIAL_CLK
   
	
   );

   //----------------------------------------------
   // Parameter Declarations
   //----------------------------------------------
   parameter 	SERIAL_CLOCK_COUNT           = 8'h3f;
   
   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
	reg	[7:0]					serial_clock_counter;
  
   //------------------------------------------------
   //	Assignments   
   //------------------------------------------------

   //------------------------------------------------
   // Divide clock down for serial output.
   //------------------------------------------------
	always @(posedge CLK or negedge RST_N)
 	begin
		if (!RST_N)
		begin
			SERIAL_CLK <= 1'b0;
			serial_clock_counter <= 0;
        end
		else
		begin
		   if(serial_clock_counter < SERIAL_CLOCK_COUNT)
		      serial_clock_counter <= serial_clock_counter + 1'd1;
		   else
		   begin
		      serial_clock_counter <= 0;
			  SERIAL_CLK <= ~SERIAL_CLK;
		   end
		end
	end // always @ (posedge CLK or negedge RST_N)


   
endmodule 


   