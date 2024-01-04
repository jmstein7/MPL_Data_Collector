//#######################################################################
//#
//#	Copyright 	Earth People Technology Inc. 2016
//#
//#
//# File Name:  DSO_Main_Clk.v
//# Author:     Earth People Technology
//# Date:       November 7, 2016
//# Revision:   A
//#
//# Development: EPT DSO Project 
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
//#			11/7/16 	1			Created
//#
//#									
//#
//#######################################################################

`timescale 1ns/1ps

`include "../Testbench/tb_define.v"

module DSO_Main_Clk
  (
    input  wire                 areset,
    input  wire                 inclk0,

	output  reg                 c0,
	output  reg                 c1,
 	output  reg                 c2,
 	output  reg                 c3,
 	output  reg                 locked
    
	
   );

    //--------------------------------------------------------------------------------------------------------------
    //	Generate Clock 400MHz
    //--------------------------------------------------------------------------------------------------------------

	initial 
	begin
		c0 = 0;
		forever
		//begin
			# `CYCLE_396 c0 = !c0;
		//end
	end

	
	//--------------------------------------------------------------------------------------------------------------
    //	Generate Clock 100MHz
    //--------------------------------------------------------------------------------------------------------------

	initial 
	begin
		c1 = 0;
		forever
		//begin
			# `CYCLE_264 c1 = !c1;
		//end
	end

	
	//--------------------------------------------------------------------------------------------------------------
    //	Generate Clock 66MHz
    //--------------------------------------------------------------------------------------------------------------

	initial 
	begin
		c2 = 0;
		forever
		//begin
			# `CYCLE_132 c2 = !c2;
		//end
	end

	initial 
	begin
		c3 = 0;
		forever
		//begin
			# `CYCLE_66 c3 = !c3;
		//end
	end

   
endmodule 


   