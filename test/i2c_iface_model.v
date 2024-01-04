//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2014
//#
//#
//# File Name:  i2c_iface_model.v
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

module i2c_iface_model
  (
	input	wire                CLK,
   	input	wire                RST_N,
	input	wire                CLK_100,
	input	wire                RST_N_100,

   	inout	wire                I2C_SDA,
   	output	wire                I2C_SCK,

	input	wire [7:0]			DIN,
	input   wire                WE_IN,
	output  reg                 RDY_IN,

  	output  wire [7:0]          DOUT,
   	output  reg                 WE_OUT_N,
	input   wire                RDY_OUT

   );


   //----------------------------------------------
   // Parameter Declarations
   //----------------------------------------------
   parameter 	IDLE						= 0,
                WAIT_FOR_START				= 1,
                CHECK_FOR_DATA              = 2,
                START_WRITE_BYTE			= 3,
                WRITE_BYTE                  = 4,
                DELAY_CHECK_BYTE_COUNT		= 5,
                CHECK_BYTE_COUNT			= 6,
                START_READ_BYTE             = 7,
                READ_BYTE					= 8,
                CHECK_RD_BYTE				= 9,
                READ_COMPLETE				= 10;
   
   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
   	reg	[11:0]                  state, next;
  
	//Clock Registers
	reg                         CLK_10;
	reg	[7:0]                   clock_10_count;


	//byte count registers
   	reg	[15:0]                  byte_count_read;


	//registers for the write and read fsm's
   	reg	[7:0]                   read_byte;
   	reg                         read_i2c_start, write_i2c_start;
	reg                         write_i2c_start_flag;
	reg [7:0]                   write_i2c_start_count;
	reg                         read_i2c_start_pulse;
	reg	[7:0]                   read_i2c_start_count;	
   	wire                        write_i2c_done, read_i2c_done;
   	wire                        write_i2c_sclk;
   	wire                        read_i2c_sclk;
   	wire	[7:0]               read_i2c_dout;
 
    //I2C Mode Registers
   	wire                        read_mode;
   	wire                        write_mode;
	
	//I2C Output registers
	wire                        i2c_write_sda;
   	wire	[7:0]               write_i2c_din;
	reg                         end_of_data_flag;
	reg                         end_read_data_flag;


	reg	[3:0]                   I2C_STATE;

	//Miscellaneous registers
	wire                        read_assert_data_out;

      
`ifdef SIM
   	reg [8*30:1] state_name;
`endif
   
   //------------------------------------------------
   // Signal Assignments  
   //------------------------------------------------
   
   assign 	I2C_SCK = read_mode ? read_i2c_sclk : write_i2c_sclk;

   assign   I2C_SDA = write_mode ? i2c_write_sda : 8'hz;

   assign 	write_mode = (state[WRITE_BYTE] || state[START_WRITE_BYTE]);
   assign 	read_mode = (state[READ_BYTE] || state[START_READ_BYTE]);
   assign 	write_i2c_din = DIN;
   assign	DOUT = read_i2c_done ? read_i2c_dout : DOUT;
   

   //-----------------------------------------------
   // Create a State Test Output Signal
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  I2C_STATE <= 0;
	else
	  begin
	     if (state[IDLE])
               I2C_STATE <= 4'h0;
	     if (state[WAIT_FOR_START])
	       I2C_STATE <= 4'h1;
	     if (state[CHECK_FOR_DATA])
	       I2C_STATE <= 4'h2;
	     if (state[START_WRITE_BYTE])
	       I2C_STATE <= 4'h3;
	     if (state[WRITE_BYTE])
	       I2C_STATE <= 4'h4;
	     if (state[CHECK_BYTE_COUNT])
	       I2C_STATE <= 4'h5;
	     if (state[START_READ_BYTE])
	       I2C_STATE <= 4'h6;
	     if (state[READ_BYTE])
	       I2C_STATE <= 4'h7;
	     if (state[CHECK_RD_BYTE])
	       I2C_STATE <= 4'h8;
	     if (state[DELAY_CHECK_BYTE_COUNT])
	       I2C_STATE <= 4'h9;
	     if (state[READ_COMPLETE])
	       I2C_STATE <= 4'ha;

		  
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // 20 Mhz clock creation. This will allow the  
   // i2c bus to run at 10 Mhz.
   //-----------------------------------------------
   always @(posedge CLK_100 or negedge RST_N_100)
     begin
	if (!RST_N_100)
	begin
	  		CLK_10 <= 0;
		  	clock_10_count <= 0;
	end
	else 
	  begin
	     if ( clock_10_count < 8'h19 )
		begin
	       	//CLK_10 <= 1;
		  	clock_10_count <= clock_10_count + 1;
		end
	     else 
		begin 
	  		CLK_10 <= ~CLK_10;
		  	clock_10_count <= 8'h0;
		end
	  end
	 end

   //-----------------------------------------------
   // RDY_IN signal to tell the FSM to
   // write both bytes of the input word
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  RDY_IN <= 0;
	else 
	  begin
	     if (state[START_WRITE_BYTE] )
	       RDY_IN <= 1;
	     else if ( state[CHECK_BYTE_COUNT] ) 
	       RDY_IN <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)   
 
   //------------------------------------------------
   // Generate the write_i2c_start Signal
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	     write_i2c_start <= 0;
		 write_i2c_start_flag <= 0;
		 write_i2c_start_count <= 0;
	end
	else
	  begin
	     if ( state[START_WRITE_BYTE] )
		 begin
	       write_i2c_start <= 1;
		   write_i2c_start_flag <= 1;
		 end
	     //else if ( state[WRITE_BYTE] & CLK_10 & !write_i2c_start_flag )
	     else if ( write_i2c_start_flag )
		 begin
		   if( write_i2c_start_count < 8'h10 )
		       write_i2c_start_count <= write_i2c_start_count + 1;
		   else
		   begin
	           write_i2c_start_flag <= 0;
	           write_i2c_start <= 0;
		       write_i2c_start_count <= 0;
		   end
		 end
	     else if ( state[CHECK_BYTE_COUNT] )
		 begin
		   write_i2c_start_flag <= 0;
		   write_i2c_start_count <= 0;
		 end
	  end
     end // always @ (posedge CLK or negedge RST_N)

	 
   //------------------------------------------------
   // Generate the end_of_data_flag Signal
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  end_of_data_flag <= 0;
	else
	  begin
	     if ( state[CHECK_BYTE_COUNT] )
	       end_of_data_flag <= 1;
	     else if ( !write_i2c_done )
	       end_of_data_flag <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)
	 
   //------------------------------------------------
   // Generate the read_i2c_start Signal
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	  			read_i2c_start <= 0;
	  			read_i2c_start_pulse <= 0;
				read_i2c_start_count <=  0;	
	end
	else
	  begin
	     if ( state[START_READ_BYTE] &&  !read_i2c_start_pulse )
		begin
	       		read_i2c_start <= 1;
		  		read_i2c_start_pulse <= 1;
		end
		else if ( read_i2c_start_pulse )
		begin
			if( read_i2c_start_count < 8'h10 )
				read_i2c_start_count <=  read_i2c_start_count + 1;
			else
			begin 
				read_i2c_start_count <=  0;	
	       		read_i2c_start <= 0;
		  		read_i2c_start_pulse <= 0;
			end
		end
	  end
     end // always @ (posedge CLK or negedge RST_N)   

   //-----------------------------------------------
   // Create a WE_OUT_N to tell the FSM to
   // read bytes of the input word
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  WE_OUT_N <= 1;
	else 
	  begin
	     if (state[CHECK_RD_BYTE] )
	       WE_OUT_N <= 0;
	     else if ( state[IDLE] ) 
	       WE_OUT_N <= 1;
	  end
     end // always @ (posedge CLK or negedge RST_N)   
 	 
 
   //------------------------------------------------
   // Generate the end_read_data_flag Signal
   //------------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  end_read_data_flag <= 0;
	else
	  begin
	     if ( RDY_OUT)
	       end_read_data_flag <= 1;
	     else
	       end_read_data_flag <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //--------------------------------------------------
   // Create a byte count
   //-------------------------------------------------- 
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
				byte_count_read <= 0;
	end
	else
	  begin
	     if ( state[CHECK_RD_BYTE] )
		begin
				byte_count_read <= byte_count_read + 1;
		end
		if( state[READ_COMPLETE] )
		begin
				byte_count_read <= 0;	
		end

	  end
     end // always @ (posedge CLK or negedge RST_N)

   //--------------------------------------------------
   // Create a read byte count
   //--------------------------------------------------  
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  read_byte <= 0;
	else
	  begin
	     if (read_i2c_done)
	       read_byte <= read_i2c_dout;
	     else 
	       read_byte <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //--------------------------------------------------
   // Write State Machine
   //--------------------------------------------------  
   // Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state <= 12'h000;
	     state[IDLE] <= 1'b1;
	  end
	else
	  state <= next;
     end


   always @ ( /*AUTOSENSE*/read_byte or write_i2c_start or read_i2c_start
	      or read_i2c_done or state or end_of_data_flag
	      or write_i2c_done or WE_IN or
		 RDY_OUT )

     begin
	next = 12'h000;

	if (state[IDLE])
	  begin
	     if ( WE_IN )
	       next[START_WRITE_BYTE] = 1'b1;
	     else if ( RDY_OUT )
	       next[START_READ_BYTE] = 1'b1;
		else
	       next[IDLE] = 1'b1;			
	  end

	if (state[START_WRITE_BYTE])
	  next[WRITE_BYTE] = 1'b1;

	if (state[WRITE_BYTE])
	  begin
		if ( write_i2c_done )
			next[CHECK_BYTE_COUNT] = 1'b1;
	     else	if( !write_i2c_done )
			next[WRITE_BYTE] = 1'b1;
	  end

	if (state[DELAY_CHECK_BYTE_COUNT])
		    next[CHECK_BYTE_COUNT] = 1'b1;

	if (state[CHECK_BYTE_COUNT])
	  begin
		//if ( end_of_data_flag )
		if ( !write_i2c_done )
		    next[IDLE] = 1'b1;
	     else 
	       	next[CHECK_BYTE_COUNT] = 1'b1;
	  end


	if (state[START_READ_BYTE])
	  next[READ_BYTE] = 1'b1;

	if (state[READ_BYTE])
	  begin
	     if (read_i2c_done)
	       next[CHECK_RD_BYTE] = 1'b1;
	     else
	       next[READ_BYTE] = 1'b1;
	  end

	if (state[CHECK_RD_BYTE])
	  begin
	  	if( end_read_data_flag )
			next[READ_COMPLETE] = 1'b1;
		else
			next[CHECK_RD_BYTE] = 1'b1;			
	  end 

	if (state[READ_COMPLETE])
	begin
	  	if( !RDY_OUT )
		   next[IDLE] = 1'b1;
		else
			next[READ_COMPLETE] = 1'b1;			
	end

	
`ifdef SIM
	if (state == (1 << IDLE))
	  state_name = "IDLE";
	else if (state == (1 << WAIT_FOR_START))
	  state_name = "WAIT_FOR_START";
	else if (state == (1 << CHECK_FOR_DATA))
	  state_name = "CHECK_FOR_DATA";
	else if (state == (1 << START_WRITE_BYTE))
	  state_name = "START_WRITE_BYTE";
	else if (state == (1 << WRITE_BYTE))
	  state_name = "WRITE_BYTE";
	else if (state == (1 << DELAY_CHECK_BYTE_COUNT))
	  state_name = "DELAY_CHECK_BYTE_COUNT";
	else if (state == (1 << CHECK_BYTE_COUNT))
	  state_name = "CHECK_BYTE_COUNT";
	else if (state == (1 << START_READ_BYTE))
	  state_name = "START_READ_BYTE";
	else if (state == (1 << READ_BYTE))
	  state_name = "READ_BYTE";
	else if (state == (1 << CHECK_RD_BYTE))
	  state_name = "CHECK_RD_BYTE";
	else if (state == (1 << READ_COMPLETE))
	  state_name = "READ_COMPLETE";

	  
`endif
     end // always @ (...

   //----------------------------------------------
   // Instantiate the Leaf FSM Modules
   //----------------------------------------------
   write_i2c_model            WRITE_I2C_INST
     (
      .CLK                    (CLK_10), 
      .RST_N                  (RST_N),
      
      .START                  (write_i2c_start),
      .DONE                   (write_i2c_done),
      
      .DIN                    (write_i2c_din),
      .DATA_OUT               (i2c_write_sda), //I2C_SDA is an output from testboard_audio_avi_test_top.v
      .SCLK                   (write_i2c_sclk),

	 .PERFORM_READ			(read_assert_data_out)
      );

   read_i2c_model             READ_I2C_INST
     (
      .CLK                    (CLK_10), 
      .RST_N                  (RST_N),
      
      .START                  (read_i2c_start),
      .DONE                   (read_i2c_done),
      
      .DOUT                   (read_i2c_dout),
      .DATA_IN                (I2C_SDA), //I2C_SDA is an input from testboard_audio_avi_test_top.v
      .SCLK                   (read_i2c_sclk),

	 .PERFORM_READ			(read_assert_data_out)

      );
    
	
  
endmodule // audio_i2c_fsm

   