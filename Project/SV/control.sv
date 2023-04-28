

module control (clk, Datapath, reset, HDMI);

  input logic  Datapath;
  input logic clk;
  input logic reset;  
  output logic HDMI;

  always @(posedge clk ) 
  if(reset) begin
    HDMI <= 1'b0;
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