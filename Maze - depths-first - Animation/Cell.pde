class Cell {
  Boolean visited;
  Boolean[] walls;
  int x;
  int y;
  String state;

  Cell(int i, int k) {
    visited = false;
    state = "unvisited";
    walls = new Boolean[]{true, true, true, true}; // op, højre, ned, venstre
    x = i;
    y = k;
  }
  void show(int x, int y) {
    push();
    if (state == "visited") fill(230);
    else if (state == "unvisited") fill(160);
    else if (state == "current") fill(251, 177, 23);
    noStroke();
    rect(x, y, cellSize, cellSize);
    pop();
    push();
    strokeWeight(2);
    stroke(203, 23, 43);
    if (walls[0]) line(x, y, x+cellSize, y);
    if (walls[1]) line(x+cellSize, y, x+cellSize, y+cellSize);
    if (walls[2]) line(x+cellSize, y+cellSize, x, y+cellSize);
    if (walls[3]) line(x, y+cellSize, x, y);
    pop();
  }
}
