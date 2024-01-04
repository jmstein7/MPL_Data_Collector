/*****************************************************
 * $Workfile::                                       
 * $Author:: R Jolly                                        
 * $Date::   05/24/07                                        
 * $Revision::  001                                     
 *
 * Copyright Smartronix, Inc. 2007
 *
 * This header files defines the input/output

 * 05/24/07		Created 
			
******************************************************/


`timescale 1ns / 100ps

module host_ft245_model_write
  (
	CLK,
	RST_N,

	HOST_FT245_TXE_N,
	HOST_FT245_WR,
	HOST_FT245_WRITE_BYTE,

	TRANSMIT_BYTE,
	START_WRITE_CYCLE,
	WRITE_CYCLE_COMPLETE


   );

   //----------------------------------------------
   // Parameter Declarations  
   //----------------------------------------------
   parameter IDLE					= 0,
			WAIT_FOR_WR_ASSERT 		= 1,
			ASSERT_TXE_N	 		= 2,
			WAIT_FOR_CYCLE_END		= 3;

   //--------------------------------------------------
   // IO Port Declarations                           
   //--------------------------------------------------
	input     			CLK, RST_N;

	output				HOST_FT245_TXE_N;
	input				HOST_FT245_WR;
	input	[7:0]			HOST_FT245_WRITE_BYTE;

	output	[7:0]			TRANSMIT_BYTE;
	input				START_WRITE_CYCLE;
	output				WRITE_CYCLE_COMPLETE;

   
   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
	reg	[7:0]			TRANSMIT_BYTE;

	reg				HOST_FT245_TXE_N;

	reg				WRITE_CYCLE_COMPLETE;

	reg 	[8:0] 			state, next;



	reg				output_enable_reg;
	
	//Register the HOST_FT245_WR input
	reg				write_enable;
	reg				write_enable_reg;

	//Regisers for the HOST_FT245_TXE_N
	reg				txe_delay_reg;
	reg	[7:0]			txe_delay_count;
	reg				host_ft245_txe_n_reg;
	reg	[7:0]			host_ft245_txe_n_count;


	//write_byte delay registers
	reg				write_byte_control_reg;
	reg	[7:0]			write_byte_control_count;


  

`ifdef SIM
   reg [8*26:1] state_name;
`endif

   //--------------------------------------------------
   // Signal Assignments
   //--------------------------------------------------   

	

 	//--------------------------------------------------
	// For simulation, display the state names
	//--------------------------------------------------
`ifdef SIM
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  state_name <= 0;
	else
	  begin
	if (state == (1 << IDLE))
	  state_name = "IDLE";
	else if (state == (1 << WAIT_FOR_WR_ASSERT))
	  state_name = "WAIT_FOR_WR_ASSERT";
	else if (state == (1 << ASSERT_TXE_N))
	  state_name = "ASSERT_TXE_N";
	else if (state == (1 << WAIT_FOR_CYCLE_END))
	  state_name = "WAIT_FOR_CYCLE_END";
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
`endif





   //-----------------------------------------------
   // Register the HOST_FT245_TXE_N Output
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
		HOST_FT245_TXE_N <= 0;
		host_ft245_txe_n_reg <= 0;
		host_ft245_txe_n_count <= 0;
	end
	else
	  begin
	     if ( state[ASSERT_TXE_N] && !host_ft245_txe_n_reg )
		begin
	       		HOST_FT245_TXE_N <= 1;
			host_ft245_txe_n_reg <= 1;
		end
	     else if ( host_ft245_txe_n_reg )
		begin
			host_ft245_txe_n_reg <= 1;
			host_ft245_txe_n_count <= host_ft245_txe_n_count + 1;
			if( host_ft245_txe_n_count >= 8'h08 )
			begin
	       			HOST_FT245_TXE_N <= 0;
				host_ft245_txe_n_reg <= 0;
				host_ft245_txe_n_count <= 0;
			end
		end
	     else if ( state[IDLE] )
		begin
			HOST_FT245_TXE_N <= 0;
			host_ft245_txe_n_reg <= 0;
			host_ft245_txe_n_count <= 0;
		end
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
   


   //-----------------------------------------------
   // Register the WRITE_CYCLE_COMPLETE Output
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  WRITE_CYCLE_COMPLETE <= 0;
	else
	  begin
	     if ( state[WAIT_FOR_CYCLE_END] )
	       WRITE_CYCLE_COMPLETE <= 1;
	     else if ( state[IDLE] )
	       WRITE_CYCLE_COMPLETE <= 0;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
   



   //-----------------------------------------------
   // Create a txe_delay_count. This will allow
   // state[ASSERT_TXE_N] to assert for several clocks
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
				txe_delay_reg <= 0;
				txe_delay_count <= 0;
	end
	else
	begin
		if ( state[ASSERT_TXE_N] && !txe_delay_reg )
			txe_delay_reg <= 1;
		else if ( txe_delay_reg )
		begin
			txe_delay_reg <= 1;
			txe_delay_count <= txe_delay_count + 1;
			if( txe_delay_count >= 8'hf)
			begin
				txe_delay_reg <= 0;
				txe_delay_count <= 0;
			end
		end
     end
	end


   //-----------------------------------------------
   // Create a write_byte_control_count. This will allow
   // state[WRITE_CONTROL_BYTE] to assert for several clocks
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
				write_byte_control_reg <= 0;
				write_byte_control_count <= 0;
	end
	else
	begin
		if ( state[WAIT_FOR_WR_ASSERT] && !write_byte_control_reg )
			write_byte_control_reg <= 1;
		else if ( write_byte_control_reg )
		begin
			write_byte_control_reg <= 1;
			write_byte_control_count <= write_byte_control_count + 1;
			if( write_byte_control_count >= 8'hf)
			begin
				write_byte_control_reg <= 0;
				write_byte_control_count <= 0;
			end
		end
     end
	end
 
   //-----------------------------------------------
   // Create an write enable register
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
   begin
	 if (!RST_N)
	 begin
		write_enable <= 0;
	 end
	 else
	  begin
	     if (!HOST_FT245_WR)
			write_enable <= 1;
	    else 
		     write_enable <= 0;
	 end
    end
/*   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
		write_enable <= 0;
		write_enable_reg <= 0;
	end
	else
	  begin
	     if ( !HOST_FT245_WR && !write_enable_reg )
		begin
			write_enable_reg <= 1;
			write_enable <= 1;
		end
	     else if ( HOST_FT245_WR && write_enable_reg )
		begin
			write_enable <= 0;
			write_enable_reg <= 0;
		end
	     else if ( state[WAIT_FOR_CYCLE_END] )
		begin
			write_enable <= 0;
			write_enable_reg <= 0;
		end
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
*/


   //-----------------------------------------------
   // Register the REGISTER_DATA Outputs
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  TRANSMIT_BYTE <= 8'h88;
	else
	  begin
	     if ( state[ASSERT_TXE_N] & write_enable)
	       TRANSMIT_BYTE <= HOST_FT245_WRITE_BYTE;
	     else
	       TRANSMIT_BYTE <= TRANSMIT_BYTE;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
   


  

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
   always @ ( state or write_enable_reg or write_enable
		or txe_delay_count or write_byte_control_count ) 
     begin
	next = 9'h000;

	if (state[IDLE])
	  begin
	     if ( write_enable )
	       next[WAIT_FOR_WR_ASSERT] = 1'b1;
	     else
	       next[IDLE] = 1'b1;
	  end

	
	if (state[WAIT_FOR_WR_ASSERT])
	  begin
		if ( write_byte_control_count > 8'h2 )
			next[ASSERT_TXE_N] = 1'b1;
		else 
			next[WAIT_FOR_WR_ASSERT] = 1'b1;
	  end

	if (state[ASSERT_TXE_N])
	  begin
	     if ( txe_delay_count > 8'h2 )
	       next[WAIT_FOR_CYCLE_END] = 1'b1;
	     else
	       next[ASSERT_TXE_N] = 1'b1;
	  end

	if (state[WAIT_FOR_CYCLE_END])
	  begin
	     if (!write_enable)
	       next[IDLE] = 1'b1;
	     else
	       next[WAIT_FOR_CYCLE_END] = 1'b1;
	  end
	


	end//end of state machine


	
   
endmodule 