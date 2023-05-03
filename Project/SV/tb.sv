`timescale 1ns / 1ps
<<<<<<< HEAD
module stimulus ();


   logic        [63:0] seed;
   logic 	start;
   logic reset;
   logic	[63:0] HDMI;
   logic        clk;   
   
   integer handle3;
   integer desc3;
   
  // instantiate device under test
   control dut (seed, start, clk, reset, HDMI);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end
 initial
     begin
	// Gives output file name
	handle3 = $fopen("control.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b || %b", 
		     start, seed,HDMI);
     end
=======
module tb ();

   logic       clk;   
   logic       rst;
   logic       clk_en;      
   
   integer     handle3;  
   integer 	 desc3;    
>>>>>>> 82dcce7cd89477e7875163b8f985ef2e581b0465

   // instantiate device under test   
   clk_div dut (clk, rst, clk_en);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

   // Give reset signal for clock enable
   initial
     begin
<<<<<<< HEAD
          
    
	//#0    seed = 64'h0412_6424_0034_3C28;	
     #0    seed = 64'h0000_00e0_0000_0000;	
	//#0   seed = 1'b1;
    // #0 grid = 1'b0;
    #0 start = 1'b0;
    #0 reset = 1'b1;
    #40 reset = 1'b0;
    #0 start = 1'b1;
	
     end

   
endmodule
=======
	// Initialization of board (X is going)
	#0   rst = 1'b1;
	#100 rst = 1'b0;

     end
   
endmodule // tb
>>>>>>> 82dcce7cd89477e7875163b8f985ef2e581b0465
