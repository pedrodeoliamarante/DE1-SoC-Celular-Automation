// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC
   ( output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	 output logic [9:0]  LEDR,
    input  logic [3:0]  KEY,
    input  logic [9:0]  SW,
    output logic [35:0] GPIO_1,
    input logic CLOCK_50);




	 /* Set up system base clock to 1526 Hz (50 MHz / 2**(14+1))
	    ===========================================================*/
	 logic [31:0] clk;
	 logic SYSTEM_CLOCK;
	 logic GAME_CLOCK;

	 clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));

	 assign SYSTEM_CLOCK = clk[14]; // 1526 Hz clock signal
    assign GAME_CLOCK = clk[20];
	 assign GAME_CLOCK2 = clk[25];

	 /* If you notice flickering, set SYSTEM_CLOCK faster.
	    However, this may reduce the brightness of the LED board. */


	 /* Set up LED board driver
	    ================================================================== */
	 logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
    logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	 logic RST;                   // reset - toggle this on startup

	 assign RST = SW[9];

	 /* Standard LED Driver instantiation - set once and 'forget it'.
	    See LEDDriver.sv for more info. Do not modify unless you know what you are doing! */
	 LEDDriver Driver (.CLK(SYSTEM_CLOCK), .RST, .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);

   logic  [15:0] [15:0] userInput;
   logic [3:0] counterValue1;
   logic [3:0] counterValue2;
	logic syncKEY0;
   synchronizer synchronizerKEY0 (.clk(GAME_CLOCK), .KEY(~KEY[0]), .sync_KEY_out(syncKEY0));
   logic syncKEY2;
   synchronizer synchronizerKEY2 (.clk(GAME_CLOCK), .KEY(~KEY[2]), .sync_KEY_out(syncKEY2));
   logic syncKEY3;
   synchronizer synchronizerKEY3 (.clk(GAME_CLOCK), .KEY(~KEY[3]), .sync_KEY_out(syncKEY3));

   logic clockedKEY0;
   edgeDetector edgeDetectorKEY0(.clk(GAME_CLOCK), .reset(SW[8]), .KEY(syncKEY0), .KEY_O(clockedKEY0));
   logic clockedKEY2;
   edgeDetector edgeDetectorKEY2(.clk(GAME_CLOCK), .reset(SW[8]), .KEY(syncKEY2), .KEY_O(clockedKEY2));
   logic clockedKEY3;
   edgeDetector edgeDetectorKEY3(.clk(GAME_CLOCK), .reset(SW[8]), .KEY(syncKEY3), .KEY_O(clockedKEY3));

   doubleCounterDisplay counter1(.clk(GAME_CLOCK), .reset(SW[8]), .count(clockedKEY3), .out1(HEX4), .out2(HEX3), .counterValue(counterValue1));
   doubleCounterDisplay counter2(.clk(GAME_CLOCK), .reset(SW[8]), .count(clockedKEY2), .out1(HEX1), .out2(HEX0), .counterValue(counterValue2));

   cellSelector selector(.clk(GAME_CLOCK),.counterValue1(counterValue1), .counterValue2(counterValue2), .reset(SW[8]), .KEY(clockedKEY0) ,.userInput(GrnPixels));
	 gameOfLife game(.clk(GAME_CLOCK), .gameState(SW[8]), .cellStatus(RedPixels), .userInput(GrnPixels));

endmodule