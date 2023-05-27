module Mux8to1_tb;

  // Inputs
  logic [15:0][15:0] data0;
  logic [15:0][15:0] data1;
  logic [15:0][15:0] data2;
  logic [15:0][15:0] data3;
  logic [15:0][15:0] data4;
  logic [15:0][15:0] data5;
  logic [15:0][15:0] data6;
  logic [15:0][15:0] data7;
  logic [2:0] select;
  logic reset;

  // Output
  wire [15:0][15:0] outputU;

  // Instantiate the Mux8to1 module
  Mux8to1 uut (
    .data0(data0),
    .data1(data1),
    .data2(data2),
    .data3(data3),
    .data4(data4),
    .data5(data5),
    .data6(data6),
    .data7(data7),
    .select(select),
    .reset(reset),
    .outputU(outputU)
  );

  // Clock
  logic clk = 0;
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    // Initialize inputs
    data0 = 16'hAAAA;
    data1 = 16'hBBBB;
    data2 = 16'hCCCC;
    data3 = 16'hDDDD;
    data4 = 16'hEEEE;
    data5 = 16'hFFFF;
    data6 = 16'h1111;
    data7 = 16'h2222;
    select = 3'b000;
    reset = 0;

    // Apply stimulus
    #10 select = 3'b001;
    #10 select = 3'b010;
    #10 select = 3'b011;
    #10 select = 3'b100;
    #10 select = 3'b101;
    #10 select = 3'b110;
    #10 select = 3'b111;
    #10 reset = 1;
    #10 reset = 0;

    // Finish simulation
    #10 $finish;
  end

  // Monitor
  always @(outputU)
    $display("Output: %h", outputU);

  // Apply clock
  always #5 clk = ~clk;

endmodule
