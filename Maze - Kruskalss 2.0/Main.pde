int cellSize;
int cols;
int rows;
Maze m;

void setup() {
  cellSize = 20;
  cols = 40;
  rows = 50;
  windowResize(cols * cellSize, rows * cellSize);
  m = new Maze();
  m.generateMaze();
  // m.printMazeCell();
  // m.printMazeWall();
}

void draw() {
  println(frameRate);
  for (int i = 0; i < cols; i++) {
    for (int k = 0; k < rows; k++) {
      m.maze[i][k].show();
    }
  }
    for (int i = 0; i < cols; i++) {
    for (int k = 0; k < rows; k++) {
      // m.maze[i][k].showRoot();
    }
  }
  for (Wall w : m.walls) {
    w.show();
  }
  noLoop();
}
