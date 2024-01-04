/*****************************************************
 * $Workfile::                                       
 * $Author:: R Jolly                                        
 * $Date::   03/04/08                                        
 * $Revision::  001                                     
 *
 * Copyright Smartronix, Inc. 2008
 *
 * This header files defines the input/output

 * 03/04/08		Created 
			
******************************************************/


`timescale 1ns / 100ps

module host_ft245_model_read
  (
	CLK,
	RST_N,

	HOST_FT245_RXF_N,
	HOST_FT245_RD_N,
	HOST_FT245_READ_BYTE,

	TRANSMIT_BYTE,
	START_READ_CYCLE,
	READ_CYCLE_RDY,
	READ_CYCLE_COMPLETE


 );

   //----------------------------------------------
   // Parameter Declarations  
   //----------------------------------------------
   parameter IDLE                        = 0,
             ASSERT_RXF_N                = 1,
             DELAY_RXF_N                 = 2,
             WAIT_FOR_CYCLE_END          = 3,
             READ_COMPLETE               = 4;

   //--------------------------------------------------
   // IO Port Declarations                           
   //--------------------------------------------------
	input     				CLK, RST_N;

	output					HOST_FT245_RXF_N;
	input					HOST_FT245_RD_N;
	output	[7:0]				HOST_FT245_READ_BYTE;


	input	[7:0]				TRANSMIT_BYTE;
	input					START_READ_CYCLE;
	output					READ_CYCLE_RDY;
	output					READ_CYCLE_COMPLETE;
   
   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
	reg 	[8:0] 				state, next;

	reg					HOST_FT245_RXF_N;
	reg	[7:0]				HOST_FT245_READ_BYTE;

	reg					READ_CYCLE_RDY;

	wire				READ_CYCLE_COMPLETE;

	// register the START_READ_CYCLE signal
	reg					start_read_cycle_reg;

	//register the HOST_FT245_RD_N signal
	reg					ft245_rd_n_reg;

	//output enable register
	reg					output_enable_reg;

	//rxf_n delay registesr
	reg	[15:0]				rxf_n_delay_count;
	reg					rxf_n_delay_reg;
  

`ifdef SIM
   reg [8*26:1] state_name;
`endif

   //--------------------------------------------------
   // Signal Assignments
   //--------------------------------------------------   


   //-----------------------------------------------
   // Create a rxf_n_delay_count. This will allow
   // HOST_FT245_RXF_N to assert for several clocks
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
				rxf_n_delay_reg <= 0;
				rxf_n_delay_count <= 0;
	end
	else
	begin 
	if ( state[WAIT_FOR_CYCLE_END] && !rxf_n_delay_reg )
		//if ( state[DELAY_RXF_N] && !rxf_n_delay_reg )
			rxf_n_delay_reg <= 1;
		else if ( rxf_n_delay_reg )
		begin
			rxf_n_delay_reg <= 1;
			rxf_n_delay_count <= rxf_n_delay_count + 1;
			if( rxf_n_delay_count >= 8'hf)
			begin
				rxf_n_delay_reg <= 0;
				rxf_n_delay_count <= 0;
			end
		end
     end
	end


   //-----------------------------------------------
   // Register the HOST_FT245_RXF_N Outputs
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  HOST_FT245_RXF_N <= 1'b1;
	else
	  begin
	     if ( state[ASSERT_RXF_N] )
	       HOST_FT245_RXF_N <= 1'b0;
	     else if ( state[WAIT_FOR_CYCLE_END] )
	       HOST_FT245_RXF_N <= 1'b1;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)



   //-----------------------------------------------
   // Register the READ_CYCLE_RDY Outputs
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  READ_CYCLE_RDY <= 1'b0;
	else
	  begin
	     if ( state[DELAY_RXF_N] )
	       READ_CYCLE_RDY <= 1'b1;
	     else
	       READ_CYCLE_RDY <= 1'b0;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)



   //-----------------------------------------------
   // Create a start the read cycle register
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	  start_read_cycle_reg <= 0;
	end
	else
	  begin
			if ( START_READ_CYCLE )
			begin
				start_read_cycle_reg <= 1;
			end
			else
			begin
				start_read_cycle_reg <= 0;
			end
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)


   //-----------------------------------------------
   // Register teh HOST_FT245_RD_N input signal
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  ft245_rd_n_reg <= 0;
	else
	  begin
	     if ( !HOST_FT245_RD_N )
	       ft245_rd_n_reg <= 1;
	     else
	       ft245_rd_n_reg <= 0;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)



   //-----------------------------------------------
   // Register the HOST_FT245_READ_BYTE Outputs
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  HOST_FT245_READ_BYTE <= 0;
	else
	  begin
	     if ( state[ASSERT_RXF_N] )
	       HOST_FT245_READ_BYTE <= TRANSMIT_BYTE;
	     else
	       HOST_FT245_READ_BYTE <= HOST_FT245_READ_BYTE;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
   
   //-----------------------------------------------
   // Register the READ_CYCLE_COMPLETE Outputs
   //-----------------------------------------------
    assign READ_CYCLE_COMPLETE = state[READ_COMPLETE] ? 1'b1 : 1'b0;
/*   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  READ_CYCLE_COMPLETE <= 1'b0;
	else
	  begin
	     if ( state[READ_COMPLETE] )
	       READ_CYCLE_COMPLETE <= 1'b1;
	     else
	       READ_CYCLE_COMPLETE <= 1'b0;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
*/

   

   //-----------------------------------------------
   // Finite  State Machine
   //-----------------------------------------------
   // Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state <= 9'h000;
	     state[IDLE] <= 1'b1;
	  end
	else
	  state <= next;
     end



     // State Definitions
   always @ ( state or start_read_cycle_reg or HOST_FT245_RXF_N or
		      ft245_rd_n_reg or rxf_n_delay_count) 
     begin
	next = 9'h000;

	if (state[IDLE])
	  begin
	     if ( start_read_cycle_reg )
	       next[ASSERT_RXF_N] = 1'b1;
	     else
	       next[IDLE] = 1'b1;
	  end

	
	if (state[ASSERT_RXF_N])
	  begin
		next[DELAY_RXF_N] = 1'b1;
	  end


	if (state[DELAY_RXF_N])
	  begin
	     if ( ft245_rd_n_reg )
//	     if ( rxf_n_delay_count >= 16'h05 )
	       next[WAIT_FOR_CYCLE_END] = 1'b1;
	     else
	       next[DELAY_RXF_N] = 1'b1;
	  end

	if (state[WAIT_FOR_CYCLE_END])
	  begin
 	     if(( rxf_n_delay_count >= 16'h05 ) & !ft245_rd_n_reg)
	       next[READ_COMPLETE] = 1'b1;
	     else
	       next[WAIT_FOR_CYCLE_END] = 1'b1;		  
	  end

	if (state[READ_COMPLETE])
	       next[IDLE] = 1'b1;

 	//--------------------------------------------------
	// For simulation, display the state names
	//--------------------------------------------------
`ifdef SIM
	if (state == (1 << IDLE))
	  state_name = "IDLE";
	else if (state == (1 << ASSERT_RXF_N))
	  state_name = "ASSERT_RXF_N";
	else if (state == (1 << DELAY_RXF_N))
	  state_name = "DELAY_RXF_N";
	else if (state == (1 << WAIT_FOR_CYCLE_END))
	  state_name = "WAIT_FOR_CYCLE_END";
	else if (state == (1 << READ_COMPLETE))
	  state_name = "READ_COMPLETE";
`endif

	end//end of state machine


	
   
endmodule 