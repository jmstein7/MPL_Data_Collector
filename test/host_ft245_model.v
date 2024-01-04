//******************************************************
//* $Workfile::                                       
//	File name:	host_ft245_model.v
//	Author:		Richard Jolly
//	Date:		3/04/2008
//
//	Copyright 	Smartronix Inc. 2008
//
//
//******************************************************/

`timescale 1ns/1ps

module host_ft245_model
  (
   	CLK,
   	RST_N,

	HOST_FT245_RXF_N,
	HOST_FT245_TXE_N,
	HOST_FT245_RD_N,
	HOST_FT245_WR,
	HOST_FT245_RESET_N,
	HOST_FT245_PWREN_N,
	HOST_FT245_TEST,
	HOST_FT245_DATA,

  

	DATA_IN,
	DATA_OUT,
	READ_FT_245,
	WRITE_FT_245,
	READ_FT_STATUS

   

   );



   //----------------------------------------------
   // Parameter Declarations                        
   //----------------------------------------------
   parameter 	IDLE                     = 0,
			READ_CYCLE_START             = 1,
			READ_CYCLE_COMPLETE          = 2,
			WRITE_CYCLE_START            = 3,
			WRITE_CYCLE_COMPLETE         = 4,
			READ_STATUS_BYTE             = 5;

   
   //--------------------------------------------------
   // IO Port Declarations                           
   //--------------------------------------------------   
	input 					CLK, RST_N;


  
	output                     HOST_FT245_RXF_N;
	output                     HOST_FT245_TXE_N;
	input                      HOST_FT245_RD_N;
	input                      HOST_FT245_WR;
	input                      HOST_FT245_RESET_N;
	output                     HOST_FT245_PWREN_N;
	input	wire               HOST_FT245_TEST;
	inout	[7:0]              HOST_FT245_DATA;

  

	input	[7:0]              DATA_IN;
	output	[7:0]              DATA_OUT;
	input	wire               READ_FT_245;
	input	wire               WRITE_FT_245;
	input	wire               READ_FT_STATUS;
 

  
   //------------------------------------------------
   // Wire and Register Declarations                
   //------------------------------------------------
	wire                       HOST_FT245_RXF_N;
	wire                       HOST_FT245_TXE_N;
	wire                       HOST_FT245_PWREN_N;

	wire	[7:0]              HOST_FT245_DATA;

	wire	[7:0]              DATA_OUT;

	//state registers
	reg	[7:0]					state, next;

	//Read Cycle registers
	reg                        start_read_cycle;
	reg                        start_read_cycle_reg;
	reg                        read_cycle_reg;
	reg                        read_cycle_meta_reg;
	wire                       read_cycle_rdy;
	wire                       read_cycle_complete;

	//Model Write Cycle registers
	reg                        write_cycle_reg;
	reg                        write_cycle_meta_reg;
	reg                        start_write_cycle;
	wire                       host_model_write_cycle_complete;
	reg	[7:0]                  write_cycle_hold_byte;
	wire [7:0]                 write_transmit_byte;

	//Data hold registers
	wire [7:0]                 model_read_host_data_byte;
	wire  [7:0]                transmit_byte_storage;

	//Read status registers
	reg                        read_ft_status_reg;
	reg	[7:0]                  ft_status_byte;
	integer                    read_ft_status_cntr;
	reg                        host_byte_available;

	//Read Fifo registers
   reg [7:0]                             state_read_fifo, next_read_fifo;
   reg                                   fifo_wren;
   wire                                  fifo_rden;
   wire [7:0]                            fifo_dout;
   wire                                  fifo_full, fifo_empty;
   wire                                  fifo_afull, fifo_aempty;
   wire [2:0]                            data_count;
   wire                                  flush;
   reg                                   read_fifo_valid;
   reg                                   write_cycle_complete_reg;

	//Test
	wire	[7:0]              temp_byte;




   
`ifdef SIM
   reg [8*26:1] state_name;
`endif

   //------------------------------------------------
   // Signal Assignments  
   //------------------------------------------------

	assign	HOST_FT245_DATA = read_cycle_rdy ? model_read_host_data_byte : 8'hzz;
	assign	HOST_FT245_PWREN_N = 1'b1;

	assign	temp_byte = HOST_FT245_DATA;
	assign  DATA_OUT = state[READ_STATUS_BYTE] ? ft_status_byte : transmit_byte_storage;
	assign  transmit_byte_storage = state[WRITE_CYCLE_COMPLETE] ? fifo_dout : transmit_byte_storage;
    assign  fifo_rden = state[WRITE_CYCLE_START] ? 1'b1 : 1'b0;

   //-----------------------------------------------
   // FIFO write enable. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	fifo_wren <= 1'b0;
		write_cycle_complete_reg <= 1'b0;
	end
	else
	begin
		 fifo_wren <= 1'b0;
	     if(host_model_write_cycle_complete & !write_cycle_complete_reg )
		 begin
		     fifo_wren <= 1'b1;
		     write_cycle_complete_reg <= 1'b1;
		 end
		 //else if(fifo_wren)
		 //else if(write_cycle_complete_reg )
		 //else if(host_model_write_cycle_complete & write_cycle_complete_reg )
		 //    fifo_wren <= 1'b0;
		 else if(!host_model_write_cycle_complete & write_cycle_complete_reg )
		     write_cycle_complete_reg <= 1'b0;
	 end
     end // always @ (posedge CLK or negedge RST_N)


   //-----------------------------------------------
   // READ_FT_STATUS register. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	ft_status_byte <= 0;
		read_ft_status_cntr <= 0;
	end
	else
	  begin
		if ( state[READ_STATUS_BYTE] )
		begin
			ft_status_byte <= 	{1'b0,HOST_FT245_RXF_N, HOST_FT245_TXE_N,
	                                 HOST_FT245_RD_N, HOST_FT245_WR, HOST_FT245_RESET_N, 
									 HOST_FT245_PWREN_N, host_byte_available};
			if(read_ft_status_cntr < 8'h10)
			     read_ft_status_cntr <= read_ft_status_cntr + 1;
		end
		else 
		begin
	       		ft_status_byte <= 0;
				read_ft_status_cntr <= 0;
		end
	  end
     end // always @ (posedge CLK or negedge RST_N)

	 
   //-----------------------------------------------
   // host_byte_available register provides a bit in the
   // status register to show that the FT245 chip has 
   // received a byte and is available for read. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	host_byte_available <= 1'b0;
	end
	else
	  begin
		if ( host_model_write_cycle_complete )
			host_byte_available <= 1'b1;
		else  if (state[WRITE_CYCLE_COMPLETE])
		begin
	       		host_byte_available <= 1'b0;
		end
	  end
     end // always @ (posedge CLK or negedge RST_N)

	 
   //-----------------------------------------------
   // Read the status of the FT245 chip and write it
   // to the host output   register. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	read_ft_status_reg <= 1'b0;
	end
	else
	  begin
		if ( READ_FT_STATUS )
			read_ft_status_reg <= 1'b1;
		else 
		begin
	       		read_ft_status_reg <= 1'b0;
		end
	  end
     end // always @ (posedge CLK or negedge RST_N)

	 //-----------------------------------------------
   // Create a write_cycle_hold_byte register. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	write_cycle_hold_byte <= 8'h88;
	end
	else
	  begin
		if ( start_write_cycle )
			write_cycle_hold_byte <= temp_byte;
		else 
		begin
	       		write_cycle_hold_byte <= write_cycle_hold_byte;
		end
	  end
     end // always @ (posedge CLK or negedge RST_N)


   //-----------------------------------------------
   // Create a start read cycle signal. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	read_cycle_reg <= 0;
		read_cycle_meta_reg <= 0;
	end
	else
	  begin
		if ( READ_FT_245 )
			read_cycle_meta_reg <= 1;
		//else if ( read_cycle_meta_reg && state[READ_CYCLE_START] )
		//	read_cycle_reg <= 1;
		//else if ( read_cycle_complete || host_model_write_cycle_complete )
		//begin
	    //  read_cycle_reg <= 0;
		else
			read_cycle_meta_reg <= 0;
		//end
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Create a start_read_cycle signal. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	start_read_cycle <= 1'b0;
	 	start_read_cycle_reg <= 1'b0;
	end
	else
	  begin
		if ( state[READ_CYCLE_START] & !start_read_cycle_reg)
		begin
			 start_read_cycle <= 1'b1;
	 	     start_read_cycle_reg <= 1'b1;
		end
		else if ( state[READ_CYCLE_START] & start_read_cycle_reg)
		begin
			 start_read_cycle <= 1'b0;
	 	     start_read_cycle_reg <= 1'b1;
		end
		else if ( state[READ_CYCLE_COMPLETE] & start_read_cycle_reg)
		begin
			 start_read_cycle <= 1'b0;
	 	     start_read_cycle_reg <= 1'b0;
		end
	  end
     end // always @ (posedge CLK or negedge RST_N)


   //-----------------------------------------------
   // Create a write_cycle signal. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	write_cycle_reg <= 0;
		write_cycle_meta_reg <= 0;
	end
	else
	  begin
		if ( WRITE_FT_245 )
	       		write_cycle_meta_reg <= 1;
		else if ( write_cycle_meta_reg && state[WRITE_CYCLE_START] )
			write_cycle_reg <= 1;
		else if ( !WRITE_FT_245 && state[WRITE_CYCLE_COMPLETE]  )
		begin
			write_cycle_reg <= 0;
	       		write_cycle_meta_reg <= 0;
		end
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Create a start_write_cycle signal. 
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	begin
	 	start_write_cycle <= 0;
	end
	else
	  begin
		if ( state[WRITE_CYCLE_START] )
			start_write_cycle <= 1;
		else 
			start_write_cycle <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)




 
	  
   //--------------------------------------------------
   // Host Bus State Machine
   //--------------------------------------------------  
   // Next State Logic
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  begin
	     state <= 12'h00;
	     state[IDLE] <= 1'b1;
	  end
	else
	  state <= next;
     end

   always @ ( /*AUTOSENSE*/state or read_cycle_complete or
		host_model_write_cycle_complete or read_cycle_reg or 
		write_cycle_reg or write_cycle_meta_reg or read_ft_status_reg or
		read_cycle_meta_reg or read_ft_status_cntr)
     begin
	next = 8'h00;

	if (state[IDLE])
	begin
		if( read_cycle_meta_reg )
	  		next[READ_CYCLE_START] = 1'b1;
		else if( write_cycle_meta_reg )
	  		next[WRITE_CYCLE_START] = 1'b1;
		else if(read_ft_status_reg)
	  		next[READ_STATUS_BYTE] = 1'b1;
		else
			next[IDLE] = 1'b1;
	end

	if (state[READ_CYCLE_START])
	begin
		if( read_cycle_complete )
	  		next[READ_CYCLE_COMPLETE] = 1'b1; 
		else
	  		next[READ_CYCLE_START] = 1'b1; 
	end

	if (state[READ_CYCLE_COMPLETE])
	begin
		if( !read_cycle_meta_reg )
	  		next[IDLE] = 1'b1; 
		else
	  		next[READ_CYCLE_COMPLETE] = 1'b1; 
	end

	if (state[WRITE_CYCLE_START])
	  		next[WRITE_CYCLE_COMPLETE] = 1'b1; 

	if (state[WRITE_CYCLE_COMPLETE])
	begin
		if( !write_cycle_meta_reg )
	  		next[IDLE] = 1'b1; 
		else
	  		next[WRITE_CYCLE_COMPLETE] = 1'b1; 
	end

	if (state[READ_STATUS_BYTE])
	begin
		if( read_ft_status_cntr >= 8'h0f )
	  		next[IDLE] = 1'b1; 
		else
	  		next[READ_STATUS_BYTE] = 1'b1; 
	end


	
`ifdef SIM
	if (state == (1 << IDLE))
	  state_name = "IDLE";
	else if (state == (1 << READ_CYCLE_START))
	  state_name = "READ_CYCLE_START";
	else if (state == (1 << READ_CYCLE_COMPLETE))
	  state_name = "READ_CYCLE_COMPLETE";
	else if (state == (1 << WRITE_CYCLE_START))
	  state_name = "WRITE_CYCLE_START";
	else if (state == (1 << WRITE_CYCLE_COMPLETE))
	  state_name = "WRITE_CYCLE_COMPLETE";
	else if (state == (1 << READ_STATUS_BYTE))
	  state_name = "READ_STATUS_BYTE";
`endif
     end // always @ (...





   //-----------------------------------------------
   // Instantiate Host Bus Model Read
   //-----------------------------------------------
   host_ft245_model_read HOST_READ
	(
	.CLK                                 (CLK),
    .RST_N                               (RST_N),
      

	.HOST_FT245_RXF_N                    (HOST_FT245_RXF_N),
	.HOST_FT245_RD_N                     (HOST_FT245_RD_N),
	.HOST_FT245_READ_BYTE                (model_read_host_data_byte),

	.TRANSMIT_BYTE                       (DATA_IN),
	.START_READ_CYCLE                    (start_read_cycle),
	.READ_CYCLE_RDY                      (read_cycle_rdy),
	.READ_CYCLE_COMPLETE                 (read_cycle_complete)

	);



   //-----------------------------------------------
   // Instantiate Host Bus Model Write
   //-----------------------------------------------
   host_ft245_model_write HOST_WRITE
	(
    .CLK                    			(CLK),
    .RST_N                    			(RST_N),
      
	
	.HOST_FT245_TXE_N					(HOST_FT245_TXE_N),
	.HOST_FT245_WR					(HOST_FT245_WR),
	.HOST_FT245_WRITE_BYTE				(HOST_FT245_DATA ),

	.TRANSMIT_BYTE					(write_transmit_byte),
	.START_WRITE_CYCLE				(start_write_cycle),
	.WRITE_CYCLE_COMPLETE				(host_model_write_cycle_complete)


	);

   //-----------------------------------------------
   // Sync FIFO to store bytes from the Device
   //-----------------------------------------------
  sync_fifo #(
      .ADDR_WIDTH               (10),
	  .DATA_WIDTH               (8),
	  .DEPTH                    (1024),
	  .AEMPTY                   (10),
	  .AFULL                    (1000)
	  ) FIFO
     (
	  .clk                     (CLK),
	  .reset_n                 (RST_N),
	  .flush                   (1'b0),
	  .write_data              (write_transmit_byte),	  
	  .read_req                (fifo_rden),
	  .wdata_valid             (fifo_wren),
	  .read_data               (fifo_dout),
	  .rdata_valid             (),
	  .fifo_empty              (fifo_empty),
	  .fifo_aempty             (fifo_aempty),
	  .fifo_full               (fifo_full),
	  .fifo_afull              (fifo_afull),
	  .write_ack               ()
      );


   

endmodule // 

