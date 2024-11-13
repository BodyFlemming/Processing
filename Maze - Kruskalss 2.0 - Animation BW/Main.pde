int cellSize;
int cols;
int rows;
Maze m;
int[] indexArr;
int j;

void setup() {
  cellSize = 40;
  frameRate(10);
  cols = 20;
  rows = 20;
  windowResize(cols * cellSize, rows * cellSize);
  m = new Maze();
  indexArr = getShuffledArray(m.walls.size());
  j = 0;
  // m.generateMaze();
  // m.printMazeCell();
  // m.printMazeWall();
}

void draw() {
  if (j >= indexArr.length / 4) frameRate(30);
  println(frameRate);
  j++;
  int l = indexArr[j];
  Wall currentWall = m.walls.get(l);
  // currentWall.currentWall = true;
  Cell n1 = currentWall.neighbour1;
  Cell n2 = currentWall.neighbour2;
  int[] n1DeepthArr = {0};
  int[] n2DeepthArr = {0};
  Cell n1Root = n1.getRoot(n1DeepthArr);
  Cell n2Root = n2.getRoot(n2DeepthArr);
  if (n1Root != n2Root) {
    
    n1.r = n1.g = n1.b = 230;
    n2.r = n2.g = n2.b = 230;
    int currentWallIndex = m.walls.indexOf(currentWall);
    for (int o = 0; o < indexArr.length; o++) {
      if (indexArr[o] >= currentWallIndex) indexArr[o]--;
    }
    m.walls.remove(currentWall);
    int n1Deepth = n1DeepthArr[0];
    int n2Deepth = n2DeepthArr[0];
    if (n1Deepth == n2Deepth) {
      n1Root.parent = n2;
    } else if (n1Deepth < n2Deepth) {
      n1Root.parent = n2;
    } else if (n2Deepth < n1Deepth) {
      n2Root.parent = n1;
    }
  }

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
  /** 
  if (n1Root != n2Root) {
    m.walls.remove(currentWall);
  }
  currentWall.currentWall = false;
  **/
  if (j == indexArr.length - 1) noLoop();
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
