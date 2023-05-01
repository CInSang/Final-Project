

module Flipflop (clk, Datapath, reset, HDMI);

  input logic  [63:0] Datapath;
  input logic clk;
  input logic reset;  
  output logic [63:0] HDMI;

  logic [63:0] grid;

  assign grid = 64'h0412_6424_0034_3C28;

  always @(posedge clk ) 
  if(reset) begin
    HDMI <= grid;
  end
   else begin
    HDMI <= Datapath;
   end
endmodule

module Mux(Start, Seed, HDMI, Datapath);
  input logic Start:
  input logic Seed;
  input logic HDMI;
  output logic Datapath;

  assign Datapath = start ? HDMI : Seed;

  endmodule

  module control (seed, start, clk, reset, HDMI);
  input logic seed;
  input logic start;
  input logic clk;
  input logic reset;
  output logic [63:0] HDMI;

  assign HDMI [63:0] = seed ^ start ^ clk ^ reset; 

  endmodule