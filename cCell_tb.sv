module cCell_tb ();
  logic gameState;
  logic [7:0] neighbros;
  logic userInput;
  logic status;
  logic clk;
  cCell dut (.clk, .gameState, .neighbros, .userInput, .status);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  // Set up the inputs to the design. Each line is a clock cycle.
  initial begin
    $stop;  // pause the simulation
  end
endmodule  // simpleFSM_tb
