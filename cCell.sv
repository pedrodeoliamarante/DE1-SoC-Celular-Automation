module cCell(
  input logic clk, gameState,
  input logic [7:0]  neighbros,
  input logic userInput,
  output logic status
);


logic nextStatus;
// count is the number of alive neighbors
logic [3:0] count;
bitCounter counter_inst (.data(neighbros), .count(count));
always_comb begin
  case(status)
   1'b0: begin
    // if game state is on, and there is exactly 3 cells, cell is alive
    if( count == 4'b0011 ) nextStatus = 1'b1;
    else nextStatus = 1'b0;
   end
   1'b1: begin
    // if game is one and there is 2 or 3 neighbors cell stays alive
     if( (count == 4'b0011) | (count == 4'b0010)) nextStatus = 1'b1;
    // else cell dead
    else nextStatus = 1'b0;
   end
   default: begin
    nextStatus = 1'bx;
   end
  endcase
end

always_ff @(posedge clk) begin
		 if (!gameState) status <= userInput;
     else status <= nextStatus;
	  end
endmodule