//------------------------------------------------------------------------
// active_trigger.v
// 
//------------------------------------------------------------------------
// 
// Copyright (c) 2012 Earth People Technology Incorporated
// $Rev: 100 $ $Date: 2012-05-30 21:04:27 -0800 (Wed, 30 May 2012) $
//------------------------------------------------------------------------
`include "../sim/define.v"

`timescale 1ns/1ps

module active_trigger_SIM_ONLY (
	input  wire                 uc_clk,
	input  wire                 uc_reset,
	input  wire [31:0]          uc_in,
	output wire [29:0]          uc_out,

	input wire   [7:0]          trigger_to_host,
	output wire  [7:0]          trigger_to_device
	
	);
	
   //-----------------------------------------------
   // Parameters
   //-----------------------------------------------
	parameter                   TO_TRIGUPDATE_COUNT = 3'h3;

   //-----------------------------------------------
   // Internal Signals
   //-----------------------------------------------
	reg                         to_trigupdate;
	reg                         trigger_to_host_flag;
	reg [7:0]                   previous_to_trigupdate;
	
	//Trigger to Host Update Reset Registers
	reg [2:0]                   to_trigupdate_counter;
	reg [2:0]                   xint;
	
   //-----------------------------------------------
   // Assignments
   //-----------------------------------------------
	assign uc_out[29:27]       = 3'h0;                                     //Address
	assign uc_out[26]          = 1'b0;                                     //Block Command                                         //Block Command
	assign uc_out[25:18]       = 8'h0;                                     //Block Length Byte
	assign uc_out[17]          = 1'b0;                                     //Transfer Command
    assign uc_out[16:9]        = 8'h0;                                     //Transfer  Byte
	assign uc_out[8]           = to_trigupdate ? 1'b1 : 1'b0;              //Trigger Command
    assign uc_out[7:0]         = to_trigupdate ? trigger_to_host : 8'h0;   //Trigger Byte
	
	assign trigger_to_device = (uc_in[8] == 1'b1) ? uc_in[7:0] : 8'h0;

   //-----------------------------------------------
   // Trigger to Host 
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
    //always @(trigger_to_host or trigger_to_host_flag or uc_reset) 
	begin
	     if (!uc_reset)
		 begin
		     to_trigupdate <= 1'b0;	
             previous_to_trigupdate <= 0;			 
		 end
	     else
		 begin
		     if(trigger_to_host_flag)
		         to_trigupdate <= 1'b0;
		     else if(previous_to_trigupdate == trigger_to_host)
		         to_trigupdate <= 1'b0;
		     else if(trigger_to_host > previous_to_trigupdate)
		     begin
		         to_trigupdate <= 1'b1;	
                 previous_to_trigupdate <= trigger_to_host;			 
		     end
			 else
			 begin
			     if(xint <= 7)
				 begin
				     if(trigger_to_host[xint] == 1'b0)
					     previous_to_trigupdate[xint] <= 1'b0;
				     xint <= xint + 1'd1;
				 end
				 else 
				     xint <= 0;
			 end
		 end
	end
	
   //-----------------------------------------------
   // Reset Trigger to Host 
   //-----------------------------------------------
    always @(posedge uc_clk or negedge uc_reset) 
	begin
	     if (!uc_reset)
		 begin
		     trigger_to_host_flag <= 1'b0;
			 to_trigupdate_counter <= 0;
	     end 
		 else 
		 begin
             if(to_trigupdate)
             begin
                 if(to_trigupdate_counter < TO_TRIGUPDATE_COUNT)
                 begin	
                     to_trigupdate_counter <= to_trigupdate_counter + 1'd1;				 
		             trigger_to_host_flag <= 1'b0;
			     end
		         else
		            trigger_to_host_flag <= 1'b1;
			 end
			 else
			 begin
			     trigger_to_host_flag <= 1'b0;
				 to_trigupdate_counter <= 0;
			 end
	     end
    end



endmodule
