//------------------------------------------------------------------------
// active_block.v
// 
//------------------------------------------------------------------------
// 
// Copyright (c) 2012 Earth People Technology Incorporated
// $Rev: 1.00 $ $Date: 2012-06-15 21:48:32 -0800 (Fri, 15 June 2012) $
//
// Rev 1.1   11/11/2012
//           RJJ    Added transfer_busy net, dervied from UC_IN[23].
//                  Signals that the endpoint_registers.v state machine
//                  has completed the transfer in.
//
//------------------------------------------------------------------------
`include "../sim/define.v"

`timescale 1ns/1ps

module active_block_SIM_ONLY (
	input  wire         uc_clk,
	input  wire         uc_reset,
	input  wire [31:0]  uc_in,
	output reg  [29:0]  uc_out,

	input  wire         start_transfer,
	output reg          transfer_received,
	
	output reg          transfer_ready,
	output wire         transfer_busy,
	
	output reg   [7:0]    ept_length,

	input  wire  [2:0]  uc_addr,
	input  wire  [7:0]    uc_length,

	input  wire  [7:0]      transfer_to_host,
	output reg   [7:0]    transfer_to_device//,
	
	);

   //-----------------------------------------------
   // Parameters
   //-----------------------------------------------
   //Block Out State Machine
   parameter   IDLE                    = 0,
			    SEND_COMMAND           = 1,
			    TRANSFER_BYTE          = 2,
			    END_TRANSFER           = 3;
				
	//Block In State Machine
	parameter IN_IDLE                   = 0,
			IN_READ_CMD                 = 1,
			IN_READ_LENGTH              = 2,
			IN_CHECK_COUNT              = 3,
			IN_READ_BYTE                = 4,
            IN_DELAY                    = 5;

   //-----------------------------------------------
   // Internal Signals
   //-----------------------------------------------
	reg 	[5:0]                        state_in, next_in;
   
   // Tranfer to Device registers
	reg  [7:0]                 transfer_received_count;
	
	//State Machine registers
	reg [3:0]                  block_transfer_state;
	reg [7:0]                  data_count;
	reg [1:0]                  block_transfer_state_counter;

`ifdef SIM
   reg [8*26:1] state_name;
`endif
	
   //-----------------------------------------------
   // Assignments
   //-----------------------------------------------
   assign transfer_ready_uc_in = uc_in[30];
   assign transfer_busy = uc_in[31];


   //-----------------------------------------------
   // transfer_ready 
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
	begin
	  if (!uc_reset)
      begin
		     transfer_ready <= 1'b0;
      end 
     else 
     begin
		if(uc_in[30])
             transfer_ready <= 1'b1;
		else
		    transfer_ready <= 1'b0;
	 end
	end
	
   //-----------------------------------------------
   // Block Transfer In  ept_length 
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
	begin
	  if (!uc_reset)
      begin
		     ept_length <= 0;
      end 
     else 
     begin
		if(state_in[IN_READ_CMD])
             ept_length <= uc_in[25:18];
		else
		    ept_length <= ept_length;
	 end
	end
	
   //-----------------------------------------------
   // Block Transfer In  transfer_received 
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
	begin
	  if (!uc_reset)
      begin
		     transfer_received <= 1'b0;
      end 
     else 
     begin
		if(state_in[IN_READ_CMD])
             transfer_received <= 1'b1;
		//else if(state_in[IN_IDLE])
		else if(transfer_received_count >= ept_length)
		    transfer_received <= 1'b0;
	 end
	end
	
   //-----------------------------------------------
   // Block Transfer In  transfer_received_counter
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
	begin
	     if (!uc_reset)
		 begin
		     transfer_received_count <= 0;
	     end 
		 else 
		 begin
             if(state_in[IN_READ_BYTE] & transfer_ready_uc_in)	
             begin
		         transfer_received_count <= transfer_received_count + 1'b1;
			     transfer_to_device = uc_in[7:0];
			 end
		     else if(transfer_received_count >= ept_length)
			 begin
		         transfer_received_count <= 0;
			 end
	     end
    end

   
   //-----------------------------------------------
   // Block Transfer In, Finite State Machine
/*	parameter IN_IDLE                   = 0,
			IN_READ_CMD                 = 1,
			IN_READ_LENGTH              = 2,
			IN_CHECK_COUNT              = 3,
			IN_READ_BYTE                = 4,
			IN_DELAY                    = 5;
*/
   //-----------------------------------------------
   // Next State Logic
   always @(posedge uc_clk or negedge uc_reset)
     begin
		if (!uc_reset)
		begin
			state_in <= 6'h00;
			state_in[IN_IDLE] <= 1'b1;
		end
		else
			state_in <= next_in;
	end

     // State Definitions
   always @ ( state_in or uc_in or transfer_ready_uc_in or transfer_received_count or
             ept_length or uc_addr)
     begin
	next_in = 6'h00;

	if (state_in[IN_IDLE])
	  begin
	     if (uc_in[29:27] == uc_addr)
	       next_in[IN_READ_CMD] = 1'b1;
         else		 
	       next_in[IN_IDLE] = 1'b1;
	  end

	
	if (state_in[IN_READ_CMD])
	  begin
		if (uc_in[26] == 1'b1)
			next_in[IN_READ_BYTE] = 1'b1;
		else 
			next_in[IN_READ_CMD] = 1'b1;
	  end

/*	if ( state_in[IN_READ_LENGTH] )
	begin
			next_in[IN_CHECK_COUNT] = 1'b1;	
	end
*/
	if ( state_in[IN_READ_BYTE] )
	begin
		if ( transfer_ready_uc_in )
		begin
			 next_in[IN_CHECK_COUNT] = 1'b1;	
 		end
		else
	       next_in[IN_READ_BYTE] = 1'b1;
	end

	if ( state_in[IN_CHECK_COUNT] )
	begin
	     //if(transfer_received_count < (ept_length + 3))
		//begin
		//	 next_in[IN_READ_BYTE] = 1'b1;	
 		//end
		//else
	       next_in[IN_DELAY] = 1'b1;
	end

	if (state_in[IN_DELAY])
	begin
         if (transfer_received_count == 0)
	       next_in[IN_IDLE] = 1'b1;
		else if(!transfer_ready_uc_in)
	       next_in[IN_READ_BYTE] = 1'b1;
		else
		   next_in[IN_DELAY] = 1'b1; 
	end


	`ifdef SIM
	   if ( state_in == ( 1 << IN_IDLE ))
		   state_name = "IN_IDLE";
	   else if ( state_in == ( 1 << IN_READ_CMD ))
		   state_name = "IN_READ_CMD";
	   else if ( state_in == ( 1 << IN_READ_LENGTH ))
		   state_name = "IN_READ_LENGTH";
	   else if ( state_in == ( 1 << IN_CHECK_COUNT ))
		   state_name = "IN_CHECK_COUNT";
	   else if ( state_in == ( 1 << IN_READ_BYTE ))
		   state_name = "IN_READ_BYTE";
	   else if ( state_in == ( 1 << IN_DELAY ))
		   state_name = "IN_DELAY";
`endif

	end//end of state_in machine

   //-----------------------------------------------
   // Block Transfer to Host UC_OUT Vector stuffing 
   //-----------------------------------------------
    always @(block_transfer_state or uc_addr or uc_length or uc_reset) 
	begin
	     if (!uc_reset)
		 begin
             uc_out[29:27]    = 0;                 //EndTerm Address
             uc_out[26]       = 1'b0;              //Block Command
             uc_out[25:18]    = 0;                 //Block Length Byte
   	         uc_out[17]       = 1'b0;              //Transfer Command
   	         uc_out[16:9]     = 8'h0;              //Transfer  Byte
   	         uc_out[8]        = 1'b0;              //Trigger Command
		 end
	     else if(block_transfer_state == SEND_COMMAND)
		 begin
             uc_out[26]       = 1'b1;
             uc_out[29:27]    = uc_addr;
             uc_out[25:18]    = uc_length;
		 end
		 else if(block_transfer_state == TRANSFER_BYTE)
		 begin
             uc_out[26]       = 1'b1;
             uc_out[8]        = 1'b1;
             uc_out[29:27]    = uc_addr;
             uc_out[25:18]    = uc_length;
		 end
		 else 
		 begin
             uc_out[26]       = 1'b0;
   	         uc_out[8]        = 1'b0;              
             uc_out[29:27]    = 0;
             uc_out[25:18]    = 0;
		 end
	end

   //-----------------------------------------------
   // Block Transfer to Host Byte Transfer 
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
	begin
	  if (!uc_reset)
	  begin
             uc_out[7:0]    <= 0;
		     data_count <= 0;
	  end 
	  else
	  begin
		 case(block_transfer_state) 
		     SEND_COMMAND :
		          data_count <= uc_length;
		     TRANSFER_BYTE :
		     begin
             	 if(uc_in[30] )
                 begin			 
                     uc_out[7:0]    <= transfer_to_host;
				     if(data_count > 0)
		                 data_count <= data_count - 1'd1;
			     end
		         else
			     begin
                     uc_out[7:0]    <= 0;
			     end
			
	         end
			 default: 
			 begin
                uc_out[7:0]    <= 0;
		     end
		 endcase
	  end
    end

   //-----------------------------------------------
   // Block Transfer to Host State Machine 
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
	begin
	     if (!uc_reset)
		 begin
             block_transfer_state <= IDLE;
			 block_transfer_state_counter <= 0;
	     end 
		 else 
		 begin
		     case(block_transfer_state)
			 IDLE:
			 begin
			     block_transfer_state_counter <= 0;
                 if(start_transfer)
		             block_transfer_state <= SEND_COMMAND;
		         else
		             block_transfer_state <= IDLE;
			 end
			 SEND_COMMAND:
			 begin
			     if(block_transfer_state_counter > 2'h0)
		             block_transfer_state <= TRANSFER_BYTE;
				 else
				     block_transfer_state_counter <= block_transfer_state_counter + 1'd1;
			 end
			 TRANSFER_BYTE:
			 begin
                 if(data_count > 0)		 
		             block_transfer_state <= TRANSFER_BYTE;
		         else
		             block_transfer_state <= END_TRANSFER;
			 end
			 END_TRANSFER:
			 begin
		         block_transfer_state <= IDLE;
			 end
			 endcase
	     end
    end



endmodule

