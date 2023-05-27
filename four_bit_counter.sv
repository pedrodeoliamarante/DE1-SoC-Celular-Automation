module four_bit_counter (
  input logic clk,
  input logic count,
  input logic deCount,
  input logic reset,
  output logic [3:0] out
);
 logic [3:0] fOut;
  always_comb begin
    if (count) begin
	   if (out == 4'b1111) fOut = 4'b0000;
	   else fOut = out + 1'b1;
	  end
	 else if(deCount) begin
     if (out == 4'b0000) fOut = 4'b1111;
	   else fOut = out - 1'b1;
   end
   else
    fOut = out;
  end

  always_ff @(posedge clk) begin
    if (reset)
      out <= 1'b0;
    else if (count | deCount)
      out <= fOut;
  end
endmodule

