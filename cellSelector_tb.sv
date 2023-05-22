// Testbench for winnerOutput
module cellSelector_tb ();
  logic clk, reset, KEY;
  logic [3:0] counterValue1;
  logic [3:0] counterValue2;
  logic [15:0][15:0] userInput;

  cellSelector dut (.clk, .counterValue1, .counterValue2, .reset, .KEY, .userInput);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  // Set up the inputs to the design. Each line is a clock cycle.
  initial begin

	   reset <=1 ; @(posedge clk);
     reset <=0 ; KEY<= 1; counterValue1 <= 4'b0001;counterValue2 <= 4'b0101; @(posedge clk);
     reset <=0 ; KEY<= 1; counterValue1 <= 4'b1111;counterValue2 <= 4'b0000; @(posedge clk);
    reset <=0 ; KEY<= 1; counterValue1 <= 4'b0001;counterValue2 <= 4'b0101; @(posedge clk);
     reset <=0 ; KEY<= 0; counterValue1 <= 4'b1111;counterValue2 <= 4'b0000; @(posedge clk);
     reset <=0 ; KEY<= 0; counterValue1 <= 4'b0001;counterValue2 <= 4'b0101; @(posedge clk);
     reset <=0 ; KEY<= 0; counterValue1 <= 4'b1111;counterValue2 <= 4'b0000; @(posedge clk);
    reset <=0 ; KEY<= 0; counterValue1 <= 4'b0001;counterValue2 <= 4'b0101; @(posedge clk);
     reset <=0 ; KEY<= 0; counterValue1 <= 4'b1111;counterValue2 <= 4'b0000; @(posedge clk);
     reset <=1 ; KEY<= 0; counterValue1 <= 4'b1111;counterValue2 <= 4'b0000; @(posedge clk);
      reset <=0 ; KEY<= 0; counterValue1 <= 4'b1111;counterValue2 <= 4'b0000; @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);


    $stop;  // pause the simulation
  end
endmodule  // simpleFSM_tb
