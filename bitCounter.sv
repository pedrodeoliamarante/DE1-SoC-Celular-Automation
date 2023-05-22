module bitCounter (
  input logic [7:0] data,
  output  logic [3:0] count
);

  always @(data) begin
    count <= count_ones(data);
  end

  function integer count_ones (input logic [7:0] data);
    automatic integer county = 0;
    for (integer i = 0; i < 8; i++) begin
      if (data[i] == 1) begin
        county++;
      end
    end
    return county;
  endfunction

endmodule
