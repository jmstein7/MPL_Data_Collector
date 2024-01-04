//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2014
//#
//#
//# File Name:  i2c_write_model.v
//# Author:     Earth People Technology
//# Date:       November 30, 2014
//# Revision:   A
//#
//# Development: EPT I2C Slave Project Testbench
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
//#			11/30/14 	1			Created
//#
//#									
//#
//#######################################################################

`include "../src/define.v"

`timescale 1 ns / 10 ps

module i2c_write_model
  (
   CLK, 
   RST_N,

   START,
   DONE,

   DIN,
   DATA_OUT,
   SCLK,
   PERFORM_READ
   );

   //----------------------------------------------
   // Parameter Declarations
   //----------------------------------------------
   parameter IDLE			= 0,
	     LOAD_FIRST_BIT		= 1,
	     CLOCK_HI			= 2,
	     CLOCK_LOW			= 3,
	     WRITE_DONE		= 4,
		CLOCK_HI_DELAY		= 5,
		CLOCK_LO_DELAY		= 6,
		LOAD_FIRST_BIT_DELAY = 7;
   
   //--------------------------------------------------
   // IO Port Declarations
   //--------------------------------------------------     
   input   CLK;
   input   RST_N;
   input   START;
   input [7:0] DIN;
   
   output      DONE;
   output      DATA_OUT;
   output      SCLK;

   input		PERFORM_READ;
   
   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
   reg [4:0]   bit_count;
   reg [7:0]   shift_reg;
   wire 	       DONE;
   reg 	       DATA_OUT;
   reg 	       SCLK;
   
   reg [7:0]   state, next;

`ifdef SIM
   reg [8*20:1] state_name;
`endif

   //------------------------------------------------
   // Signal Assignments  
   //------------------------------------------------
	assign		DONE = state[WRITE_DONE] ? 1'b1 : 1'b0;
   //------------------------------------------------
   // Create a DONE Signal when the byte has been transmitted
   //------------------------------------------------
//   always @(posedge CLK or negedge RST_N)
//     begin
//	if (!RST_N)
//	  DONE <= 0;
//	else
//	  begin
//	     if (state[WRITE_DONE])
//	       DONE <= 1;
//	     else
//	       DONE <= 0;
//	  end
//     end // always @ (posedge CLK or negedge RST_N)

   //------------------------------------------------
   // Create a bit_count of the number of bits sent
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  bit_count <= 0;
	else
	  begin
	     if (state[CLOCK_LOW])
	       bit_count <= bit_count + 1;
	     else if (state[WRITE_DONE])
	       bit_count <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //------------------------------------------------
   // Create a Serial Clock Out
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  SCLK <= 0;
	else
	  begin
	  	if(state[LOAD_FIRST_BIT] || state[LOAD_FIRST_BIT_DELAY])
			SCLK <= 0;
	     else if (state[CLOCK_HI] || state[CLOCK_HI_DELAY] )
	       //SCLK <= 1;
			SCLK <= 1;
		 else if (state[CLOCK_LOW] || state[CLOCK_LO_DELAY] )
			SCLK <= 0;
	     else if (state[WRITE_DONE] )
	       SCLK <= 0;
		 //else
		 //  SCLK <= 1;
	  end
     end // always @ (posedge CLK or negedge RST_N)
   
   //------------------------------------------------
   // Shift Data Out
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     shift_reg <= 0;
	     DATA_OUT <= 0;
	  end
	else
	  begin
	     if (state[IDLE] && START)
	       begin
		  DATA_OUT <= 0;
		  shift_reg <= DIN;
	       end
	     else if (state[IDLE] && PERFORM_READ)
	       begin
		  DATA_OUT <= 1;
		  shift_reg <= DIN;
	       end
	     else if (state[LOAD_FIRST_BIT] || state[CLOCK_LOW])
	       begin
		  DATA_OUT <= shift_reg[7];
		  shift_reg[7:1] <= shift_reg[6:0];
	       end
	     else if (state[DONE])
	       begin
		  shift_reg <= 0;
		  DATA_OUT <= 0;
	       end
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
         
	  
   //--------------------------------------------------
   // Write State Machine
   //--------------------------------------------------  
   // Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state <= 5'h00;
	     state[IDLE] <= 1'b1;
	  end
	else
	  state <= next;
     end

   always @ ( /*AUTOSENSE*/START or bit_count or state)
     begin
	next = 5'h00;

	if (state[IDLE])
	  begin
	     if (START)
	       next[LOAD_FIRST_BIT] = 1'b1;
	     else
	       next[IDLE] = 1'b1;
	  end

	if (state[LOAD_FIRST_BIT])
	  next[CLOCK_HI] = 1'b1;
	  //next[LOAD_FIRST_BIT_DELAY] = 1'b1;

	if (state[LOAD_FIRST_BIT_DELAY])
	  next[CLOCK_HI] = 1'b1;

	if (state[CLOCK_HI])
	  begin
	     if (bit_count == 7)
	       next[WRITE_DONE] = 1'b1;
	     else
	       next[CLOCK_LOW] = 1'b1;
	       //next[CLOCK_HI_DELAY] = 1'b1;
	  end

	if (state[CLOCK_HI_DELAY])
	  next[CLOCK_LOW] = 1'b1;

	if (state[CLOCK_LOW])
	  next[CLOCK_HI] = 1'b1;
	  //next[CLOCK_LO_DELAY] = 1'b1;

	if (state[CLOCK_LO_DELAY])
	  next[CLOCK_HI] = 1'b1;

	if (state[WRITE_DONE])
	  next[IDLE] = 1'b1;	

`ifdef SIM
	if (state == (1 << IDLE))
	  state_name = "IDLE";
	else if (state == (1 << LOAD_FIRST_BIT))
	  state_name = "LOAD_FIRST_BIT";
	else if (state == (1 << CLOCK_HI))
	  state_name = "CLOCK_HI";
	else if (state == (1 << CLOCK_LOW))
	  state_name = "CLOCK_LOW";
	else if (state == (1 << WRITE_DONE))
	  state_name = "WRITE_DONE";	
	else if (state == (1 << CLOCK_HI_DELAY))
	  state_name = "CLOCK_HI_DELAY";	
	else if (state == (1 << CLOCK_LO_DELAY))
	  state_name = "CLOCK_LO_DELAY";	
	else if (state == (1 << LOAD_FIRST_BIT_DELAY))
	  state_name = "LOAD_FIRST_BIT_DELAY";	
`endif
     end // always @ (...

   
endmodule // write_SPI_fsm

   