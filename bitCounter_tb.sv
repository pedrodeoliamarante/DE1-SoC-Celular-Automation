// Testbench for winnerOutput
module bitCounter_tb ();
  logic [7:0] data;
  logic [3:0] count;
  logic clk;
  bitCounter dut (.data, .count);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  // Set up the inputs to the design. Each line is a clock cycle.
  initial begin

	   data <= 8'b10101010 ; @(posedge clk);
	   data <= 8'b00001010 ; @(posedge clk);
	   data <= 8'b00000000 ; @(posedge clk);
	   data <= 8'b11111110 ; @(posedge clk);
	   data <= 8'b00001110 ; @(posedge clk);
    @(posedge clk);
    $stop;  // pause the simulation
  end
endmodule  // simpleFSM_tb
