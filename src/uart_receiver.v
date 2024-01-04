/*****************************************************
 * Workfile:: rcvr_mod.v
 * Author: MCorbett 
 * Date: 3/1/2006
 *
 * Copyright Commonwealth Technology, Inc. 2006
 *
******************************************************/

module uart_receiver
  (
   CLK,
   RST_N,
   DOUT,
   DATA_READY,
   RXD,
   CLK16X,
   RDN
   );
   
   //--------------------------------------------------
   // IO Port Declarations                           
   //--------------------------------------------------
   input CLK, RST_N;
   input RXD;
   input CLK16X;
   input RDN;
   output [7:0] DOUT;
   output 	DATA_READY;
   
   //-----------------------------------------------
   // Wire and Register Declarations              
   //-----------------------------------------------
   reg 		clk16x_reg;   
   reg [3:0] 	clk16_count;
   reg 		serial_clk;
   reg [3:0] 	bit_count;
   reg [7:0] 	dout_reg, shift_reg;
   reg 		serial_clk_enable;
   reg 		sample_clk;
   reg 		DATA_READY;
   reg 		rxd_reg;
   reg 		start_bit;   
   wire 	clk16x_posedge;
   wire 	rxd_negedge;
   
   //-----------------------------------------------
   // Signal Assignments
   //----------------------------------------------
   assign 	DOUT = dout_reg;
   assign 	clk16x_posedge = CLK16X && !clk16x_reg;
   assign 	rxd_negedge = !RXD && rxd_reg;
   // DEBUG Signals
   //assign 	SAMPLE_CLK_OUT = sample_clk;
   //assign 	START_BIT_OUT = start_bit;
   
   //-----------------------------------------------
   // Generate Start Bit
   //-----------------------------------------------
   
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  start_bit <= 0;
	else 
	  begin
	     if (rxd_negedge && (bit_count == 4'h0))
	       start_bit <= 1;
	     else if (bit_count > 4'h0)
	       start_bit <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)
   
   
   //-----------------------------------------------
   // Create a registered version of rxd
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  rxd_reg <= 0;
	else
	  rxd_reg <= RXD;
     end
	
   //-----------------------------------------------
   // Create a clk enable signal only active when
   // sending out bits
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  serial_clk_enable <= 0;
	else
	  begin
	     // If in the middle of the start bit and rxd is still low
	     // a Start Bit was detected
	     if (!RXD && (clk16_count == 4'h7) && (bit_count == 4'h0))
	       serial_clk_enable <= 1;
	     else if (bit_count >= 4'hA)
	     //else if (bit_count >= 4'h9)
	       serial_clk_enable <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Create a bit counter for the serial output
   //-----------------------------------------------      
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  bit_count <= 0;
	else 
	  begin
	     if (serial_clk_enable)
	       begin
		  if (serial_clk)
		    bit_count <= bit_count + 1;
	       end
	     else
	       bit_count <= 0;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Create a Serial Clock at the specific baud rate
   //-----------------------------------------------      
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  serial_clk <= 0;
	else if (serial_clk_enable && clk16x_posedge && (clk16_count == 4'ha))
	  serial_clk <= 1;
	else
	  serial_clk <= 0;
     end
   
   //-----------------------------------------------
   // Create DATA_READY to signal when 1 byte has been received
   //-----------------------------------------------   
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  DATA_READY <= 1'b0 ;
	else 
	  begin
	     if (!RDN)
	       DATA_READY <= 1'b0 ;
	     // Only Signal Data Ready if STOP bit is found
	     else if ((bit_count == 4'h9) && sample_clk && RXD)
	       DATA_READY <= 1'b1 ;
	  end // else: !if(!RST_N)
     end // always @ (posedge CLK or negedge RST_N)
   
  //-----------------------------------------------
   // Create registers to receive serial data
   //-----------------------------------------------   
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  shift_reg <= 8'h00 ;	
	else if (sample_clk && serial_clk_enable)
	  begin
	     case (bit_count)
	       4'h0: 
		 shift_reg <= 8'h00;
	       4'h1 , 4'h2, 4'h3, 4'h4, 4'h5, 4'h6, 4'h7, 4'h8:
		 begin
		    shift_reg[7] <= RXD;
		    shift_reg[6:0] <= shift_reg[7:1];
		 end
	       4'h9:
		 shift_reg <= 8'h00;
	     endcase // case(bit_count)
	  end // if (sample_clk)
     end // always @ (posedge CLK or negedge RST_N)
   
   //-----------------------------------------------
   // Create an output register     
   //-----------------------------------------------   
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  dout_reg <= 0;
	else if ((bit_count == 4'h8) && serial_clk)
	  dout_reg <= shift_reg;
     end
  
   //-----------------------------------------------
   // Create a 16x Clock Counter
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  clk16_count <= 0;
	else
	  begin
	     if (rxd_negedge && (bit_count == 4'h0))
	       clk16_count <= 0;
	     else if (clk16x_posedge)
	       clk16_count <= clk16_count + 1;
	  end
     end // always @ (posedge CLK or negedge RST_N)

   //-----------------------------------------------
   // Create a Sample Clock to sample the data in
   // the middle of the pulse
   //-----------------------------------------------      
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  sample_clk <= 0;
	else if (serial_clk_enable && clk16x_posedge && (clk16_count == 4'h7))
	  sample_clk <= 1;
	else
	  sample_clk <= 0;
     end   

   //-----------------------------------------------
   // Create delayed signals for pulse generation
   //-----------------------------------------------
   always @(posedge CLK or negedge RST_N)
     begin
	if (!RST_N)
	  clk16x_reg <= 1'b0;
	else
	  clk16x_reg <= CLK16X;
     end
   
endmodule // rcvr_mod



