module gameOfLife_tb ();
   logic clk;
   logic gameState;
   logic  [15:0] [15:0] userInput;
   logic [15:0] [15:0] cellStatus;
  gameOfLife dut (.clk, .gameState, .userInput, .cellStatus);
  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  // Set up the inputs to the design. Each line is a clock cycle.
  initial begin
     @(posedge clk);
     userInput <= 0;
     @(posedge clk);
     gameState <= 0; userInput[3][3] <= 1; userInput[3][2] <= 1; userInput[3][1] <= 1;
    @(posedge clk);
    gameState <=1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    $stop;  // pause the simulation
  end
endmodule  // simpleFSM_tb
