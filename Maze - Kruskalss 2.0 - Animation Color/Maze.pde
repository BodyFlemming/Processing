import java.util.*;

class Maze {
  Cell[][] maze;
  ArrayList<Wall> walls;

  Maze() {
    maze = generateGrid();
    walls = generateWalls();
  }

  Cell[][] generateGrid() {
    Cell[][] grid = new Cell[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int k = 0; k < rows; k++) {
        grid[i][k] = new Cell(i, k, k + i * rows);
      }
    }
    return grid;
  }

  ArrayList<Wall> generateWalls() {
    ArrayList<Wall> walls = new ArrayList<Wall>();
    // Makes the horizontal walls
    for (int i = 0; i < cols - 1; i++) {
      for (int k = 0; k < rows; k++) {
        walls.add(new Wall(i * cellSize + cellSize, k * cellSize, i * cellSize + cellSize, k * cellSize + cellSize, maze[i][k], maze[i+1][k]));
      }
    }
    // Makes the vertical walls
    for (int i = 0; i < cols; i++) {
      for (int k = 0; k < rows - 1; k++) {
        walls.add(new Wall(i * cellSize, k * cellSize + cellSize, i * cellSize + cellSize, k * cellSize + cellSize, maze[i][k], maze[i][k+1]));
      }
    }
    return walls;
  }
  
  void generateMaze() {
    ArrayList<Wall> wallsToBeRemoved = new ArrayList<>();
    int[] indexArr = getShuffledArray(walls.size());
    for (int j = 0; j < walls.size(); j++) {
      int i = indexArr[j];
      Wall currentWall = walls.get(i);
      Cell n1 = currentWall.neighbour1;
      Cell n2 = currentWall.neighbour2;
      int[] n1DeepthArr = {0};
      int[] n2DeepthArr = {0};
      Cell n1Root = n1.getRoot(n1DeepthArr);
      Cell n2Root = n2.getRoot(n2DeepthArr);
      if (n1Root == n2Root) {
        continue;
      }
      wallsToBeRemoved.add(currentWall);
      int n1Deepth = n1DeepthArr[0];
      int n2Deepth = n2DeepthArr[0];
      if (n1Deepth == n2Deepth) {
        n1.parent = n2;
      } else if (n1Deepth < n2Deepth) {
        n1.parent = n2;
      } else if (n2Deepth < n1Deepth) {
        n2.parent = n1;
      }
    }
    println(wallsToBeRemoved);
    removeWalls(wallsToBeRemoved);
  }
  
  void removeWalls(ArrayList<Wall> wallsToBeRemoved) {
    for (int i = 0; i < wallsToBeRemoved.size(); i++) {
      walls.remove(wallsToBeRemoved.get(i));
    }
  }
  
  int[] getShuffledArray(int size) {
    int[] arr = new int[size];
    ArrayList<Integer> arrList = new ArrayList<>();
    for (int i = 0; i < size; i++) {
      arrList.add(i);
    }
    Collections.shuffle(arrList);
    for (int i = 0; i < arr.length; i++) {
      arr[i] = arrList.get(i);
    }
    return arr;
  }

  void printMazeCell() {
    for (int i = 0; i < cols; i++) {
      for (int k = 0; k < rows; k++) {
        print(maze[i][k].x + " " + maze[i][k].y + "\t");
      }
      print("\n");
    }
  }

  void printMazeWall() {
    // prints horizontal walls
    println("Horizontal:");
    for (int k = 0; k < rows; k++) {
      for (int i = 0; i < cols - 1; i++) {
        print(walls.get(i * cols + k).neighbour1.section + " " + walls.get(i * cols + k).neighbour2.section + "\t");
      }
      print("\n");
    }
    println("Vertical:");
    // prints vertical walls
    for (int k = 0; k < rows - 1; k++) {
      for (int i = 0; i < cols; i++) {
        print(walls.get(i * (rows - 1) + k + 20).neighbour1.section + " " + walls.get(i * (rows - 1) + k + 20).neighbour2.section + "\t");
      }
      print("\n");
    }
  }
}
