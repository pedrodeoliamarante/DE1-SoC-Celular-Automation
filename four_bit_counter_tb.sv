
module four_bit_counter_tb ();
  logic clk, reset, count;
  logic [3:0] out;

  four_bit_counter dut (.clk, .reset ,.count,  .out);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  // Set up the inputs to the design. Each line is a clock cycle.
  initial begin

	 count <= 0; reset <= 1;  @(posedge clk);
	 count <= 1; reset <= 0;  @(posedge clk);
	 @(posedge clk);
	 count <= 0; ;  @(posedge clk);
	 count <= 1; ;  @(posedge clk);
	 @(posedge clk);
	 @(posedge clk);
	 @(posedge clk);
	 count <= 0; ;  @(posedge clk);
	 count <= 0; ;  @(posedge clk);
	 count <= 1; ;  @(posedge clk);
	 count <= 0; ;  @(posedge clk);
	 count <= 1; ;  @(posedge clk);
	 count <= 1; ;  @(posedge clk);
	 count <= 1; ;  @(posedge clk);
	 count <= 1; ;  @(posedge clk);
	 @(posedge clk);
	 @(posedge clk);
   @(posedge clk);
	 @(posedge clk);
   @(posedge clk);
	 @(posedge clk);
   @(posedge clk);
	 @(posedge clk);
   @(posedge clk);
	 @(posedge clk);
   @(posedge clk);
	 @(posedge clk);


    $stop;  // pause the simulation
  end
endmodule  // simpleFSM_tb
