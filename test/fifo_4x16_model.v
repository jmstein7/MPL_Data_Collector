//================================================================
//
//	Smartronix Proprietary Information
//
//
//	File Name:	fifo_4x16_model.v
//	Author:	R. Jolly
//	Date:		October 17, 2008
//	Revision:	A
//
//
//	Development:	Environment Control Module UAV
//	Application:	Altera Stratix II
//	Description:	This file contains Verilog code that implements a 4 by 16 FIFO.
//				This code is used in the simulation only. It should be replaced by
//				an Altera generated FIFO for synthesis/ 
//
//
//
//
//	Revision History:
//
//	DATE		VERSION		DETAILS
//	10/17/08		A		Created by R Jolly
//
//
//
//
//
//
//
//
//
//
//
//==================================================================

module fifo_4x16_model(
		DIN,

		WR_EN,
		WR_CLK,

		RD_EN,
		RD_CLK,

		AINIT,
		DOUT,
		FULL,
		EMPTY,

		WR_ERR

		);


//==================================================================
// IO Port Declarations
//==================================================================
	input		[15:0]			DIN;

	input						WR_EN;
	input						WR_CLK;

	input						RD_EN;
	input						RD_CLK;

	input						AINIT;
	output	[15:0]			DOUT;
	output					FULL;
	output						EMPTY;

	output					WR_ERR;


//==================================================================
// Register Declarations
//==================================================================
	wire	[15:0]				DOUT;
	wire						FULL;
	wire						EMPTY;

  
  
	// Receive FIFO Storage
	reg	[15:0]				storage_fifo_0;
	reg	[15:0]				storage_fifo_1;
      reg	[15:0]				storage_fifo_2;
      reg	[15:0]				storage_fifo_3;
      reg	[15:0]				storage_fifo_4;
      reg						fifo_has_byte_0;
      reg						fifo_has_byte_1;
      reg						fifo_has_byte_2;
      reg						fifo_has_byte_3;
      reg						fifo_has_byte_4;
	reg						fifo_is_empty;
	reg						fifo_is_full;
      reg						fifo_clear_flag_0;
      reg						fifo_clear_flag_1;
      reg						fifo_clear_flag_2;
      reg						fifo_clear_flag_3;
      reg						fifo_clear_flag_4;
      wire						reset;
      reg	[15:0]				dout_buffer;
      reg	[15:0]				fifo_write_counter;
      reg	[15:0]				fifo_read_counter;

	// write enable registers
	reg						write_enable;
	reg						write_enable_reg;

	// read enable registers
	reg						read_enable;
	reg						read_enable_reg;

	

//=================================================================================
// Assignments	
//=================================================================================

	assign	reset = AINIT;
	assign	FULL = fifo_is_full;
	assign	EMPTY = fifo_is_empty;
	assign	DOUT = dout_buffer;


//=================================================================================
//  write_enable registers
//=================================================================================

	always @( posedge WR_CLK or negedge reset )
	begin
		if ( !reset )
		begin
			write_enable <= 1'b0;
			write_enable_reg <= 1'b0;
    		end
  		else
    		begin
        		if ( WR_EN & !write_enable_reg )
			begin
				write_enable <= 1'b1;
				write_enable_reg <= 1'b1;
			end
			else if ( WR_EN & write_enable_reg )
			begin
				write_enable <= 1'b0;
				write_enable_reg <= 1'b1;
			end
			else if ( !WR_EN & write_enable_reg )
			begin
				write_enable <= 1'b0;
				write_enable_reg <= 1'b0;
			end
		end
	end

//=================================================================================
//  read_enable registers
//=================================================================================

	always @( posedge RD_CLK or negedge reset )
	begin
		if ( !reset )
		begin
			read_enable <= 1'b0;
			read_enable_reg <= 1'b0;
    		end
  		else
    		begin
        		if ( RD_EN & !read_enable_reg )
			begin
				read_enable <= 1'b1;
				read_enable_reg <= 1'b1;
			end
			else if ( RD_EN & read_enable_reg )
			begin
				read_enable <= 1'b0;
				read_enable_reg <= 1'b1;
			end
			else if ( !RD_EN & read_enable_reg )
			begin
				read_enable <= 1'b0;
				read_enable_reg <= 1'b0;
			end
		end
	end


//=================================================================================
//  FIFO Write Section
//=================================================================================

	always @( posedge WR_CLK or negedge reset )
	begin
		if ( !reset )
		begin
				storage_fifo_0 <= 16'h0;
				storage_fifo_1 <= 16'h0;
      			storage_fifo_2 <= 16'h0;
      			storage_fifo_3 <= 16'h0;
      			storage_fifo_4 <= 16'h0;
      			fifo_has_byte_0 <= 1'b0;
      			fifo_has_byte_1 <= 1'b0;
      			fifo_has_byte_2 <= 1'b0;
      			fifo_has_byte_3 <= 1'b0;
     				fifo_has_byte_4 <= 1'b0;
				fifo_is_empty <= 1'b0;
				fifo_is_full <= 1'b0;
   				fifo_write_counter <= 16'h0;
    		end
  		else
    		begin
        		if ( write_enable )
			begin

				case( fifo_write_counter )
				16'h0:	
				begin
					storage_fifo_0 <= DIN;
					fifo_has_byte_0 <= 1'b1;
					fifo_write_counter <= fifo_write_counter + 1;
				end
				16'h1:	
				begin
					storage_fifo_1 <= DIN;
					fifo_has_byte_1 <= 1'b1;
					fifo_write_counter <= fifo_write_counter + 1;
				end
				16'h2:	
				begin
					storage_fifo_2 <= DIN;
					fifo_has_byte_2 <= 1'b1;
					fifo_write_counter <= fifo_write_counter + 1;
				end
 				16'h3:	
				begin
					storage_fifo_3 <= DIN;
					fifo_has_byte_3 <= 1'b1;
					fifo_write_counter <= fifo_write_counter + 1;
				end
				16'h4:	
				begin
					storage_fifo_4 <= DIN;
					fifo_has_byte_4 <= 1'b1;
					fifo_write_counter <= fifo_write_counter + 1;
				end
				default:
					fifo_write_counter <= 16'h0;
				endcase
    			end

			if( !fifo_clear_flag_0 )
				fifo_has_byte_0 <= 1'b0;

			if( !fifo_clear_flag_1 )
				fifo_has_byte_1 <= 1'b0;

 			if( !fifo_clear_flag_2 )
				fifo_has_byte_2 <= 1'b0;

			if( !fifo_clear_flag_3 )
				fifo_has_byte_3 <= 1'b0;

			if( !fifo_clear_flag_4 )
				fifo_has_byte_4 <= 1'b0;

			if( ( fifo_has_byte_0 | fifo_has_byte_1 | fifo_has_byte_2 | fifo_has_byte_3 | fifo_has_byte_4 ))
			begin
				fifo_is_empty <= 1'b1;
			end  
			else
				fifo_is_empty <= 1'b0;

			if ( ( fifo_has_byte_0 & fifo_has_byte_1 & fifo_has_byte_2 & fifo_has_byte_3 & fifo_has_byte_4 ) )
				fifo_is_full <= 1'b1;
			else 
				fifo_is_full <= 1'b1;

			if ( fifo_write_counter >= 8'h05 )
				fifo_write_counter <= 8'h00;
 
		end
 	end
//=================================================================================
//	Read Section
//=================================================================================


	always @( posedge RD_CLK or negedge reset )
	begin
		if ( !reset )
		begin
			fifo_clear_flag_0 <= 1'b1;			
			fifo_clear_flag_1 <= 1'b1;
			fifo_clear_flag_2 <= 1'b1;			
			fifo_clear_flag_3 <= 1'b1;
			fifo_clear_flag_4 <= 1'b1;
			dout_buffer <= 16'h0;
			fifo_read_counter <= 16'h0;			
		end

		else
		begin
			if( read_enable& fifo_is_empty)
			begin
		

				case ( fifo_read_counter )
				16'h0:
				begin
					dout_buffer <= storage_fifo_0;
					fifo_clear_flag_0 <= 1'b0;
					fifo_read_counter <= fifo_read_counter + 1;
				end
				16'h1:
				begin
					dout_buffer <= storage_fifo_1;
					fifo_clear_flag_1 <= 1'b0;
					fifo_read_counter <= fifo_read_counter + 1;
				end
				16'h2:
				begin
					dout_buffer <= storage_fifo_2;
					fifo_clear_flag_2 <= 1'b0;
					fifo_read_counter <= fifo_read_counter + 1;
				end
				16'h3:
				begin
					dout_buffer <= storage_fifo_3;
					fifo_clear_flag_3 <= 1'b0;
					fifo_read_counter <= fifo_read_counter + 1;
				end
				16'h4:
				begin
					dout_buffer <= storage_fifo_4;
					fifo_clear_flag_4 <= 1'b0;
					fifo_read_counter <= fifo_read_counter + 1;
				end
				default:
				begin
					dout_buffer <= dout_buffer;
					fifo_read_counter <= 16'h0;
				end
				endcase
			end
			else if ( !RD_EN )
			begin
				fifo_clear_flag_0 <= 1'b1;			
				fifo_clear_flag_1 <= 1'b1;
				fifo_clear_flag_2 <= 1'b1;			
				fifo_clear_flag_3 <= 1'b1;
				fifo_clear_flag_4 <= 1'b1;
			end

			if ( fifo_read_counter >= 8'h05 )
				fifo_read_counter <= 8'h00;

		end
end



endmodule

