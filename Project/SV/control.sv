module control (clk, start);

   input logic  clk;
   input logic start;

   typedef enum 	logic [63:0] {grid, grid_evolve} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= grid;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       grid: begin	
  evolve3<= 1'b0;
  evolve5 <= 1'b0;
  evolve8<= 1'b0;
     
	  if (grid & grid_evolve) nextstate <= grid_evolve;
    else if (grid) nextstate <= grid_evolve;
    else if (grid_evolve) nextstate <= grid;
	  else   nextstate <= grid;
       end
       grid: begin 	
    grid <= 1'b1;
	  nextstate <= grid_evolve;
       end
       grid_evolve: begin  	
    evolve3<= 1'b1;
      end
       default: begin
	  evolve3 <= 1'b0;
    evolve5 <= 1'b0;
    evolve8 <= 1'b0;
	  nextstate <= grid;
       end
     endcase
   
endmodule