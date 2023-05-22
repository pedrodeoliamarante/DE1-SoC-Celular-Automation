module gameOfLife(
  input logic clk,
  input logic gameState,
  input logic  [3:0] [3:0] userInput,
  output logic [3:0] [3:0] cellStatus
  );

parameter gridSize = 4;
cCell cell_inst0 (.clk(clk),
      .gameState(gameState),
      .neighbros({
      cellStatus[gridSize-1][gridSize-1],
      cellStatus[gridSize-1][0],
      cellStatus[gridSize-1][1],
      cellStatus[0][gridSize-1],
      cellStatus[0][1],
      cellStatus[1][gridSize -1],
      cellStatus[1][0],
      cellStatus[1][1]}),
      .userInput(userInput[0][0]),
      .status(cellStatus[0][0]));

generate
  genvar k;
    for ( k = 1; k < gridSize; k++) begin : gen_block_in
    cCell cell_inst (
      .clk(clk),
      .gameState(gameState),
      .neighbros({
      cellStatus[(gridSize-1)][((k-1)%gridSize)],
      cellStatus[(gridSize-1)][(k)%gridSize],
      cellStatus[(gridSize-1)][(k+1)%gridSize],
      cellStatus[0][(k-1)%gridSize],
      cellStatus[0][(k+1)%gridSize],
      cellStatus[1][(k-1)%gridSize],
      cellStatus[1][(k)%gridSize],
      cellStatus[1][(k+1)%gridSize] }),
      .userInput(userInput[0][k]),
      .status(cellStatus[0][k])
    );
    end
  endgenerate

  generate
  genvar i;
  for ( i = 1; i < gridSize; i++) begin  : gen_block_out
    cCell cell_inst (
      .clk(clk),
      .gameState(gameState),
      .neighbros({
      cellStatus[((i-1)%gridSize)][(gridSize)-1],
      cellStatus[(i-1)%gridSize][0],
      cellStatus[(i-1)%gridSize][1],
      cellStatus[(i)%gridSize][gridSize-1],
      cellStatus[(i)%gridSize][1],
      cellStatus[(i+1)%gridSize][(gridSize)-1],
      cellStatus[(i+1)%gridSize][0],
      cellStatus[(i+1)%gridSize][1] }),
      .userInput(userInput[i][0]),
      .status(cellStatus[i][0])
    );
  end
  endgenerate

 generate
  genvar x;
  genvar y;
  for ( x = 1; x < gridSize; x++) begin  : gen_block_out_2
    for ( y = 1; y < gridSize; y++) begin : gen_block_in_2
    cCell cell_inst (
      .clk(clk),
      .gameState(gameState),
      .neighbros({
      cellStatus[((x-1)%gridSize)][((y-1)%gridSize)],
      cellStatus[(x-1)%gridSize][(y)%gridSize],
      cellStatus[(x-1)%gridSize][(y+1)%gridSize],
      cellStatus[(x)%gridSize][(y-1)%gridSize],
      cellStatus[(x)%gridSize][(y+1)%gridSize],
      cellStatus[(x+1)%gridSize][(y-1)%gridSize],
      cellStatus[(x+1)%gridSize][(y)%gridSize],
      cellStatus[(x+1)%gridSize][(y+1)%gridSize] }),
      .userInput(userInput[x][y]),
      .status(cellStatus[x][y])
    );
    end
  end
  endgenerate
endmodule