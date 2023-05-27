module doubleCounterDisplay(
  input logic clk,
  input logic reset,
  input logic count,
  input logic deCount,
  output logic [6:0] out1,
  output logic [6:0] out2,
  output logic [3:0] counterValue
);


 four_bit_counter counter(.clk(clk), .reset(reset), .count(count), .deCount(deCount), .out(counterValue));

 logic [6:0] fOut1;
 logic [6:0] fOut2;

always_comb begin
  case(counterValue)
   4'b0000: begin
    fOut1 =  ~7'b0111111;
    fOut2 =  ~7'b0111111;
   end
   4'b0001: begin
    fOut1 = ~7'b0111111;
    fOut2 =  ~7'b0000110;
   end
   4'b0010: begin
    fOut1 =  ~7'b0111111;
    fOut2 =  ~7'b1011011;
   end
   4'b0011: begin
    fOut1 = ~7'b0111111;
    fOut2 =  ~7'b1001111;
   end
   4'b0100: begin
    fOut1 =  ~7'b0111111;
    fOut2 =  ~7'b1100110;
   end
   4'b0101: begin
    fOut1 = ~7'b0111111;
    fOut2 =  ~7'b1101101;
   end
   4'b0110: begin
    fOut1 =  ~7'b0111111;
    fOut2 =  ~7'b1111101;
   end
   4'b0111: begin
    fOut1 = ~7'b0111111;
    fOut2 =  ~7'b0000111;
   end
   4'b1000: begin
    fOut1 = ~7'b0111111;
    fOut2 =  ~7'b1111111;
   end
   4'b1001: begin
    fOut1 = ~7'b0111111;
    fOut2 =  ~7'b1101111;
   end
   4'b1010: begin
    fOut1 = ~7'b0000110;
    fOut2 =  ~7'b0111111;
   end
   4'b1011: begin
    fOut1 = ~7'b0000110;
    fOut2 =  ~7'b0000110;
   end
   4'b1100: begin
    fOut1 = ~7'b0000110;
    fOut2 =  ~7'b1011011;
   end
   4'b1101: begin
    fOut1 = ~7'b0000110;
    fOut2 =  ~7'b1001111;
   end
   4'b1110: begin
    fOut1 = ~7'b0000110;
    fOut2 =  ~7'b1100110;
   end
   4'b1111: begin
    fOut1 = ~7'b0000110;
    fOut2 =  ~7'b1101101;
   end
  endcase
end

always_ff @(posedge clk) begin
		 if(reset) begin
      out1 <= ~7'b0111111;
      out2 <= ~7'b0111111;
     end
     else begin
      out1 <= fOut1;
      out2 <= fOut2;
     end
	  end


endmodule // counter display
