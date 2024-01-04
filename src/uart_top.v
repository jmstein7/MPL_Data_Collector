/******************************************************************************
 *
 *    File Name:  uart.v
 *      Version:  1.1
 *         Date:  January 22, 2000
 *        Model:  Uart Chip
 * Dependencies:  txmit.v, rcvr.v
 *
 *      Company:  Xilinx
 *
 *
 *   Disclaimer:  THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY 
 *                WHATSOEVER AND XILINX SPECIFICALLY DISCLAIMS ANY 
 *                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
 *                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
 *
 *                Copyright (c) 2000 Xilinx, Inc.
 *                All rights reserved
 *
 ******************************************************************************/

`timescale 1ns / 100ps

module uart_top 
  (
   CLK,
   RST_N,
   DOUT,
   DATA_READY,
   RXD,
   CLK16X,
   RDN,
   DIN,
   TX_BUFFER_EMPTY,
   WRN,
   SDO
   );
   
   //--------------------------------------------------
   // IO Port Declarations                           
   //--------------------------------------------------
   input  CLK;
   input  RST_N ;
   input [7:0] DIN;
   input       CLK16X;
   input       WRN;
   input       RXD;
   input       RDN;
   output      TX_BUFFER_EMPTY;
   output      SDO;
   output [7:0] DOUT;
   output 	DATA_READY;
   
   //--------------------------------------------------
   // Receiver and Transmitter Instantiation
   //--------------------------------------------------
   
   uart_receiver RX_INST
     (
      .CLK                    (CLK),
      .RST_N                  (RST_N),
      .DOUT                   (DOUT),
      .DATA_READY             (DATA_READY),
      .RXD                    (RXD),
      .CLK16X                 (CLK16X),
      .RDN                    (RDN)
      );
   
   uart_transmitter TX_INST
     (
      .CLK                    (CLK),
      .RST_N                  (RST_N),
      .DIN                    (DIN),
      .BUFFER_EMPTY           (TX_BUFFER_EMPTY),
      .CLK16X                 (CLK16X),
      .WRN                    (WRN),
      .SDO                    (SDO)
      );
   
endmodule
