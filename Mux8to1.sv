module Mux8to1 (
  input logic [15:0][15:0] data0,
  input logic [15:0][15:0] data1,
  input logic [15:0][15:0] data2,
  input logic [15:0][15:0] data3,
  input logic [15:0][15:0] data4,
  input logic [15:0][15:0] data5,
  input logic [15:0][15:0] data6,
  input logic [15:0][15:0] data7,
  input logic [2:0] select,
  input logic reset,

  output logic [15:0][15:0] outputU
);

  always @(select or data0 or data1 or reset) begin
    if (reset)
      outputU <= 0;
    else begin
    case (select)
      3'b000: outputU <= data0;
      3'b001: outputU <= data1;
      3'b010: outputU <= data2;
      3'b011: outputU <= data3;
      3'b100: outputU <= data4;
      3'b101: outputU <= data5;
      3'b110: outputU <= data6;
      3'b111: outputU <= data7;
    endcase
    end
  end

endmodule