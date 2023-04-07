module datapath ();

   logic  grid;
   logic grid_evolve;

   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   dfatapath dut (grid, reset, left, right, LA, LB, LC, RA, RB, RC);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#700 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b || %b %b %b || %b || %b %b %b", 
		     reset, left, LA, LB, LC, right, RA, RB, RC);
     end   
   
   initial 
     begin      
	#0   reset = 1'b1;
	#10  reset = 1'b0;	
	#0   right = 1'b1;
     #0   left = 1'b1;
	#30  right = 1'b0;
     #0   left = 1'b1;
	#30  left = 1'b0;
     #0   right = 1'b1;
     #0   left = 1'b0;
     end

endmodule 