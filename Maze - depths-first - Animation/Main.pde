Maze m;
int cellSize;
int cols;
int rows;

void setup() {
  size(10, 10);
  frameRate(20);
  cellSize = 50;
  cols = 20;
  rows = 15;
  windowResize(cols * cellSize, rows * cellSize);
  surface.setResizable(true);
  m = new Maze();
  // m.printMaze();
}

void draw() {
  windowResize(cols * cellSize, rows * cellSize);
  for (int i = 0; i < cols; i++) {
    for (int k = 0; k < rows; k++) {
      m.maze[i][k].show(i * cellSize, k * cellSize);
    }
  }
  if (m.stack.size() != 0) {
    m.currentCell.state = "visited";
    m.currentCell = m.stack.remove(m.stack.size() - 1); // Pop last cell from stack and make it current cell
    m.currentCell.state = "current";
    Cell choosenCell = m.getUnvisitedNeighbour(m.currentCell);  // Returns a random unvisited neighbour, return current cell if no unvisited neighbours
    //-------------------------------------------------------- Also, the walls get removed inside this function
    if (choosenCell != m.currentCell) { // Only activates if there is any unvisited neighbours
      m.stack.add(m.currentCell); // current cell pushed to stack
      choosenCell.visited = true; // choosen cell set to visited
      m.stack.add(choosenCell); // choosen cell pushed to stack
    }
  }
}
