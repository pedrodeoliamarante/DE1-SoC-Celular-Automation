module cellSelector(
  input clk,
  input logic [3:0] counterValue1,
  input logic [3:0] counterValue2,
  input logic reset,
  input logic KEY,
  output logic [15:0][15:0] userInput
);

integer decimalValue1;
integer decimalValue2;
logic debug;

always_comb begin
  decimalValue1 = $unsigned(counterValue1);
  decimalValue2 = $unsigned(counterValue2);
  if (KEY) debug= ~(userInput[decimalValue1][decimalValue2]);
  else debug = userInput[decimalValue1][decimalValue2];
end

always_ff @(posedge clk) begin
    if (reset) begin
      userInput <= 0;
		end
    else if (!reset)
      userInput[decimalValue1][decimalValue2] <= debug;
  end

endmodule
