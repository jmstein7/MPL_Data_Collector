//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2015
//#
//#
//# File Name:  active_transfer_library.v
//# Author:     R. Jolly
//# Date:       August 10, 2015
//# Revision:   A
//#
//# Development: USB Test Tool Interface board 
//# Application: Altera MAX II CPLD
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
//#			8/10/15 	A			Created			RJJ
//#
//#									
//#
//#######################################################################
`include "../sim/define.v"

`timescale 1ns/1ps


//************************************************************************
//* Module Declaration
//************************************************************************

module active_transfer_library_SIM_ONLY (

	
	input  wire [1:0]         aa,
	input  wire [1:0]         bc_in,
	output wire [2:0]         bc_out,
    inout  wire [7:0]         bd_inout,
	
	output wire [31:0]        UC_IN,
	input  wire [29:0]        UC_OUT
	);

   //----------------------------------------------
   // Parameter Declarations  
   //----------------------------------------------
    parameter 
                IDLE							= 0,
				ASSERT_RD_N	 					= 1,
				WAIT_FOR_DE_ASSERT_RD_N			= 2,
				DE_ASSERT_RD_N					= 3,
				DECODE_BYTE                     = 4,
				READ_CONTROL_BYTE               = 5,
				READ_DATA_BYTE                  = 6,
				WAIT_FIFO_READY                 = 7,
				WRITE_CONTROL_BYTE              = 8,
                WRITE_CONTROL_COMPLETE          = 9,
                WRITE_DATA_BYTE                 = 10,
                WRITE_DATA_COMPLETE             = 11,
				ASSERT_WR						= 12,
				CHECK_TXE						= 13,
				WAIT_FOR_WR_COMPLETION			= 14,
				DE_ASSERT_WR					= 15;


  //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------

   //Clock and Reset
	wire                                 CLK;
	wire                                 RST_N;

	reg   [15:0]                         state, next;
	
   //Signals passed between leaf modules
	//wire  [7:0]                          register_decode;
	//wire                                 data_byte_ready;
	//wire                                 ept_int_enable;
	//wire                                 ept_int_write_enable;
	//wire  [7:0]                          ept_int_write_byte;
	//wire  [7:0]                          ft_usb_data_out;
	//wire  [7:0]                          ft_usb_data_in;
	


	//Read/Write Control
	reg                                  read_complete;
	reg                                  read_complete_reg;
	reg	[7:0]                            read_complete_cntr;
	reg                                  write_complete;
	reg                                  write_complete_reg;
	
	//Write control registers
	//reg							write_en_meta_1;
	//reg							write_en_meta_2;
	//reg							write_en_reg;
	
	//Register the FT245 read control inputs 
	reg                                  usb_rxf_n_reg;

	//Register the FT245 write control inputs 
	reg                                  usb_txe_n_reg;
	reg                                  usb_txe_n_meta_1;
	reg                                  usb_txe_n_meta_2;

	//USB signals
    wire                                 USB_RXF_N;
    wire                                 USB_TXE_N;
    reg                                  USB_RD_N;
    reg                                  USB_WR;
	
	//byte_count 
	reg	[7:0]                            byte_count;
	
	//Register to store the contents of bd_inout
	reg [7:0]                            bd_inout_latch;

	//Decode Byte multiplexor
	reg	[7:0]                            control_multiplexor;

	//Register to store the decode value
	reg                                  command_byte;

	//Write byte control registers
	reg	[7:0]                            write_control_mux;
	reg                                  write_control_mux_reg;
	reg                                  write_en_reg;
	reg                                  write_data_byte;
    reg	[7:0]                            WRITE_BYTE;
	reg                                  store_payload_reg;

    // Registers to convert UC_IN bits for USB transfer message
    wire [2:0]                           device;
    reg [2:0]                            command_from_device;
    reg [7:0]                            length_from_device;
    reg [2:0]                            address_from_device;
    reg [7:0]                            payload_from_device;
    reg [7:0]                            uc_in_payload;
    reg [2:0]                            uc_in_command;
    reg [2:0]                            uc_in_address;
    reg [7:0]                            uc_in_length;

	// Register to start the write to Host state machine
    reg                                  write_to_host;	
	
	// Registers from FT2232H to Device
	wire [2:0]                           command_to_device;
	wire [2:0]                           address_to_device;
	reg [7:0]                            length_to_device;
	
	// Registers for the Block Transfer
	reg                                  block_read_byte;
	reg                                  byte_count_reg;
	reg                                  transfer_busy;
	reg [2:0]                            data_byte_ready_delay_cnt;
 
    // Reset Registers
	reg                                  reset_uc_in;
	reg                                  reset_uc_in_reg;
	reg [3:0]                            reset_uc_in_counter;

    // UC_OUT meta stability registers	
	wire [3:0]                           uc_out_command;

	
`ifdef SIM
   reg [8*26:1] state_name;
`endif

   //--------------------------------------------------
   // Signal Assignments
   //--------------------------------------------------   

   //Clock and Reset
   
   assign CLK = aa[1];
   assign RST_N = aa[0];
   //-----------------------------------------------
   // USB_DATA_OUT comes from the WRITE_BYTE which is
   // derived from the payload of the UC_IN vector
   //-----------------------------------------------
	//assign USB_DATA_OUT = ( state[ASSERT_WR] || state[WAIT_FOR_WR_COMPLETION] ) ? WRITE_BYTE : 8'hzz;
	assign USB_RXF_N = bc_in[1];
	assign USB_TXE_N = bc_in[0];
	assign bc_out[2] = USB_RD_N;
	assign bc_out[1] =  USB_WR;
	assign bc_out[0] = 1'b0;
	
   //-----------------------------------------------
   // UC_IN signal assignments.
   //      UC_IN Bit         Description
   //         [31]           Busy
   //         [30]           Block FIFO
   //         [29:27]        EndTerm Address
   //         26             Block Command
   //         [25:18]        Block Length Byte
   //         17             Transfer Command
   //         [16:9]         Transfer  Byte
   //          8             Trigger Command
   //          [7:0]         Trigger Byte
   //-----------------------------------------------
	assign UC_IN[31] = transfer_busy;
	assign UC_IN[30] = (state[WRITE_DATA_COMPLETE] & (command_from_device == 3'h5) & write_data_byte) | (state[WAIT_FIFO_READY] & (byte_count > 8'h4) & reset_uc_in) ? 1'b1 : 1'b0;
	assign UC_IN[29:27] = reset_uc_in ? uc_in_address : 0;
	assign UC_IN[26] = reset_uc_in ? uc_in_command[2] : 0;
	assign UC_IN[25:18] = reset_uc_in ? length_to_device : 0;
	assign UC_IN[17] = reset_uc_in ? uc_in_command[1] : 0;
	assign UC_IN[16:9] = reset_uc_in ? uc_in_payload : 0;
	assign UC_IN[8] = reset_uc_in ? uc_in_command[0] : 0;
	assign UC_IN[7:0] = reset_uc_in ? uc_in_payload : 0;
	

   //-----------------------------------------------
   // Data bus assignment comes from USB_DATA_OUT
   //-----------------------------------------------
	assign bd_inout = ( state[ASSERT_WR] || state[CHECK_TXE] || state[DE_ASSERT_WR] ) ? WRITE_BYTE : 8'hzz;
 
   //-----------------------------------------------
   // Command/Data To Device
   // Command Byte, command_to_device, and address_to_device
   // decode logic   
   //-----------------------------------------------
	assign  command_to_device = control_multiplexor[5:3];
	assign  address_to_device = control_multiplexor[2:0];
	
   //-----------------------------------------------
   // Create a State Test Output Signal
   //-----------------------------------------------
/*   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  STATE_OUT <= 0;
	else
	  begin
	     if (state[IDLE])
            STATE_OUT <= 4'h0;
	     if (state[ASSERT_RD_N])
	       STATE_OUT <= 4'h1;
	     if (state[WAIT_FOR_RD_COMPLETION])
	       STATE_OUT <= 4'h2;
	     if (state[WAIT_FOR_DE_ASSERT_RD_N])
	       STATE_OUT <= 4'h3;
	     if (state[DE_ASSERT_RD_N])
	       STATE_OUT <= 4'h4;
	     if (state[CHECK_TXE])
	       STATE_OUT <= 4'h5;
	     if (state[ASSERT_WR])
	       STATE_OUT <= 4'h6;
	     if (state[WAIT_FOR_WR_COMPLETION])
	       STATE_OUT <= 4'h7;
	     if (state[DE_ASSERT_WR])
	       STATE_OUT <= 4'h8;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
*/

   //-----------------------------------------------
   // Command/Data To Host: 
   // Read the incoming command and 
   // assert the write_to_host signal
   //-----------------------------------------------
   //-----------------------------------------------
   // Detect Communications To Host 
   // 
   //
   //      UC_OUT Bit         Description
   //         [29:27]        EndTerm Address
   //         26             Block Command
   //         [25:18]        Block Length Byte
   //         17             Transfer Command
   //         [16:9]         Transfer  Byte
   //          8             Trigger Command
   //          [7:0]         Trigger Byte
   //-----------------------------------------------
   assign uc_out_command = {UC_OUT[26],UC_OUT[17],UC_OUT[8]};
  always @(posedge CLK or negedge RST_N)
  begin
	if (!RST_N)
	begin
		write_to_host <= 1'b0;
		store_payload_reg <= 0;
        command_from_device <= 0;
        length_from_device <=  0;
        address_from_device <= 0;
        payload_from_device <= 0;
	end
	else
	begin 
	     case(uc_out_command)
		 3'b001://Trigger Command
         begin
            command_from_device <= 0;
            address_from_device <= 0;
            payload_from_device <= UC_OUT[7:0];
		    write_to_host <= 1'b1;
		 end
		 3'b010://Transfer Command
         begin
            command_from_device <= uc_out_command;//uc_in_command;
            address_from_device <= UC_OUT[29:27];
            payload_from_device <= UC_OUT[16:9];
		    write_to_host <= 1'b1;
		 end
		 3'b100://Block Command
         begin
            command_from_device <= uc_out_command;//uc_in_command;
            address_from_device <= UC_OUT[29:27];
            length_from_device <=  UC_OUT[25:18];
		    write_to_host <= 1'b1;
		 end
		 3'b101://Block Continuation Command
         begin
            command_from_device <= uc_out_command;//uc_in_command;
		    if(state[ASSERT_WR] & !store_payload_reg)
			begin
			   store_payload_reg <= 1'b1;
               payload_from_device <= UC_OUT[7:0];
		       write_to_host <= 1'b1;
			end
			else if(state[CHECK_TXE] & store_payload_reg)
			   store_payload_reg <= 1'b0;
		 end
		 default
         begin
		    write_to_host <= 1'b0;
		 end
	     endcase
/*	     if((UC_OUT[`UC_CMD_END:`UC_CMD_START] > 3'h0) & !write_to_host_reg)
		 begin
		     if(UC_OUT[`UC_CMD_END:`UC_CMD_START] != 3'h6)
                 write_to_host <= 1'b1;
             write_to_host_reg <= 1'b1;
             command_from_device <= UC_OUT[`UC_CMD_END:`UC_CMD_START];
             length_from_device <=  UC_OUT[`UC_LENGTH_END:`UC_LENGTH_START];
             address_from_device <= UC_OUT[`UC_ADDRESS_END:`UC_ADDRESS_START];
             payload_from_device <= UC_OUT[`UC_PAYLOAD_END:`UC_PAYLOAD_START];
		 end
         else if(state[WRITE_CONTROL_COMPLETE] & write_to_host_reg)
		 begin
             write_to_host <= 1'b0;
             write_to_host_reg <= 1'b0;
		 end
*/	end
  end
  
   //-----------------------------------------------
   // Command/Data To Host: 
   // Increment the byte_count 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
		if (!RST_N)
		begin
			byte_count <= 1'b0;
			byte_count_reg <= 1'b0;
		end
		else
		begin
			if ( state[DECODE_BYTE] & ( command_byte ) & ( byte_count == 0 ))
				byte_count <= 4'h2;
			else if(state[DECODE_BYTE] & !command_byte & !block_read_byte)
				byte_count <= byte_count + 1'd1;
			else if ((state[WAIT_FIFO_READY] & (byte_count >= 4'h3)) & block_read_byte & !byte_count_reg)
			begin
				byte_count <= byte_count + 1'd1;
				byte_count_reg <= 1'b1;
			end
			else if (state[READ_DATA_BYTE] & byte_count_reg)
			    byte_count_reg <= 1'b0;
			else if (( state[IDLE] & ( byte_count >= 4'h3 )))
				byte_count <= 4'h0;
		end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Command/Data To Host: 
   // This section allows the current value of the 
   // selected register to be transmitted to the 
   // the ft_245_state_machine.v.
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
   begin
	if (!RST_N)
	begin
		    write_control_mux_reg <= 1'b0;
			write_control_mux <= 0;
			WRITE_BYTE <= 0;
			write_data_byte <= 1'b1;
	end
	else
	begin
		if ((state[WRITE_CONTROL_BYTE] | state[WRITE_DATA_BYTE]) & !write_control_mux_reg )
		begin
		    write_control_mux_reg <= 1'b1;
			write_control_mux <= write_control_mux + 1'd1;
		end
		else if ((state[WRITE_CONTROL_COMPLETE] | state[WRITE_DATA_COMPLETE]) & write_control_mux_reg )
		begin
		    write_control_mux_reg <= 1'b0;
			if(write_control_mux > length_from_device + 8'h1)
			   write_control_mux <= 0;
		end
		else if ( state[IDLE] )
		begin
		    write_control_mux_reg <= 1'b0;
			write_control_mux <= 0;
		end
			
		case( write_control_mux )
			8'h01:
			begin
					WRITE_BYTE <= {2'b11,command_from_device,address_from_device};
					write_data_byte <= 1'b1;
			end
			8'h02:
			begin
			     if((command_from_device == `TRIGGER_OUT_CMD) |
				     (command_from_device == `TRANSFER_OUT_CMD))
				 begin
					     WRITE_BYTE <= payload_from_device;
					     write_data_byte <= 1'b0;
						 write_control_mux <= 0;
				 end
				 else
				 begin
					WRITE_BYTE <= length_from_device;
					write_data_byte <= 1'b1;
				 end
			end
			8'h03:
			begin
			   if(state[WRITE_DATA_COMPLETE])
					WRITE_BYTE <= payload_from_device;
			end
			default:	
			begin
			    if(state[WRITE_DATA_COMPLETE])
					WRITE_BYTE <= payload_from_device;
				if((write_control_mux - 8'h2) < length_from_device)
					write_data_byte <= 1'b1;
				else
					write_data_byte <= 1'b0;
			end
		endcase
		
	end 
     end 
 
   //-----------------------------------------------
   // USB Traffic To Host:
   // write_complete register will initiate the FT 245
   // to enter the write cycle mode. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
					write_complete_reg <= 0;
					write_complete <= 0;
					usb_txe_n_reg <= 0;
					USB_WR <= 1'b1;
	end
	else
	  begin
		if( state[ASSERT_WR] & !write_complete_reg )
		begin
			write_complete_reg <= 1'b1;
			write_complete <= 1'b0;
		end
		else if( state[ASSERT_WR] & write_complete_reg )
		begin
			USB_WR <= 1'b0;
			write_complete <= 1'b0;
			write_complete_reg <= 1'b1;
		end
		else if(state[DE_ASSERT_WR] & write_complete_reg )
		begin
				if( USB_TXE_N & !usb_txe_n_reg )
				begin
                    USB_WR <= 1'b1;	
					usb_txe_n_reg <= 1'b1;
					write_complete <= 1'b1;
				end
		end
		else if(state[WAIT_FOR_WR_COMPLETION] & write_complete_reg )
		begin
					write_complete_reg <= 1'b0;
					write_complete <= 1'b0;
					usb_txe_n_reg <= 1'b0;
					USB_WR <= 1'b1;
		end
		else if( state[IDLE] )
		begin
					write_complete_reg <= 1'b0;
					write_complete <= 1'b0;
					usb_txe_n_reg <= 1'b0;
					USB_WR <= 1'b1;
		end
	   end

     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // USB Traffic To Device: 
   // Store contents of USB_DATA_IN 
   // into USB_REGISTER_DECODE
   //-----------------------------------------------
/*   always @(state[ASSERT_RD_N] or RST_N)
   begin
	     if (!RST_N)
		     USB_REGISTER_DECODE = 0;
		 else if(state[ASSERT_RD_N])
		     USB_REGISTER_DECODE = USB_DATA_IN;
		 else
		     USB_REGISTER_DECODE = USB_REGISTER_DECODE;

   end
*/

   //-----------------------------------------------
   // USB Traffic To Device: 
   // Register the USB_RXF_N input
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
   begin
	if (!RST_N)
	begin
		usb_rxf_n_reg <= 1'b1;
	end
	else
	begin
		if(!USB_RXF_N)
		begin
			usb_rxf_n_reg <= 1'b0;
		end
		else 
		  usb_rxf_n_reg <= 1'b1;
	end
   end

   //-----------------------------------------------
   // USB Traffic To Device: 
   // Create read_complete read
   //-----------------------------------------------
/*   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
		read_complete <= 1'b0;
		read_complete_reg <= 1'b0;
		read_complete_cntr <= 0;
	end
	else
	  begin
		if( state[ASSERT_RD_N] & !read_complete_reg )
		begin
			read_complete_reg <= 1'b1;
			read_complete <= 1'b0;
		end
		else if( state[WAIT_FOR_RD_COMPLETION] & read_complete_reg )
		begin
			read_complete_reg <= 1'b1;
			read_complete_cntr <= read_complete_cntr + 1'd1;
			
				if ( read_complete_cntr <= 8'h0f )
				begin	
					read_complete_reg <= 1'b0;
					read_complete_cntr <= 0;
					read_complete <= 1'b1;
						
				end
		end
		else if( state[IDLE] )
		begin
					read_complete_reg <= 1'b0;
					read_complete_cntr <= 0;
					read_complete <= 1'b0;
		end
	   end

     end // always @ (posedge CLK or negedge RST_N)
*/
   //-----------------------------------------------
   // USB Traffic To Device: 
   // Create USB_RD_N output
   //-----------------------------------------------
    always @(state[ASSERT_RD_N] or state[DE_ASSERT_RD_N] or RST_N)
	begin
	     if (!RST_N)
		     USB_RD_N <= 1'b1;
		else if( state[ASSERT_RD_N] )
			USB_RD_N <= 1'b0;
		else if( state[DE_ASSERT_RD_N] )
			USB_RD_N <= 1'b1;
    end

   //-----------------------------------------------
   // Command/Data To Device: 
   // Store bd_inout into bd_inout_latch at state[ASSERT_RD_N]
   //
   //-----------------------------------------------
   always @(state[ASSERT_RD_N] or RST_N)
   begin
	if (!RST_N)
	begin
			bd_inout_latch <= 0;
	end
	else if ( state[ASSERT_RD_N] )
	begin
			bd_inout_latch <= bd_inout;
	end
	end


	//-----------------------------------------------
   // Command/Data To Device
   // Command Byte 
   //-----------------------------------------------
/*Turn this into a latched always statement*/
	//assign command_byte	=	((byte_count == 0) & (bd_inout[7:6] == 2'b10)) ? 1'b1 : 1'b0;
	always @(byte_count or bd_inout or RST_N)
	begin
	     if (!RST_N)
		     command_byte <= 1'b0;
		 else if((byte_count == 0) & (bd_inout[7:6] == 2'b10))
		    command_byte <= 1'b1;
	     else if(byte_count > 0)
		    command_byte <= 1'b0;
	   
	end

	//-----------------------------------------------
   // Command/Data to Device:
   // Reset UC_IN 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
   begin
		if (!RST_N)
		begin
			reset_uc_in <= 1'b0;
			reset_uc_in_reg <= 1'b0;
			reset_uc_in_counter <= 0;
		end
		else 
		begin
			if (state[READ_DATA_BYTE] & !reset_uc_in_reg)
			begin
			    reset_uc_in <= 1'b1;
			     reset_uc_in_reg <= 1'b1;
			end
			else if(reset_uc_in_reg)
			begin
				 if(reset_uc_in_counter < 4'h2)
				 begin
				     reset_uc_in_counter <= reset_uc_in_counter + 1'd1;
				 end
			     else 
			     begin
			         reset_uc_in <= 1'b0;
			         reset_uc_in_reg <= 1'b0;
					 reset_uc_in_counter <= 0;
			     end
		    end
		end
	end

   //-----------------------------------------------
   // Command/Data To Device: 
   // Store control_multiplexor at state[READ_CONTROL_BYTE]
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
   begin
	if (!RST_N)
	begin
			control_multiplexor <= 0;
	end
	else
	begin
		if ( state[READ_CONTROL_BYTE] )
			control_multiplexor <= bd_inout_latch;
		else
			control_multiplexor <= control_multiplexor;
			
	end
	end

   //-----------------------------------------------
   // Command/Data To Device: 
   // Transfer Busy Register
   //-----------------------------------------------
   always @(state[WRITE_CONTROL_BYTE] or state[IDLE])
   begin
       if(state[IDLE])
           transfer_busy = 1'b0;
	   else if(state[WRITE_CONTROL_BYTE])
	       transfer_busy = 1'b1;
   end


   //-----------------------------------------------
   // Command/Data to Device:
   // Command Register decode logic is based on command_to_device
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
   begin
	if (!RST_N)
	begin
	     uc_in_payload <= 0;
	     uc_in_command <= 0;
	     uc_in_address <= 0;
		 uc_in_length <= 0;
		 block_read_byte <= 1'b0;
		 length_to_device <= 0;
	end
	else 
	if ( state[READ_DATA_BYTE] )
	begin	
		case( command_to_device )
			`TRIGGER_IN_CMD:
			begin
			        uc_in_payload <= bd_inout_latch;
					uc_in_command <= command_to_device;
			end
			`TRANSFER_IN_CMD:
			begin
			        uc_in_payload <= bd_inout_latch;
					uc_in_address <= address_to_device;
					uc_in_command <= command_to_device;
			end
			`BLOCK_IN_CMD:
			begin 
			     case(byte_count)
				 //8'h0:
				 //8'h1:
				 8'h2:
				 begin
				   //uc_in_payload  <= bd_inout_latch;
					uc_in_address <= address_to_device;
					//uc_in_length  <= length_to_device;
					uc_in_command <= command_to_device;
				 end
				 8'h3:
				 begin
				    length_to_device <= bd_inout_latch;
					uc_in_address <= address_to_device;
					uc_in_command <= command_to_device;
					block_read_byte <= 1'b1;
				 end
				 8'h4:
				 begin
				    //length_to_device <= bd_inout;
			        uc_in_payload <= bd_inout_latch;
					uc_in_address <= address_to_device;
					//uc_in_length  <= bd_inout;
					uc_in_length  <= length_to_device;
					uc_in_command <= command_to_device;
					block_read_byte <= 1'b1;
				 end
				 default:
				 begin
			        uc_in_payload <= bd_inout_latch;
					uc_in_address <= address_to_device;
					uc_in_length  <= length_to_device;
					uc_in_command <= command_to_device;
				 end
				 endcase
			end
			default:	
			begin
	             uc_in_payload <= uc_in_payload;
	             uc_in_command <= uc_in_command;
	             uc_in_address <= uc_in_address;
		         uc_in_length  <= uc_in_length;
			end
		endcase
		end
		else if (state[IDLE])
		begin
			block_read_byte <= 1'b0;
		end
    end 


   //-----------------------------------------------
   // Finite  State Machine
   /* parameter 
                IDLE							= 0,
				ASSERT_RD_N	 					= 1,
				WAIT_FOR_RD_COMPLETION			= 2,
				WAIT_FOR_DE_ASSERT_RD_N			= 3,
				DE_ASSERT_RD_N					= 4,
				DECODE_BYTE                     = 5,
				READ_CONTROL_BYTE               = 6,
				READ_DATA_BYTE                  = 7,
				WAIT_FIFO_READY                 = 8,
				WRITE_CONTROL_BYTE              = 9,
                WRITE_CONTROL_COMPLETE          = 10,
                WRITE_DATA_BYTE                 = 11,
                WRITE_DATA_COMPLETE             = 12,
				CHECK_TXE						= 13,
				WAIT_FOR_WR_COMPLETION			= 14,
				DE_ASSERT_WR					= 15;
   */				
   //-----------------------------------------------
   // Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state <= 16'h000;
	     state[IDLE] <= 1'b1;
	  end
	else
	  state <= next;
     end

     // State Definitions
   always @ ( state or usb_rxf_n_reg  or write_to_host or command_byte or 
              byte_count or command_to_device or usb_txe_n_reg or read_complete or
		      USB_WR or write_control_mux or USB_TXE_N) 
     begin
	next = 16'h000;

	if (state[IDLE])
	  begin
	     if (!usb_rxf_n_reg )
	       next[ASSERT_RD_N] = 1'b1;
	     else if(write_to_host)
			next[WRITE_CONTROL_BYTE] = 1'b1;
	     else
	       next[IDLE] = 1'b1;
	  end

//USB Traffic to Device	  
	if (state[ASSERT_RD_N])
	begin
			next[WAIT_FOR_DE_ASSERT_RD_N] = 1'b1;
	end

	if (state[WAIT_FOR_DE_ASSERT_RD_N])
	begin 
	    if(usb_rxf_n_reg)
			next[DE_ASSERT_RD_N] = 1'b1;
		else 
			next[WAIT_FOR_DE_ASSERT_RD_N] = 1'b1;
	end

	if (state[DE_ASSERT_RD_N])
			next[DECODE_BYTE] = 1'b1;

//Command/Data to Device
	
	if (state[DECODE_BYTE])
	  begin
		if ( command_byte )
			next[READ_CONTROL_BYTE] = 1'b1;
		else if ( byte_count >= 4'h2)
			next[READ_DATA_BYTE] = 1'b1;
		else 
	       next[IDLE] = 1'b1;
	  end

	if (state[READ_CONTROL_BYTE])
	  begin
	       next[IDLE] = 1'b1;
	  end

	if (state[READ_DATA_BYTE])
	begin
       case(command_to_device)
          `TRIGGER_IN_CMD:
                 next[IDLE] = 1'b1;	
          `TRANSFER_IN_CMD:
                 next[IDLE] = 1'b1;	
          `BLOCK_IN_CMD:
                 next[WAIT_FIFO_READY] = 1'b1;	
          default:			 
			   next[IDLE] = 1'b1;	
       endcase
	end
	
	if (state[WAIT_FIFO_READY])
	begin
	     if(byte_count > (length_to_device + 8'h3))
			next[IDLE] = 1'b1;	
	     else 
		 begin
            if (!usb_rxf_n_reg )
			   next[ASSERT_RD_N] = 1'b1;
			else
			   next[WAIT_FIFO_READY] = 1'b1;
		 end
	end
			
//Command/Data to Host			
	if ( state[WRITE_CONTROL_BYTE] )
	begin
	       next[WRITE_CONTROL_COMPLETE] = 1'b1;
	end

	if ( state[WRITE_CONTROL_COMPLETE] )
	begin
           next[ASSERT_WR] = 1'b1;	
	end

	if ( state[WRITE_DATA_BYTE] )
	begin
	       next[WRITE_DATA_COMPLETE] = 1'b1;
	end

	if ( state[WRITE_DATA_COMPLETE] )
	begin
           next[ASSERT_WR] = 1'b1;	
	end

//USB Traffic to Host	
	if (state[ASSERT_WR])
	begin
	     if(!USB_WR)
			next[CHECK_TXE] = 1'b1;
		else
			next[ASSERT_WR] = 1'b1;
	end

	if (state[CHECK_TXE])
	begin
	     if(!USB_TXE_N)
			next[DE_ASSERT_WR] = 1'b1;
		else
			next[CHECK_TXE] = 1'b1;
	end

	if (state[DE_ASSERT_WR])
	begin
	     if(USB_WR)
			next[WAIT_FOR_WR_COMPLETION] = 1'b1;
		else
			next[DE_ASSERT_WR] = 1'b1;
	end

	if (state[WAIT_FOR_WR_COMPLETION])
	begin
		if (USB_TXE_N)
		begin
		    if(write_control_mux > 0)
			   next[WRITE_DATA_BYTE] = 1'b1;
			else
			   next[IDLE] = 1'b1;		  
		end
		else
			next[WAIT_FOR_WR_COMPLETION] = 1'b1;
	end


`ifdef SIM
 	   if ( state == ( 1 << IDLE ))
		   state_name = "IDLE";
	   else if ( state == ( 1 << ASSERT_RD_N ))
		   state_name = "ASSERT_RD_N";
	   else if ( state == ( 1 << WAIT_FOR_DE_ASSERT_RD_N ))
		   state_name = "WAIT_FOR_DE_ASSERT_RD_N";
	   else if ( state == ( 1 << DE_ASSERT_RD_N ))
		   state_name = "DE_ASSERT_RD_N";
	   else if ( state == ( 1 <<  DECODE_BYTE))
		   state_name = "DECODE_BYTE";
	   else if ( state == ( 1 <<  READ_CONTROL_BYTE))
		   state_name = "READ_CONTROL_BYTE";
	   else if ( state == ( 1 <<  READ_DATA_BYTE))
		   state_name = "READ_DATA_BYTE";
	   else if ( state == ( 1 <<  WAIT_FIFO_READY))
		   state_name = "WAIT_FIFO_READY";
	   else if ( state == ( 1 <<  WRITE_CONTROL_BYTE))
		   state_name = "WRITE_CONTROL_BYTE";
	   else if ( state == ( 1 <<  WRITE_CONTROL_COMPLETE))
		   state_name = "WRITE_CONTROL_COMPLETE";
	   else if ( state == ( 1 << WRITE_DATA_BYTE ))
		   state_name = "WRITE_DATA_BYTE";
	   else if ( state == ( 1 << WRITE_DATA_COMPLETE ))
		   state_name = "WRITE_DATA_COMPLETE";
	   else if ( state == ( 1 << ASSERT_WR ))
		   state_name = "ASSERT_WR";
	   else if ( state == ( 1 << CHECK_TXE ))
		   state_name = "CHECK_TXE";
	   else if ( state == ( 1 << WAIT_FOR_WR_COMPLETION ))
		   state_name = "WAIT_FOR_WR_COMPLETION";
	   else if ( state == ( 1 << DE_ASSERT_WR ))
		   state_name = "DE_ASSERT_WR";
`endif

	end//end of state machine


endmodule
