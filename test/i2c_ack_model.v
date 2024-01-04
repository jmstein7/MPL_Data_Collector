//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2014
//#
//#
//# File Name:  i2c_ack_model.v
//# Author:     Earth People Technology
//# Date:       December 20, 2014
//# Revision:   A
//#
//# Development: EPT I2C Slave Project 
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
//#			12/20/14 	1			Created
//#
//#									
//#
//#######################################################################
//`include "fpga_defs.v"

`resetall
`timescale 1ns/10ps
module i2c_ack_model
  (
    input  wire                 CLK,
    input  wire                 RST_N,

    input  wire                 GNT_START,
    input  wire                 REQ_START,
	output  reg                 VALID_SEND,
	output  reg                 VALID_RECEIVE,
 
    input  wire                 DATA_IN,
    output  reg                 DOUT,
    output  reg                 DATA_OUT,
    output  reg                 DONE,
    input   wire                SCLK 
   
	
   );

   //----------------------------------------------
   // Parameter Declarations
   //----------------------------------------------
   parameter 	IDLE                     = 0,
			RECEIVE_ACK			         = 1,
			RECEIVE_ACK_LO               = 2,
			RECEIVE_ACK_HI               = 3,
			READ_ACK                     = 4,
			RECEIVE_ACK_COMPLETE         = 5,
			SEND_ACK                     = 6,
			WRITE_ACK                    = 7,
			SEND_ACK_LO                  = 8,
			SEND_ACK_HI                  = 9,
			SEND_ACK_COMPLETE            = 10,
			SEND_ACK_DELAY               = 11;
   
   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
	reg	[4:0]					bit_count;
	reg                         bit_count_reg;
  
	reg	[11:0]					state, next;

	// sclk_reg to determine value of the output SCLK
	wire	[11:0]				sclk_reg;

	// sdata_reg_reg to determine value of the output DATA_OUT
	wire	[11:0]				sdata_reg;
   

`ifdef SIM
   reg [8*20:1] state_name;
`endif

   //------------------------------------------------
   //	Assignments   
   //------------------------------------------------

	assign	sdata_reg = {state[SEND_ACK] , state[WRITE_ACK] , state[SEND_ACK_LO] , 
	                     state[SEND_ACK_HI] , state[SEND_ACK_DELAY] , state[SEND_ACK_COMPLETE] ,
						 state[IDLE]};

   //------------------------------------------------
   // Create a DATA_OUT output that goes low when 
   // when the ack unit is accessed. Otherwise,
   // DATA_OUT signal to a high.
   //------------------------------------------------
	always @(posedge CLK or negedge RST_N)
 	begin
		if (!RST_N)
		begin
			DATA_OUT <= 1'b0;
			VALID_SEND <= 1'b0;
        end
		else
		begin
			case ( sdata_reg )
			12'b000000000001:
			begin
				DATA_OUT <= 1'b0; //state[IDLE]
			    VALID_SEND <= 1'b0;
		    end
			12'b000000000010:
			begin
				DATA_OUT <= 1'b1;//state[SEND_ACK_COMPLETE] 
			    VALID_SEND <= 1'b1;
		    end
			12'b000000000100:
			begin
				DATA_OUT <= 1'b1;//state[SEND_ACK_DELAY] 
			    VALID_SEND <= 1'b1;
		    end
			12'b000100000000:
			begin
				DATA_OUT <= 1'b0;//state[SEND_ACK_HI] 
			    VALID_SEND <= 1'b0;
		    end
			12'b001000000000:
			begin
				DATA_OUT <= 1'b0;//state[SEND_ACK_LO] 
			    VALID_SEND <= 1'b0;
		    end
			12'b010000000000:
			begin
				DATA_OUT <= 1'b0;//state[WRITE_ACK] , 
			    VALID_SEND <= 1'b0;
		    end
			12'b100000000000:
			begin
				DATA_OUT <= 1'b0;//state[SEND_ACK] 
			    VALID_SEND <= 1'b0;
		    end
			default: 
			begin
				DATA_OUT <= 1'b0;//
			    VALID_SEND <= 1'b0;
		    end
			endcase
		end
	end // always @ (posedge CLK or negedge RST_N)

   //------------------------------------------------
   // VALID_REVEIVE register to indicate when the ack
   // unit is checking the received ack bit
   //------------------------------------------------
	always @(posedge CLK or negedge RST_N)
	begin
		if (!RST_N)
			VALID_RECEIVE <= 0;
	else
	begin
		if ( state[READ_ACK] || state[RECEIVE_ACK_COMPLETE] )
			VALID_RECEIVE <= 1;
	  else
	     VALID_RECEIVE <= 0;
	end
	end // always @ (posedge CLK or negedge RST_N)

	
   //------------------------------------------------
   // Create a DONE Signal when the byte has been transmitted
   //------------------------------------------------
	always @(posedge CLK or negedge RST_N)
	begin
		if (!RST_N)
			DONE <= 0;
	else
	begin
		if ( state[SEND_ACK_COMPLETE] || state[RECEIVE_ACK_COMPLETE] )
			DONE <= 1;
	  else
	     DONE <= 0;
	end
	end // always @ (posedge CLK or negedge RST_N)

   //------------------------------------------------
   // Increment the bit_count. Maintains the number of bits sent
   // on the assertion of SCLK
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
       bit_count <= 0;
       bit_count_reg <= 1'b0;
	end
	else
	  begin
	     if(SCLK & !bit_count_reg)
		 begin
	       bit_count <= bit_count + 1;
		   bit_count_reg <= 1'b1;
		 end
	     else if(!SCLK & bit_count_reg)
		   bit_count_reg <= 1'b0;
		 else if(state[RECEIVE_ACK_COMPLETE] | state[SEND_ACK_COMPLETE])
	       bit_count <= 0;
	  end
     end 
  
   //------------------------------------------------
   // Read Ack Bit
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  DOUT <= 1'b0;
	else
	  begin
	     if ( state[RECEIVE_ACK_COMPLETE] )
	       begin
             DOUT <= DATA_IN;
	       end
	     else if(REQ_START)
	       DOUT <= 1'b0;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)     
	  
//--------------------------------------------------
// Finite State Machine
//
//parameter 	IDLE                     = 0,
//			RECEIVE_ACK                  = 1,
//			RECEIVE_ACK_LO               = 2,
//			RECEIVE_ACK_HI               = 3,
//			READ_ACK                     = 4,
//			RECEIVE_ACK_COMPLETE         = 5,
//			SEND_ACK                     = 6,
//			WRITE_ACK                    = 7,
//			SEND_ACK_LO                  = 8,
//			SEND_ACK_HI                  = 9,
//			SEND_ACK_COMPLETE            = 10;
//
//--------------------------------------------------  
// Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state <= 7'h00;
	     state[IDLE] <= 1'b1;
	  end
	else
	  state <= next;
     end

   always @ ( bit_count or DATA_IN or state or
			GNT_START or REQ_START or SCLK)
     begin
	next = 7'h00;

	if (state[IDLE])
	  begin
		if ( REQ_START )
			next[RECEIVE_ACK] = 1'b1;
		else if ( GNT_START )
			next[SEND_ACK] = 1'b1;
		else
			next[IDLE] = 1'b1;
	  end

	if (state[RECEIVE_ACK])
	begin
	   if(!SCLK & (bit_count <= 8'h7))
	      next[RECEIVE_ACK_LO] = 1'b1;
       else
	      next[READ_ACK] = 1'b1;
	end

	if (state[RECEIVE_ACK_LO])
	begin
	   if(SCLK)
          next[RECEIVE_ACK_HI] = 1'b1;	
       else
	      next[RECEIVE_ACK_LO] = 1'b1;
	end

	if (state[RECEIVE_ACK_HI])
	begin
	   if(!SCLK)
	       next[RECEIVE_ACK] = 1'b1;
       else
	      next[RECEIVE_ACK_HI] = 1'b1;
	end
 
	if (state[READ_ACK])
	begin
		if (SCLK)
			next[RECEIVE_ACK_COMPLETE] = 1'b1;
	     else
			next[READ_ACK] = 1'b1;
	end

	if (state[RECEIVE_ACK_COMPLETE]) 
	begin
		if (!SCLK)
            next[IDLE] = 1'b1;
	     else
			next[RECEIVE_ACK_COMPLETE] = 1'b1;
	end

	if (state[SEND_ACK])
	begin
	   if(!SCLK)
          next[WRITE_ACK] = 1'b1;
       else
          next[SEND_ACK] = 1'b1;
	end

	if (state[WRITE_ACK])
	begin
	   if(!SCLK & (bit_count <= 8'h7))
          next[SEND_ACK_LO] = 1'b1;	
       else
	      next[SEND_ACK_DELAY] = 1'b1;
	end

	if (state[SEND_ACK_LO])
	begin
	   if(SCLK)
          next[SEND_ACK_HI] = 1'b1;	
       else
          next[SEND_ACK_LO] = 1'b1;
	end

	if (state[SEND_ACK_HI])
	begin
	   if(!SCLK)
          next[WRITE_ACK] = 1'b1;	
       else
          next[SEND_ACK_HI] = 1'b1;
	end

	if (state[SEND_ACK_DELAY])
	begin
		if(SCLK)
			next[SEND_ACK_COMPLETE] = 1'b1;
		else
			next[SEND_ACK_DELAY] = 1'b1;			
	end
	
	if (state[SEND_ACK_COMPLETE])
	begin
		if( !SCLK)
			next[IDLE] = 1'b1;
		else
			next[SEND_ACK_COMPLETE] = 1'b1;			
	end


`ifdef SIM
	if (state == (1 << IDLE))
	  state_name = "IDLE";
	else if (state == (1 << RECEIVE_ACK))
	  state_name = "RECEIVE_ACK";
	else if (state == (1 << RECEIVE_ACK_LO))
	  state_name = "RECEIVE_ACK_LO";
	else if (state == (1 << RECEIVE_ACK_HI))
	  state_name = "RECEIVE_ACK_HI";
	else if (state == (1 << READ_ACK))
	  state_name = "READ_ACK";
	else if (state == (1 << RECEIVE_ACK_COMPLETE))
	  state_name = "RECEIVE_ACK_COMPLETE";	
	else if (state == (1 << SEND_ACK))
	  state_name = "SEND_ACK";	
	else if (state == (1 << WRITE_ACK))
	  state_name = "WRITE_ACK";
	else if (state == (1 << SEND_ACK_LO))
	  state_name = "SEND_ACK_LO";	
	else if (state == (1 << SEND_ACK_HI))
	  state_name = "SEND_ACK_HI";	
	else if (state == (1 << SEND_ACK_DELAY))
	  state_name = "SEND_ACK_DELAY";	
	else if (state == (1 << SEND_ACK_COMPLETE))
	  state_name = "SEND_ACK_COMPLETE";	
`endif
     end // always @ (...

   
endmodule 


   