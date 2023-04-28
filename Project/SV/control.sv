

module control (clk, start, Mux, grid, HDMI);

  input logic  clk;
  input logic start;
  input logic Mux;  
  input logic grid;
  output logic HDMI;
  
  assign grid = 64'h0412_6424_0034_3C28;
  
   // state register
  always_ff @(posedge clk, posedge reset)
   if (reset) 
      HDMI <= next_grid;
   else      
      HDMI <= grid;
	//The next state logic
16		always @*
17			if(load)
18				HDMI_next = grid_evolve;
19			else if ()
20				HDMI_next = HDMI;
21			else if ()
22				HDMI_next = HDMI + 8'h01;
23			else 
24				HDMI_next = HDMI - 8'h01;

   
endmodule



 


module Mux(Start, Seed, HDMI, Datapath);
  input logic Start:
  input logic Seed;
  input logic HDMI;
  output logic Datapath;

  assign Datapath = start ? HDMI : Seed;

  endmodule