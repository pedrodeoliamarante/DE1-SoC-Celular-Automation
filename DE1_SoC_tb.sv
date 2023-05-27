module DE1_SoC_tb ();
    logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	  logic [9:0]  LEDR;
      logic [3:0]  KEY;
      logic [9:0]  SW;
     logic [35:0] GPIO_1;
     logic CLOCK_50;
  DE1_SoC dut (.CLOCK_50, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW, .GPIO_1);
  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    CLOCK_50 <= 0;
    forever #(CLOCK_PERIOD/2) CLOCK_50<= ~CLOCK_50;
  end

  // Set up the inputs to the design. Each line is a clock cycle.
  initial begin
      SW <= 10'b110000000; KEY[3] <=  1; KEY[2] <= 1;KEY[0]<=1;@(posedge CLOCK_50);
      SW <= 10'b000000000; KEY[3] <=  1; KEY[2] <= 1;KEY[0]<=1;@(posedge CLOCK_50);
     SW <= 10'b000000000;@(posedge CLOCK_50);
     SW <= 10'b0000000000;@(posedge CLOCK_50); KEY[3] <=  1; KEY[2] <= 1;@(posedge CLOCK_50);
         @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
     KEY[3] <=  1; KEY[2] <= 1;KEY[0]<=0;@(posedge CLOCK_50);
         @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
     KEY[3] <=  1; KEY[2] <= 0;KEY[0]<=1;@(posedge CLOCK_50);
         @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
     KEY[3] <=  1; KEY[2] <= 1;KEY[0]<=0;@(posedge CLOCK_50);
         @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
     KEY[3] <=  1; KEY[2] <= 0;KEY[0]<=1;@(posedge CLOCK_50);
         @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
     KEY[3] <=  1; KEY[2] <= 1;KEY[0]<=0;@(posedge CLOCK_50);
     @(posedge CLOCK_50);
     @(posedge CLOCK_50);
     @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
         SW <= 10'b0100000000; @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    @(posedge CLOCK_50);
    $stop;  // pause the simulation
  end
endmodule  // simpleFSM_tb
