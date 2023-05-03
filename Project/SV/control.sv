
module FlipFlop (clk, Datapath, grid, reset, HDMI);

  input logic  clk;
  input logic [63:0] Datapath;
  input logic reset;
  input logic [63:0] grid;
  output logic [63:0]HDMI;


  always@(posedge clk, posedge reset)
  if(reset) begin 
    HDMI <= grid;
  end
  else begin 
    HDMI <= Datapath;
  end
  endmodule

module Mux (Start, Seed, HDMI, Datapath);

input logic Start;
input logic [63:0] Seed;
input logic [63:0] HDMI;
output logic [63:0] Datapath;

assign Datapath = Start ? HDMI : Seed; // if start == 0, Datapath = Seed. if start == 1, Datapath = HDMI.

endmodule

module control (seed, start, clk, reset, HDMI);

input logic [63:0] seed;
input logic start;
input logic clk;
input logic reset;
output logic [63:0] HDMI;
logic [63:0] grid;
logic [63:0] grid_evolve;

Mux togrid (.Start(start), .Seed(seed), .HDMI(HDMI), .Datapath(grid));
datapath nextgrid ( .grid(grid), .grid_evolve(grid_evolve));
FlipFlop  toHDMI (.clk(clk), .Datapath(grid_evolve), .grid(seed), .reset(reset), .HDMI(HDMI));

endmodule 