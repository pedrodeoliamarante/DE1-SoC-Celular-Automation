module gameOfLife(
  input logic clk,
  input logic gameState,
  input logic freeze,
  input logic  [15:0] [15:0] userInput,
  output logic [15:0] [15:0] cellStatus
  );

parameter gridSize = 16;

// creating cell 0 , 0
cCell cell_inst0 (.clk(clk),
      .gameState(gameState),
      .freeze(freeze),
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

// creting all cells that have index [0][k]
generate
  genvar k;
    for ( k = 1; k < gridSize; k++) begin : gen_block_in
    cCell cell_inst (
      .clk(clk),
      .gameState(gameState),
      .freeze(freeze),
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


  // creting all cells that have index [i][0]
  generate
  genvar i;
  for ( i = 1; i < gridSize; i++) begin  : gen_block_out
    cCell cell_inst (
      .clk(clk),
      .gameState(gameState),
      .freeze(freeze),
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

// creating all other cells
 generate
  genvar x;
  genvar y;
  for ( x = 1; x < gridSize; x++) begin  : gen_block_out_2
    for ( y = 1; y < gridSize; y++) begin : gen_block_in_2
    cCell cell_inst (
      .clk(clk),
      .gameState(gameState),
      .freeze(freeze),
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