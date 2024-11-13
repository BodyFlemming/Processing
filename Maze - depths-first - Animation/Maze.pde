class Maze {
  Cell[][] maze;
  ArrayList<Cell> stack;
  Cell initCell;
  Cell currentCell;

  Maze() {
    maze = generateGrid();
    generateMaze();
  }

  Cell[][] generateGrid() {
    Cell[][] grid = new Cell[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int k = 0; k < rows; k++) {
        grid[i][k] = new Cell(i, k);
      }
    }
    return grid;
  }

  void generateMaze() {
    // Custom stack to keep track of cells
    stack = new ArrayList<Cell>();
    initCell = maze[floor(random(0, cols))][floor(random(0, rows))]; // Choose inital Cell
    initCell.visited = true; // Mark as visited
    initCell.state = "current";
    stack.add(initCell); // Push to stack
    currentCell = initCell;
  }

  /**
   1. Choose the initial cell, mark it as visited and push it to the stack X
   2. While the stack is not empty X
   --1. Pop a cell from the stack and make it a current cell
   --2. If the current cell has any neighbours which have not been visited
   ----1. Push the current cell to the stack
   ----2. Choose one of the unvisited neighbours
   ----3. Remove the wall between the current cell and the chosen cell
   ----4. Mark the chosen cell as visited and push it to the stack
   **/

  Cell getUnvisitedNeighbour(Cell cc) {
    ArrayList<Cell> unvisitedNeighbours = new ArrayList<Cell>();
    ArrayList<Integer> direction = new ArrayList<Integer>();
    if (cc.y != 0) if (maze[cc.x][cc.y-1].visited == false) {
      unvisitedNeighbours.add(maze[cc.x][cc.y-1]);
      direction.add(0);
    }
    if (cc.x != cols-1) if (maze[cc.x+1][cc.y].visited == false) {
      unvisitedNeighbours.add(maze[cc.x+1][cc.y]);
      direction.add(1);
    }
    if (cc.y != rows-1) if (maze[cc.x][cc.y+1].visited == false) {
      unvisitedNeighbours.add(maze[cc.x][cc.y+1]);
      direction.add(2);
    }
    if (cc.x != 0) if (maze[cc.x-1][cc.y].visited == false) {
      unvisitedNeighbours.add(maze[cc.x-1][cc.y]);
      direction.add(3);
    }
    if (unvisitedNeighbours.size() != 0) {
      int randomIndex = floor(random(0, direction.size()));
      Cell choosenCell = unvisitedNeighbours.get(randomIndex);
      removeWalls(cc, choosenCell, direction.get(randomIndex));
      return choosenCell;
    } else {
      return cc;
    }
  }

  void removeWalls(Cell cuc, Cell coc, int direction) {
    switch (direction) {
    case 0:
      cuc.walls[0] = false;
      coc.walls[2] = false;
      break;
    case 1:
      cuc.walls[1] = false;
      coc.walls[3] = false;
      break;
    case 2:
      cuc.walls[2] = false;
      coc.walls[0] = false;
      break;
    case 3:
      cuc.walls[3] = false;
      coc.walls[1] = false;
      break;
    }
  }

  void printMaze() {
    for (int k = 0; k < rows; k++) {
      for (int i = 0; i < cols; i++) {
        print(maze[i][k].visited + "\t");
      }
      print("\n");
    }
    for (int k = 0; k < rows; k++) {
      for (int i = 0; i < cols; i++) {
        print(maze[i][k] + "\t");
      }
      print("\n");
    }
    for (int k = 0; k < rows; k++) {
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < 4; j++) {
          if (maze[i][k].walls[j]) {
            print("1" + " ");
          } else {
            print("0" + " ");
          }
        }
        print("\t");
      }
      print("\n");
    }
  }
}
