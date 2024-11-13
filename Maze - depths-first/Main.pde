Maze m;
int cellSize;
int cols;
int rows;

void setup() {
  size(10, 10);
  cellSize = 20;
  cols = 40;
  rows = 50;
  windowResize(cols * cellSize, rows * cellSize);
  surface.setResizable(true);
  m = new Maze();
  m.generateMaze();
  //m.printMaze();
}

void draw() {
  println(frameRate);
  windowResize(cols * cellSize, rows * cellSize);
  for (int i = 0; i < cols; i++) {
    for (int k = 0; k < rows; k++) {
      m.maze[i][k].show(i * cellSize, k * cellSize);
    }
  }
  noLoop();
}
