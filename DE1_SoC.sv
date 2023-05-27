// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC
   ( output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	 output logic [9:0]  LEDR,
    input  logic [3:0]  KEY,
    input  logic [9:0]  SW,
    output logic [35:0] GPIO_1,
    input logic CLOCK_50);


   logic [15:0] [15:0] preset0;
   assign preset0[0][0] = 1;
assign preset0[0][1] = 1;
assign preset0[0][2] = 1;
assign preset0[1][2] = 1;
assign preset0[2][1] = 1;

   logic [15:0] [15:0] preset1;
  // assign preset1[5][0] = 1;
//assign preset1[6][0] = 1;
assign preset1[8][1] = 1;
assign preset1[8][2] = 1;
assign preset1[9][3] = 1;
assign preset1[10][3] = 1;
assign preset1[11][3] = 1;
assign preset1[12][3] = 1;
assign preset1[13][2] = 1;
assign preset1[13][1] = 1;
assign preset1[14][0] = 1;
assign preset1[1][0] = 1;
assign preset1[2][0] = 1;
assign preset1[3][0] = 1;
assign preset1[5][0] = 1;
assign preset1[6][0] = 1;
assign preset1[7][1] = 1;
//assign preset1[8][2] = 1;
assign preset1[7][3] = 1;
assign preset1[6][4] = 1;
assign preset1[7][5] = 1;
assign preset1[8][5] = 1;
assign preset1[9][5] = 1;
assign preset1[10][4] = 1;
//assign preset1[11][3] = 1;
assign preset1[12][2] = 1;
assign preset1[12][1] = 1;
assign preset1[13][0] = 1;
//assign preset1[1][0] = 1;
assign preset1[0][0] = 1;


   logic [15:0] [15:0] preset2;
assign preset2[3][2] = 1;
assign preset2[4][2] = 1;
assign preset2[6][2] = 1;
assign preset2[2][3] = 1;
assign preset2[4][3] = 1;
assign preset2[6][3] = 1;
assign preset2[7][3] = 1;
assign preset2[8][3] = 1;
assign preset2[9][3] = 1;
assign preset2[10][3] = 1;
assign preset2[11][3] = 1;
assign preset2[12][3] = 1;
assign preset2[1][4] = 1;
assign preset2[6][4] = 1;
assign preset2[11][4] = 1;
assign preset2[0][5] = 1;
assign preset2[5][5] = 1;
assign preset2[10][5] = 1;
assign preset2[12][5] = 1;


   logic [15:0] [15:0] preset3;
   assign preset3[3][2] = 1;
assign preset3[4][2] = 1;
assign preset3[5][2] = 1;
assign preset3[6][2] = 1;
assign preset3[3][3] = 1;
assign preset3[4][3] = 1;
assign preset3[5][3] = 1;
assign preset3[6][3] = 1;
assign preset3[7][3] = 1;
assign preset3[8][3] = 1;
assign preset3[9][3] = 1;
assign preset3[2][4] = 1;
assign preset3[3][4] = 1;
assign preset3[4][4] = 1;
assign preset3[5][4] = 1;
assign preset3[6][4] = 1;
assign preset3[7][4] = 1;
assign preset3[8][4] = 1;
assign preset3[9][4] = 1;
assign preset3[10][4] = 1;
assign preset3[3][5] = 1;
assign preset3[4][5] = 1;
assign preset3[5][5] = 1;
assign preset3[6][5] = 1;
assign preset3[7][5] = 1;
assign preset3[8][5] = 1;
assign preset3[9][5] = 1;
assign preset3[3][6] = 1;
assign preset3[4][6] = 1;
assign preset3[5][6] = 1;
assign preset3[6][6] = 1;



   logic [15:0] [15:0] preset4;
   assign preset4[5][2] = 1;
assign preset4[6][3] = 1;
assign preset4[7][4] = 1;
assign preset4[4][5] = 1;
assign preset4[5][5] = 1;
assign preset4[6][5] = 1;
assign preset4[7][5] = 1;
assign preset4[4][6] = 1;
assign preset4[5][7] = 1;


   logic [15:0] [15:0] preset5;
   assign preset5[0][0] = 0;
assign preset5[1][0] = 0;
assign preset5[2][0] = 0;
assign preset5[0][1] = 0;
assign preset5[1][1] = 0;
assign preset5[2][1] = 0;
assign preset5[0][2] = 1;
assign preset5[1][2] = 1;
assign preset5[2][2] = 1;
assign preset5[0][3] = 1;
assign preset5[1][3] = 0;
assign preset5[2][3] = 1;
assign preset5[0][4] = 1;
assign preset5[1][4] = 0;
assign preset5[2][4] = 1;



   logic [15:0] [15:0] preset6;
   assign preset6 = 0;




	 /* Set up system base clock to 1526 Hz (50 MHz / 2**(14+1))
	    ===========================================================*/
	 logic [31:0] clk;
	 logic SYSTEM_CLOCK;
	 logic GAME_CLOCK;

	 clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));

	 assign SYSTEM_CLOCK = clk[14]; // 1526 Hz clock signal
    assign GAME_CLOCK = clk[21];

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


   logic [3:0] counterValue1;
   logic [3:0] counterValue2;
   logic [15:0][15:0] userInput;
      logic [15:0][15:0] userInput2;

	logic syncKEY0;
   synchronizer synchronizerKEY0 (.clk(GAME_CLOCK), .KEY(~KEY[0]), .sync_KEY_out(syncKEY0));
   logic syncKEY2;
   synchronizer synchronizerKEY2 (.clk(GAME_CLOCK), .KEY(~KEY[2]), .sync_KEY_out(syncKEY2));
   logic syncKEY3;
   synchronizer synchronizerKEY3 (.clk(GAME_CLOCK), .KEY(~KEY[3]), .sync_KEY_out(syncKEY3));

   logic syncKEY1;
   synchronizer synchronizerKEY1 (.clk(GAME_CLOCK), .KEY(~KEY[1]), .sync_KEY_out(syncKEY1));
   logic clockedKEY1;
   edgeDetector edgeDetectorKEY1(.clk(GAME_CLOCK), .reset(SW[8]& ~(SW[4])), .KEY(syncKEY1), .KEY_O(clockedKEY1));

   logic clockedKEY0;
   edgeDetector edgeDetectorKEY0(.clk(GAME_CLOCK), .reset(SW[8] & ~(SW[4])), .KEY(syncKEY0), .KEY_O(clockedKEY0));
   logic clockedKEY2;
   edgeDetector edgeDetectorKEY2(.clk(GAME_CLOCK), .reset(SW[8]& ~(SW[4])), .KEY(syncKEY2), .KEY_O(clockedKEY2));
   logic clockedKEY3;
   edgeDetector edgeDetectorKEY3(.clk(GAME_CLOCK), .reset(SW[8]& ~(SW[4])), .KEY(syncKEY3), .KEY_O(clockedKEY3));

   doubleCounterDisplay counter1(.clk(GAME_CLOCK), .reset(SW[8]& ~(SW[4])), .count(clockedKEY3), .deCount(clockedKEY1) ,.out1(HEX4), .out2(HEX3), .counterValue(counterValue1));
   doubleCounterDisplay counter2(.clk(GAME_CLOCK), .reset(SW[8]& ~(SW[4])), .count(clockedKEY2), .deCount(clockedKEY1) ,.out1(HEX1), .out2(HEX0), .counterValue(counterValue2));

   cellSelector selector(.clk(GAME_CLOCK),.counterValue1(counterValue1), .counterValue2(counterValue2), .reset(SW[8] & ~(SW[4])), .KEY(clockedKEY0), .prevGame(userInput2) ,.userInput(userInput));
   Mux8to1 mux(.reset(SW[8] & ~(SW[4])), .data0(userInput), .data1(preset0), .data2(preset1), .data3(preset2), .data4(preset3), .data5(preset4), .data6(preset5), .data7(preset6), .select(SW[7:5]), .outputU(userInput2));
   gameOfLife game(.clk(GAME_CLOCK), .gameState(SW[8]), .freeze(SW[4]), .cellStatus(RedPixels), .userInput(userInput2));
   bigSync synchronizerLED(.clk(GAME_CLOCK), .KEY(RedPixels), .sync_KEY_out(GrnPixels));

endmodule